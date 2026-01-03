<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Schedule;
use App\Models\User;
use App\Models\Location;
use Illuminate\Http\Request;

class ScheduleController extends Controller
{
    public function index()
    {
        $schedules = Schedule::with(['teacher', 'location'])
            ->orderBy('day')
            ->orderBy('start_time')
            ->paginate(15);
        
        return inertia('Admin/Schedules/Index', [
            'schedules' => $schedules
        ]);
    }

    public function create()
    {
        $teachers = User::where('role', 'pengajar')->where('is_active', true)->orderBy('name')->get();
        $locations = Location::orderBy('name')->get();
        
        return inertia('Admin/Schedules/Create', [
            'teachers' => $teachers,
            'locations' => $locations
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'teacher_id' => 'required|exists:users,id',
            'location_id' => 'required|exists:locations,id',
            'day' => 'required|in:monday,tuesday,wednesday,thursday,friday,saturday,sunday',
            'start_time' => 'required|date_format:H:i',
            'end_time' => 'required|date_format:H:i|after:start_time',
            'subject' => 'required|string|max:255',
            'class' => 'required|string|max:255',
        ]);

        Schedule::create($request->all());

        return redirect()->route('admin.schedules.index')
            ->with('success', 'Jadwal berhasil ditambahkan.');
    }

    public function show(Schedule $schedule)
    {
        $schedule->load(['teacher', 'location', 'attendances']);
        
        return inertia('Admin/Schedules/Show', [
            'schedule' => $schedule
        ]);
    }

    public function edit(Schedule $schedule)
    {
        $teachers = User::where('role', 'pengajar')->where('is_active', true)->orderBy('name')->get();
        $locations = Location::orderBy('name')->get();
        
        return inertia('Admin/Schedules/Edit', [
            'schedule' => $schedule,
            'teachers' => $teachers,
            'locations' => $locations
        ]);
    }

    public function update(Request $request, Schedule $schedule)
    {
        $request->validate([
            'teacher_id' => 'required|exists:users,id',
            'location_id' => 'required|exists:locations,id',
            'day' => 'required|in:monday,tuesday,wednesday,thursday,friday,saturday,sunday',
            'start_time' => 'required|date_format:H:i',
            'end_time' => 'required|date_format:H:i|after:start_time',
            'subject' => 'required|string|max:255',
            'class' => 'required|string|max:255',
        ]);

        $schedule->update($request->all());

        return redirect()->route('admin.schedules.index')
            ->with('success', 'Jadwal berhasil diperbarui.');
    }

    public function destroy(Schedule $schedule)
    {
        $schedule->delete();

        return redirect()->route('admin.schedules.index')
            ->with('success', 'Jadwal berhasil dihapus.');
    }
}
