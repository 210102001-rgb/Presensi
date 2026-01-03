<?php

namespace App\Http\Controllers;

use App\Models\Schedule;
use Inertia\Inertia;

class ScheduleController extends Controller
{
    public function index()
    {
        $schedules = Schedule::where('teacher_id', auth()->id())
            ->with('location')
            ->orderByRaw("FIELD(day, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')")
            ->orderBy('start_time')
            ->get()
            ->groupBy('day');

        return Inertia::render('Schedule/Index', [
            'schedules' => $schedules,
        ]);
    }
}
