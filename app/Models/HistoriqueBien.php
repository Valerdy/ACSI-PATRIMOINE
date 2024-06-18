<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistoriqueBien extends Model
{
    use HasFactory;

    protected $fillable = [
        'entre_id',
        'action',
        'description',
    ];

    public function entre()
    {
        return $this->belongsTo(Entre::class);
    }
}

