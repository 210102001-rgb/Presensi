<?php

namespace App\Http\Controllers;

use App\Models\Leave;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;

class LeaveController extends Controller
{
    public function index(Request $request)
    {
        $leaves = Leave::with(['schedule'])
            ->where('user_id', auth()->id())
            ->orderBy('created_at', 'desc')
            ->paginate(10);

        // Stats for current user
        $stats = [
            'total' => Leave::where('user_id', auth()->id())->count(),
            'pending' => Leave::where('user_id', auth()->id())->where('status', 'pending')->count(),
            'approved' => Leave::where('user_id', auth()->id())->where('status', 'approved')->count(),
            'rejected' => Leave::where('user_id', auth()->id())->where('status', 'rejected')->count(),
        ];

        return Inertia::render('Attendance/Leaves', [
            'leaves' => $leaves,
            'stats' => $stats,
        ]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'leave_date' => 'required|date',
            'leave_type' => 'required|in:izin,sakit,cuti',
            'reason' => 'required|string|min:10',
            'schedule_id' => 'nullable|exists:schedules,id',
            'attachment' => 'nullable|file|mimes:pdf,jpg,jpeg,png|max:2048', // 2MB max
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'error' => $validator->errors()->first(),
            ], 422);
        }

        try {
            $data = [
                'user_id' => auth()->id(),
                'leave_date' => $request->leave_date,
                'leave_type' => $request->leave_type,
                'reason' => $request->reason,
                'schedule_id' => $request->schedule_id,
                'status' => 'pending',
            ];

            // Handle file upload
            if ($request->hasFile('attachment')) {
                $file = $request->file('attachment');
                $filename = time() . '_' . $file->getClientOriginalName();
                $path = $file->storeAs('leaves', $filename, 'public');
                $data['attachment'] = $path;
            }

            $leave = Leave::create($data);

            return response()->json([
                'success' => true,
                'message' => 'Pengajuan izin berhasil dikirim dan menunggu persetujuan admin.',
                'data' => $leave,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => 'Gagal menyimpan data: ' . $e->getMessage(),
            ], 500);
        }
    }
}
