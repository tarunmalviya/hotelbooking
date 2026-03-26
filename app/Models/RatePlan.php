<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RatePlan extends Model
{
    protected $fillable = ['room_type_id', 'name', 'meal_plan'];

    public function roomType()
    {
        return $this->belongsTo(RoomType::class);
    }

    public function discounts()
    {
        return $this->hasMany(Discount::class);
    }
}
