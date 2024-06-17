<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEtatsLocalisationsBiensTable extends Migration
{
    public function up()
    {
        Schema::create('etats_localisations_biens', function (Blueprint $table) {
            $table->id();
            $table->foreignId('bien_id')->constrained('biens')->onDelete('cascade');
            $table->string('etat');
            $table->string('localisation');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('etats_localisations_biens');
    }
}
