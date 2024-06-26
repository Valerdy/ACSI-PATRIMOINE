<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Livraison extends Model
{
    use HasFactory;

    protected $fillable = [
        'commande_id',
        'date_livraison',
        'details',
    ];

    public function commande()
    {
        return $this->belongsTo(Commande::class);
    }
}

