<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Attendance;
use App\Models\User;
use App\Models\Schedule;
use Illuminate\Http\Request;

class AttendanceController extends Controller
{
    public function index(Request $request)
    {
        $query = Attendance::with(['teacher', 'schedule.location', 'approvedBy']);

        // Filter by teacher
        if ($request->filled('teacher_id')) {
            $query->where('teacher_id', $request->teacher_id);
        }

        // Filter by date range
        if ($request->filled('date_from')) {
            $query->whereDate('date', '>=', $request->date_from);
        }

        if ($request->filled('date_to')) {
            $query->whereDate('date', '<=', $request->date_to);
        }

        // Filter by status
        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        // Filter by approval status
        if ($request->filled('approval_status')) {
            $query->where('approval_status', $request->approval_status);
        }

        $attendances = $query->orderBy('date', 'desc')
            ->orderBy('check_in_time', 'desc')
            ->paginate(20);

        $teachers = User::where('role', 'pengajar')->orderBy('name')->get();

        return inertia('Admin/Attendances/Index', [
            'attendances' => $attendances,
            'teachers' => $teachers,
            'filters' => $request->only(['teacher_id', 'date_from', 'date_to', 'status', 'approval_status'])
        ]);
    }

    public function show(Attendance $attendance)
    {
        $attendance->load(['teacher', 'schedule.location', 'approvedBy']);

        return inertia('Admin/Attendances/Show', [
            'attendance' => $attendance
        ]);
    }

    public function edit(Attendance $attendance)
    {
        $attendance->load(['teacher', 'schedule.location']);

        return inertia('Admin/Attendances/Edit', [
            'attendance' => $attendance
        ]);
    }

    public function update(Request $request, Attendance $attendance)
    {
        $request->validate([
            'status' => 'required|in:hadir,terlambat,izin,alpha',
            'check_in_time' => 'nullable|date_format:H:i:s',
            'check_out_time' => 'nullable|date_format:H:i:s|after:check_in_time',
            'notes' => 'nullable|string|max:1000',
        ]);

        $attendance->update($request->all());

        return redirect()->route('admin.attendances.index')
            ->with('success', 'Presensi berhasil diperbarui.');
    }

    public function destroy(Attendance $attendance)
    {
        $attendance->delete();

        return redirect()->route('admin.attendances.index')
            ->with('success', 'Presensi berhasil dihapus.');
    }

    public function create()
    {
        $teachers = User::where('role', 'pengajar')->orderBy('name')->get();
        $schedules = Schedule::with(['teacher', 'location'])->orderBy('day')->get();

        return inertia('Admin/Attendances/Create', [
            'teachers' => $teachers,
            'schedules' => $schedules
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'teacher_id' => 'required|exists:users,id',
            'schedule_id' => 'required|exists:schedules,id',
            'date' => 'required|date',
            'status' => 'required|in:hadir,terlambat,izin,alpha',
            'check_in_time' => 'nullable|date_format:H:i:s',
            'check_out_time' => 'nullable|date_format:H:i:s|after:check_in_time',
            'notes' => 'nullable|string|max:1000',
        ]);

        Attendance::create($request->all());

        return redirect()->route('admin.attendances.index')
            ->with('success', 'Presensi berhasil ditambahkan.');
    }

    public function approve(Attendance $attendance, Request $request)
    {
        $request->validate([
            'approval_note' => 'nullable|string|max:500',
        ]);

        $attendance->update([
            'approval_status' => 'approved',
            'approval_note' => $request->approval_note,
            'approved_by' => auth()->id(),
            'approved_at' => now(),
        ]);

        return redirect()->back()
            ->with('success', 'Presensi berhasil disetujui.');
    }

    public function reject(Attendance $attendance, Request $request)
    {
        $request->validate([
            'approval_note' => 'required|string|max:500',
        ], [
            'approval_note.required' => 'Catatan penolakan wajib diisi.'
        ]);

        $attendance->update([
            'approval_status' => 'rejected',
            'approval_note' => $request->approval_note,
            'approved_by' => auth()->id(),
            'approved_at' => now(),
        ]);

        return redirect()->back()
            ->with('success', 'Presensi berhasil ditolak.');
    }
}
