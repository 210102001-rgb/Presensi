<?php

namespace App\Http\Controllers;

use App\Models\Attendance;
use App\Models\Schedule;
use Carbon\Carbon;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index()
    {
        $user = auth()->user();

        // Statistik presensi bulan ini
        $thisMonth = Attendance::where('teacher_id', $user->id)
            ->whereMonth('date', Carbon::now()->month)
            ->whereYear('date', Carbon::now()->year)
            ->get();

        $stats = [
            'hadir' => $thisMonth->where('status', 'hadir')->count(),
            'terlambat' => $thisMonth->where('status', 'terlambat')->count(),
            'izin' => $thisMonth->where('status', 'izin')->count(),
            'alpha' => $thisMonth->where('status', 'alpha')->count(),
            'total' => $thisMonth->count(),
        ];

        // Jadwal hari ini
        $today = Carbon::now()->format('l');
        $todaySchedules = Schedule::where('teacher_id', $user->id)
            ->where('day', $today)
            ->where('is_active', true)
            ->with(['location', 'attendances' => function ($query) {
                $query->where('date', Carbon::today());
            }])
            ->orderBy('start_time')
            ->get();

        // Presensi terakhir
        $recentAttendances = Attendance::where('teacher_id', $user->id)
            ->with('schedule.location')
            ->orderBy('date', 'desc')
            ->orderBy('check_in_time', 'desc')
            ->limit(5)
            ->get();

        return Inertia::render('Dashboard', [
            'stats' => $stats,
            'todaySchedules' => $todaySchedules,
            'recentAttendances' => $recentAttendances,
        ]);
    }
}
