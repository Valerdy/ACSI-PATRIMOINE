<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EtatLocalisationBien extends Model
{
    use HasFactory;

    protected $fillable = [
        'bien_id',
        'etat',
        'localisation',
    ];

    public function bien()
    {
        return $this->belongsTo(Bien::class);
    }
}
