<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Leave;
use App\Models\Attendance;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class LeaveController extends Controller
{
    public function index(Request $request)
    {
        $query = Leave::with(['user', 'schedule.location']);

        if ($request->search) {
            $query->whereHas('user', function ($q) use ($request) {
                $q->where('name', 'like', '%' . $request->search . '%');
            });
        }

        if ($request->status) {
            $query->where('status', $request->status);
        }
        
        if ($request->leave_type) {
            $query->where('leave_type', $request->leave_type);
        }

        $leaves = $query->orderBy('created_at', 'desc')
            ->paginate(15);
            
        // Stats for admin dashboard
        $stats = [
            'total' => Leave::count(),
            'pending' => Leave::where('status', 'pending')->count(),
            'approved' => Leave::where('status', 'approved')->count(),
            'rejected' => Leave::where('status', 'rejected')->count(),
        ];

        return inertia('Admin/Leaves/Index', [
            'leaves' => $leaves,
            'stats' => $stats,
            'filters' => $request->only(['search', 'status', 'leave_type']),
        ]);
    }

    public function show(Leave $leave)
    {
        $leave->load(['user', 'schedule.location', 'approvedBy']);
        
        return inertia('Admin/Leaves/Show', [
            'leave' => $leave
        ]);
    }
    
    public function approve(Request $request, Leave $leave)
    {
        $request->validate([
            'admin_note' => 'nullable|string|max:500',
        ]);

        $leave->update([
            'status' => 'approved',
            'admin_note' => $request->admin_note,
            'approved_by' => auth()->id(),
            'approved_at' => now(),
        ]);

        // Create or update attendance record with 'izin' status
        $attendance = Attendance::where('teacher_id', $leave->user_id)
            ->where('schedule_id', $leave->schedule_id)
            ->where('date', $leave->leave_date)
            ->first();

        if ($attendance) {
            // Update existing attendance
            $attendance->update([
                'status' => 'izin',
                'notes' => 'Izin disetujui: ' . $leave->reason,
            ]);
        } else {
            // Create new attendance record with 'izin' status
            Attendance::create([
                'teacher_id' => $leave->user_id,
                'schedule_id' => $leave->schedule_id,
                'date' => $leave->leave_date,
                'status' => 'izin',
                'notes' => 'Izin disetujui: ' . $leave->reason,
            ]);
        }

        return redirect()->back()
            ->with('success', 'Izin berhasil disetujui.');
    }
    
    public function reject(Request $request, Leave $leave)
    {
        $request->validate([
            'admin_note' => 'required|string|max:500',
        ]);

        $leave->update([
            'status' => 'rejected',
            'admin_note' => $request->admin_note,
            'approved_by' => auth()->id(),
            'approved_at' => now(),
        ]);

        return redirect()->back()
            ->with('success', 'Izin berhasil ditolak.');
    }

    public function update(Request $request, Leave $leave)
    {
        $request->validate([
            'status' => 'required|in:approved,rejected',
            'admin_note' => 'nullable|string|max:500',
        ]);

        $leave->update([
            'status' => $request->status,
            'admin_note' => $request->admin_note,
            'approved_by' => auth()->id(),
            'approved_at' => now(),
        ]);

        // If the leave is approved, update or create attendance record with 'izin' status
        if ($request->status === 'approved') {
            // Check if there's already an attendance record for this date and schedule
            $attendance = Attendance::where('teacher_id', $leave->user_id)
                ->where('schedule_id', $leave->schedule_id)
                ->where('date', $leave->leave_date)
                ->first();

            if ($attendance) {
                // Update existing attendance
                $attendance->update([
                    'status' => 'izin',
                    'notes' => 'Izin disetujui: ' . $leave->reason,
                ]);
            } else {
                // Create new attendance record with 'izin' status
                Attendance::create([
                    'teacher_id' => $leave->user_id,
                    'schedule_id' => $leave->schedule_id,
                    'date' => $leave->leave_date,
                    'status' => 'izin',
                    'notes' => 'Izin disetujui: ' . $leave->reason,
                ]);
            }
        }

        return redirect()->back()
            ->with('success', 'Status izin berhasil diperbarui.');
    }

    public function destroy(Leave $leave)
    {
        if ($leave->status === 'approved') {
            return back()->with('error', 'Izin yang sudah disetujui tidak dapat dihapus.');
        }

        // Delete attachment if exists
        if ($leave->attachment) {
            Storage::disk('public')->delete($leave->attachment);
        }

        $leave->delete();

        return redirect()->route('admin.leaves.index')
            ->with('success', 'Izin berhasil dihapus.');
    }
}