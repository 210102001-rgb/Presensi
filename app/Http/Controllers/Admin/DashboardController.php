<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Schedule;
use App\Models\Location;
use App\Models\Attendance;
use Illuminate\Http\Request;
use Carbon\Carbon;

class DashboardController extends Controller
{
    public function index()
    {
        // Get statistics
        $stats = [
            'total_teachers' => User::where('role', 'pengajar')->count(),
            'active_teachers' => User::where('role', 'pengajar')->where('is_active', true)->count(),
            'total_schedules' => Schedule::count(),
            'total_locations' => Location::count(),
            'today_attendances' => Attendance::whereDate('date', today())->count(),
            'this_month_attendances' => Attendance::whereMonth('date', now()->month)
                ->whereYear('date', now()->year)
                ->count(),
        ];

        // Get attendance statistics by status
        $attendanceStats = [
            'hadir' => Attendance::whereMonth('date', now()->month)
                ->whereYear('date', now()->year)
                ->where('status', 'hadir')
                ->count(),
            'terlambat' => Attendance::whereMonth('date', now()->month)
                ->whereYear('date', now()->year)
                ->where('status', 'terlambat')
                ->count(),
            'izin' => Attendance::whereMonth('date', now()->month)
                ->whereYear('date', now()->year)
                ->where('status', 'izin')
                ->count(),
            'alpha' => Attendance::whereMonth('date', now()->month)
                ->whereYear('date', now()->year)
                ->where('status', 'alpha')
                ->count(),
        ];

        // Get recent attendances
        $recentAttendances = Attendance::with(['teacher', 'schedule.location'])
            ->orderBy('date', 'desc')
            ->orderBy('check_in_time', 'desc')
            ->limit(10)
            ->get();

        // Get teachers with most attendances this month
        $topTeachers = User::where('role', 'pengajar')
            ->withCount(['attendances' => function ($query) {
                $query->whereMonth('date', now()->month)
                    ->whereYear('date', now()->year)
                    ->where('status', 'hadir');
            }])
            ->orderBy('attendances_count', 'desc')
            ->limit(5)
            ->get();

        // Get today's schedules
        $todaySchedules = Schedule::with(['teacher', 'location'])
            ->where('day', strtolower(now()->format('l')))
            ->orderBy('start_time')
            ->get();

        return inertia('Admin/Dashboard', [
            'stats' => $stats,
            'attendanceStats' => $attendanceStats,
            'recentAttendances' => $recentAttendances,
            'topTeachers' => $topTeachers,
            'todaySchedules' => $todaySchedules,
        ]);
    }
}
