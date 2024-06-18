<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Entre extends Model
{
    use HasFactory;
    protected $guarded=[];

    public function fournisseur(){
        return $this->belongsTo(Fournisseur::class);
    }

    public function bien(){
        return $this->belongsTo(Bien::class);
    }

    public function historiquebien()
    {
        return $this->belongsTo(HistoriqueBien::class);
    }
}
