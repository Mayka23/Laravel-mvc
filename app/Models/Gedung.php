<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gedung extends Model
{
    use HasFactory;

    public function rGedungPhoto()
    {
        return $this->hasMany(GedungPhoto::class);
    }
}
