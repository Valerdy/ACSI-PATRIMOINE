<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Bien extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $guarded=[];

    protected $dates = ['deleted_at'];

    protected static function boot()
    {
        parent::boot();

        static::deleting(function ($bien) {
            $bien->etat = 'supprimé';
            $bien->save();
        });

        static::restoring(function ($bien) {
            $bien->etat = 'actif';
            $bien->save();
        });
    }

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

    public function entres()
    {
        return $this->hasMany(Entre::class);
    }
}

