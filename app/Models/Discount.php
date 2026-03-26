<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Discount extends Model
{
    public function ratePlan(){
        return $this->belongsTo(RatePlan::class);
    }

}
