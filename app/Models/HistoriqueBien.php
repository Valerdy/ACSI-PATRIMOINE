<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistoriqueBien extends Model
{
    use HasFactory;

    protected $fillable = [
        'bien_id',
        'action',
        'description',
    ];

    public function bien()
    {
        return $this->belongsTo(Bien::class);
    }
}

