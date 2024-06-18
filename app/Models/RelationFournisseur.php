<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RelationFournisseur extends Model
{
    use HasFactory;

    protected $fillable = [
        'fournisseur_id',
        'relation',
    ];

    public function fournisseur()
    {
        return $this->belongsTo(Fournisseur::class);
    }
}

