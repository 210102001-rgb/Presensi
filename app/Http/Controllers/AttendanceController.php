<?php

namespace App\Http\Controllers;

use App\Models\Attendance;
use App\Models\Schedule;
use App\Models\Leave;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Inertia\Inertia;

class AttendanceController extends Controller
{
    public function index()
    {
        $user = auth()->user();
        $today = Carbon::now()->format('l');
        $todayDate = Carbon::today();

        $schedules = Schedule::where('teacher_id', $user->id)
            ->where('day', $today)
            ->where('is_active', true)
            ->with(['location', 'attendances' => function ($query) use ($todayDate) {
                $query->where('date', $todayDate);
            }])
            ->orderBy('start_time')
            ->get();

        // Check for approved leaves for today
        $approvedLeaves = Leave::where('user_id', $user->id)
            ->where('leave_date', $todayDate)
            ->where('status', 'approved')
            ->get()
            ->keyBy('schedule_id'); // Key by schedule_id for easy lookup

        // Modify schedules to include leave status
        foreach ($schedules as $schedule) {
            // Check if there's an approved leave for this schedule
            if (isset($approvedLeaves[$schedule->id])) {
                // If there's no attendance record yet, create one with 'izin' status
                if ($schedule->attendances->isEmpty()) {
                    $attendance = new Attendance();
                    $attendance->teacher_id = $user->id;
                    $attendance->schedule_id = $schedule->id;
                    $attendance->date = $todayDate;
                    $attendance->status = 'izin';
                    $attendance->notes = 'Izin disetujui: ' . $approvedLeaves[$schedule->id]->reason;
                    $schedule->attendances = collect([$attendance]);
                } else {
                    // If attendance exists, update its status to 'izin'
                    foreach ($schedule->attendances as $attendance) {
                        $attendance->status = 'izin';
                        $attendance->notes = 'Izin disetujui: ' . $approvedLeaves[$schedule->id]->reason;
                    }
                }
            } else {
                // If no approved leave and no attendance, mark as 'alpha' if the time has passed
                $scheduleEndTime = Carbon::createFromFormat('H:i:s', $schedule->end_time);
                if ($schedule->attendances->isEmpty() && Carbon::now()->gt($scheduleEndTime)) {
                    $attendance = new Attendance();
                    $attendance->teacher_id = $user->id;
                    $attendance->schedule_id = $schedule->id;
                    $attendance->date = $todayDate;
                    $attendance->status = 'alpha';
                    $schedule->attendances = collect([$attendance]);
                }
            }
        }

        return Inertia::render('Attendance/Index', [
            'schedules' => $schedules,
        ]);
    }

    public function checkIn(Request $request)
    {
        // Debug CSRF token
        Log::info('=== CHECK-IN DEBUG ===');
        Log::info('Request method: ' . $request->method());
        Log::info('Request URL: ' . $request->fullUrl());
        Log::info('CSRF Token from header: ' . $request->header('X-CSRF-TOKEN'));
        Log::info('CSRF Token from form: ' . $request->input('_token'));
        Log::info('CSRF Token from session: ' . csrf_token());
        Log::info('Session ID: ' . session()->getId());
        Log::info('Session driver: ' . config('session.driver'));
        Log::info('Session lifetime: ' . config('session.lifetime'));
        Log::info('All headers: ' . json_encode($request->headers->all()));
        Log::info('All inputs: ' . json_encode($request->all()));

        $validated = $request->validate([
            'schedule_id' => 'required|exists:schedules,id',
            'latitude' => 'required|numeric',
            'longitude' => 'required|numeric',
            'selfie' => 'required|file|max:5120',
        ]);

        $schedule = Schedule::with('location')->findOrFail($validated['schedule_id']);

        // Cek apakah sudah check-in hari ini
        $existing = Attendance::where('teacher_id', auth()->id())
            ->where('schedule_id', $schedule->id)
            ->where('date', Carbon::today())
            ->first();

        if ($existing && $existing->check_in_time) {
            return response()->json(['error' => 'Anda sudah melakukan check-in untuk jadwal ini.'], 422);
        }

        // Hitung jarak
        $distance = $this->calculateDistance(
            $validated['latitude'],
            $validated['longitude'],
            $schedule->location->latitude,
            $schedule->location->longitude
        );

        // Validasi radius
        if ($distance > $schedule->location->radius) {
            return response()->json([
                'error' => 'Anda berada di luar radius lokasi presensi. Jarak Anda: ' . round($distance) . ' meter dari lokasi.'
            ], 422);
        }

        // Upload foto selfie
        $selfiePath = $this->uploadSelfie($request->file('selfie'), 'check-in');

        // Tentukan status
        $now = Carbon::now();
        $scheduleStart = Carbon::createFromFormat('H:i:s', $schedule->start_time);
        $status = $now->gt($scheduleStart) ? 'terlambat' : 'hadir';

        // Simpan presensi
        try {
            $attendance = Attendance::updateOrCreate(
                [
                    'teacher_id' => auth()->id(),
                    'schedule_id' => $schedule->id,
                    'date' => Carbon::today(),
                ],
                [
                    'check_in_time' => $now->format('H:i:s'),
                    'check_in_latitude' => $validated['latitude'],
                    'check_in_longitude' => $validated['longitude'],
                    'check_in_selfie' => $selfiePath,
                    'status' => $status,
                ]
            );

            // Pastikan kita mendapatkan instance model yang fresh dengan ID
            $attendance = $attendance->fresh();

            Log::info('Attendance saved successfully:', [
                'attendance_id' => $attendance ? $attendance->id : null,
                'teacher_id' => auth()->id(),
                'schedule_id' => $schedule->id,
                'date' => Carbon::today(),
                'check_in_time' => $now->format('H:i:s'),
                'status' => $status
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Check-in berhasil! Status: ' . ucfirst($status),
                'attendance' => $attendance
            ]);
        } catch (\Exception $e) {
            Log::error('Failed to save attendance:', [
                'error' => $e->getMessage(),
                'teacher_id' => auth()->id(),
                'schedule_id' => $schedule->id,
                'date' => Carbon::today()
            ]);

            return response()->json(['error' => 'Gagal menyimpan presensi: ' . $e->getMessage()], 500);
        }
    }

    public function checkOut(Request $request)
    {
        // Debug CSRF token
        Log::info('=== CHECK-OUT DEBUG ===');
        Log::info('Request method: ' . $request->method());
        Log::info('Request URL: ' . $request->fullUrl());
        Log::info('CSRF Token from header: ' . $request->header('X-CSRF-TOKEN'));
        Log::info('CSRF Token from form: ' . $request->input('_token'));
        Log::info('CSRF Token from session: ' . csrf_token());
        Log::info('Session ID: ' . session()->getId());
        Log::info('All headers: ' . json_encode($request->headers->all()));
        Log::info('All inputs: ' . json_encode($request->all()));

        $validated = $request->validate([
            'schedule_id' => 'required|exists:schedules,id',
            'latitude' => 'required|numeric',
            'longitude' => 'required|numeric',
            'selfie' => 'required|image|mimes:jpeg,png,jpg|max:2048',
        ]);

        $attendance = Attendance::where('teacher_id', auth()->id())
            ->where('schedule_id', $validated['schedule_id'])
            ->where('date', Carbon::today())
            ->firstOrFail();

        if (!$attendance->check_in_time) {
            return response()->json(['error' => 'Anda belum melakukan check-in.'], 422);
        }

        if ($attendance->check_out_time) {
            return response()->json(['error' => 'Anda sudah melakukan check-out.'], 422);
        }

        // Upload foto selfie
        $selfiePath = $this->uploadSelfie($request->file('selfie'), 'check-out');

        try {
            $attendance->update([
                'check_out_time' => Carbon::now()->format('H:i:s'),
                'check_out_latitude' => $validated['latitude'],
                'check_out_longitude' => $validated['longitude'],
                'check_out_selfie' => $selfiePath,
            ]);

            Log::info('Check-out saved successfully:', [
                'attendance_id' => $attendance->id,
                'teacher_id' => auth()->id(),
                'schedule_id' => $validated['schedule_id'],
                'check_out_time' => Carbon::now()->format('H:i:s')
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Check-out berhasil!',
                'attendance' => $attendance
            ]);
        } catch (\Exception $e) {
            Log::error('Failed to save check-out:', [
                'error' => $e->getMessage(),
                'attendance_id' => $attendance->id,
                'teacher_id' => auth()->id(),
                'schedule_id' => $validated['schedule_id']
            ]);

            return response()->json(['error' => 'Gagal menyimpan check-out: ' . $e->getMessage()], 500);
        }
    }

    public function history(Request $request)
    {
        $user = auth()->user();
        $query = Attendance::where('teacher_id', $user->id)
            ->with('schedule.location');

        // Filter
        if ($request->month) {
            $query->whereMonth('date', $request->month);
        }
        if ($request->year) {
            $query->whereYear('date', $request->year);
        }
        if ($request->status) {
            $query->where('status', $request->status);
        }

        $attendances = $query->orderBy('date', 'desc')
            ->orderBy('check_in_time', 'desc')
            ->paginate(20);

        // Get approved leaves for the user
        $leaveQuery = Leave::where('user_id', $user->id)
            ->where('status', 'approved')
            ->with('schedule.location');

        // Apply same filters to leaves
        if ($request->month) {
            $leaveQuery->whereMonth('leave_date', $request->month);
        }
        if ($request->year) {
            $leaveQuery->whereYear('leave_date', $request->year);
        }

        $approvedLeaves = $leaveQuery->get();

        // Add approved leaves as attendance records with 'izin' status
        $leaveAttendances = [];
        foreach ($approvedLeaves as $leave) {
            // Check if there's already an attendance record for this date and schedule
            $existingAttendance = $attendances->first(function ($attendance) use ($leave) {
                return $attendance->date->format('Y-m-d') === $leave->leave_date->format('Y-m-d') 
                    && $attendance->schedule_id == $leave->schedule_id;
            });

            // If no existing attendance, create a fake attendance record for display
            if (!$existingAttendance) {
                $attendance = new Attendance();
                $attendance->id = 'leave_' . $leave->id; // Fake ID to distinguish
                $attendance->teacher_id = $user->id;
                $attendance->schedule_id = $leave->schedule_id;
                $attendance->date = $leave->leave_date;
                $attendance->status = 'izin';
                $attendance->notes = 'Izin disetujui: ' . $leave->reason;
                $attendance->schedule = $leave->schedule;
                $leaveAttendances[] = $attendance;
            }
        }

        // Merge leave attendances with regular attendances
        $allAttendances = collect(array_merge($attendances->items(), $leaveAttendances));
        
        // Sort by date desc
        $allAttendances = $allAttendances->sortByDesc('date')->values();
        
        // Create a new paginator with merged data
        $mergedAttendances = new \Illuminate\Pagination\LengthAwarePaginator(
            $allAttendances,
            $attendances->total() + count($leaveAttendances),
            $attendances->perPage(),
            $attendances->currentPage(),
            ['path' => $request->url(), 'pageName' => 'page']
        );

        return Inertia::render('Attendance/History', [
            'attendances' => $mergedAttendances,
            'filters' => $request->only(['month', 'year', 'status']),
        ]);
    }

    private function calculateDistance($lat1, $lon1, $lat2, $lon2)
    {
        $earthRadius = 6371000; // meter

        $latFrom = deg2rad($lat1);
        $lonFrom = deg2rad($lon1);
        $latTo = deg2rad($lat2);
        $lonTo = deg2rad($lon2);

        $latDelta = $latTo - $latFrom;
        $lonDelta = $lonTo - $lonFrom;

        $a = sin($latDelta / 2) * sin($latDelta / 2) +
            cos($latFrom) * cos($latTo) *
            sin($lonDelta / 2) * sin($lonDelta / 2);

        $c = 2 * atan2(sqrt($a), sqrt(1 - $a));

        return $earthRadius * $c;
    }

    private function uploadSelfie($file, $type)
    {
        try {
            $filename = auth()->id() . '_' . $type . '_' . time() . '.' . $file->getClientOriginalExtension();
            
            // Pastikan direktori ada
            $directory = public_path('storage/selfies');
            if (!file_exists($directory)) {
                mkdir($directory, 0755, true);
            }
            
            // Simpan file langsung ke public/storage/selfies
            $file->move($directory, $filename);
            $path = 'selfies/' . $filename;
            
            Log::info('Selfie uploaded successfully', [
                'path' => $path,
                'filename' => $filename,
                'directory' => $directory,
                'user_id' => auth()->id()
            ]);
            return $path;
        } catch (\Exception $e) {
            Log::error('Failed to upload selfie', [
                'error' => $e->getMessage(),
                'user_id' => auth()->id()
            ]);
            throw $e;
        }
    }
}