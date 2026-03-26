<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\RoomType;
use App\Models\RatePlan;
use App\Models\Discount;
use App\Models\Inventory;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        \DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        // Clear old data
        \DB::table('room_types')->truncate();
        \DB::table('rate_plans')->truncate();
        \DB::table('discounts')->truncate();
        \DB::table('inventories')->truncate();

        // ROOM TYPES
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

        // RATE PLANS
        $ratePlans = RatePlan::insert([
            ['room_type_id' => $standard->id, 'name' => 'EP', 'meal_plan' => 'room_only'],
            ['room_type_id' => $standard->id, 'name' => 'CP', 'meal_plan' => 'breakfast'],

            ['room_type_id' => $deluxe->id, 'name' => 'CP', 'meal_plan' => 'breakfast'],
            ['room_type_id' => $deluxe->id, 'name' => 'MAP', 'meal_plan' => 'all_meals'],
        ]);

        // GET inserted rate plans (needed for discount mapping)
        $ratePlans = RatePlan::all();

        // DISCOUNTS
        foreach ($ratePlans as $plan) {

            if ($plan->name === 'EP') {
                Discount::create([
                    'rate_plan_id' => $plan->id,
                    'type' => 'early_bird',
                    'value' => 5,
                    'days_before_checkin' => 5
                ]);
            }

            if (in_array($plan->name, ['CP', 'MAP'])) {
                Discount::create([
                    'rate_plan_id' => $plan->id,
                    'type' => 'early_bird',
                    'value' => 10,
                    'days_before_checkin' => 5
                ]);
            }
        }

        // INVENTORY (next 30 days)
        $start = now();
        $end = now()->addDays(30);

        while ($start <= $end) {

            Inventory::create([
                'room_type_id' => $standard->id,
                'date' => $start,
                'available_rooms' => 5,
                'price' => rand(2000, 3000)
            ]);

            Inventory::create([
                'room_type_id' => $deluxe->id,
                'date' => $start,
                'available_rooms' => 5,
                'price' => rand(4000, 6000)
            ]);

            $start->addDay();
        }
        \DB::statement('SET FOREIGN_KEY_CHECKS=1;');
    }
}