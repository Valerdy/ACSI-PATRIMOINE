<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bien extends Model
{
    use HasFactory;

    protected $fillable = [
        'nom',
        'description',
        'prix',
        'categorie',
        'date_acquisition'
    ];

    public function historique()
    {
        return $this->hasMany(HistoriqueBien::class);
    }

    public function etatLocalisation()
    {
        return $this->hasMany(EtatLocalisationBien::class);
    }

    public function stocks()
    {
        return $this->hasMany(Stock::class);
    }
}

