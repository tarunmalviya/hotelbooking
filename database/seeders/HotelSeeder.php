<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\RoomType;
use App\Models\Inventory;
use App\Models\Discount;
class HotelSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
public function run()
{
    // Create Room Types
    $standard = RoomType::create([
        'name' => 'Standard',
        'max_occupancy' => 3,
        'total_rooms' => 5
    ]);

    $deluxe = RoomType::create([
        'name' => 'Deluxe',
        'max_occupancy' => 4,
        'total_rooms' => 5
    ]);
    

    // Create Inventory for next 30 days
    for ($i = 0; $i < 30; $i++) {
        $date = now()->addDays($i);

        foreach ([$standard, $deluxe] as $room) {
            Inventory::create([
                'room_type_id' => $room->id,
                'date' => $date,
                'available_rooms' => 5,
                'price' => $room->name == 'Standard' ? 2000 : 3500
            ]);
        }
    }

    // Discounts
    Discount::create([
        'type' => 'long_stay',
        'value' => 10,
        'min_days' => 3
    ]);

    Discount::create([
        'type' => 'last_minute',
        'value' => 15,
        'days_before_checkin' => 2
    ]);
}
}
