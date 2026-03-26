<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RoomType extends Model
{

    public function ratePlans(){
        return $this->hasMany(RatePlan::class);
    }

}
