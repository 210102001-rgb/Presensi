<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Schedule extends Model
{
    protected $fillable = [
        'teacher_id',
        'location_id',
        'subject',
        'class',
        'day',
        'start_time',
        'end_time',
        'is_active',
    ];

    protected $casts = [
        'is_active' => 'boolean',
    ];

    // Relationships
    public function teacher()
    {
        return $this->belongsTo(User::class, 'teacher_id');
    }

    public function location()
    {
        return $this->belongsTo(Location::class);
    }

    public function attendances()
    {
        return $this->hasMany(Attendance::class);
    }

    // Helper methods
    public function getTodayAttendance()
    {
        return $this->attendances()
            ->where('date', Carbon::today())
            ->first();
    }

    public function isToday()
    {
        return $this->day === Carbon::now()->format('l');
    }
}
