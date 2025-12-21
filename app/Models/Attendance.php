<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Attendance extends Model
{
    protected $fillable = [
        'teacher_id',
        'schedule_id',
        'date',
        'check_in_time',
        'check_out_time',
        'check_in_latitude',
        'check_in_longitude',
        'check_out_latitude',
        'check_out_longitude',
        'check_in_selfie',
        'check_out_selfie',
        'status',
        'notes',
        'approval_status',
        'approval_note',
        'approved_by',
        'approved_at',
    ];

    protected $casts = [
        'date' => 'date',
        'check_in_latitude' => 'decimal:8',
        'check_in_longitude' => 'decimal:8',
        'check_out_latitude' => 'decimal:8',
        'check_out_longitude' => 'decimal:8',
        'approved_at' => 'datetime',
    ];

    // Relationships
    public function teacher()
    {
        return $this->belongsTo(User::class, 'teacher_id');
    }

    public function schedule()
    {
        return $this->belongsTo(Schedule::class);
    }

    public function approvedBy()
    {
        return $this->belongsTo(User::class, 'approved_by');
    }

    // Helper methods
    public function hasCheckedIn()
    {
        return !is_null($this->check_in_time);
    }

    public function hasCheckedOut()
    {
        return !is_null($this->check_out_time);
    }

    // Check if this attendance record represents an approved leave
    public function isLeave()
    {
        return $this->status === 'izin' && strpos($this->notes, 'Izin disetujui:') === 0;
    }

    // Check if this attendance record represents an absence
    public function isAbsent()
    {
        return $this->status === 'alpha';
    }

    // Check if attendance is approved
    public function isApproved()
    {
        return $this->approval_status === 'approved';
    }

    // Check if attendance is rejected
    public function isRejected()
    {
        return $this->approval_status === 'rejected';
    }

    // Check if attendance is pending approval
    public function isPending()
    {
        return $this->approval_status === 'pending';
    }
}
