<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRelationsFournisseursTable extends Migration
{
    public function up()
    {
        Schema::create('relations_fournisseurs', function (Blueprint $table) {
            $table->id();
            $table->foreignId('fournisseur_id')->constrained('fournisseurs')->onDelete('cascade');
            $table->string('relation');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('relations_fournisseurs');
    }
}

