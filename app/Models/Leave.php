<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Leave extends Model
{
    protected $fillable = [
        'user_id',
        'schedule_id',
        'leave_date',
        'leave_type',
        'reason',
        'attachment',
        'status',
        'admin_note',
        'approved_by',
        'approved_at',
    ];

    protected $casts = [
        'leave_date' => 'date',
        'approved_at' => 'datetime',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function schedule(): BelongsTo
    {
        return $this->belongsTo(Schedule::class);
    }

    public function approvedBy(): BelongsTo
    {
        return $this->belongsTo(User::class, 'approved_by');
    }

    // Check if the leave is approved
    public function isApproved(): bool
    {
        return $this->status === 'approved';
    }

    // Check if the leave is pending
    public function isPending(): bool
    {
        return $this->status === 'pending';
    }

    // Check if the leave is rejected
    public function isRejected(): bool
    {
        return $this->status === 'rejected';
    }
}