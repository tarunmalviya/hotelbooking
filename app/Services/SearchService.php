<?php

namespace App\Services;

use App\Models\RoomType;
use App\Models\Inventory;
use App\Models\Booking;
use App\Models\Discount;
use Carbon\Carbon;
use Carbon\CarbonPeriod;

class SearchService
{
    public function search($data)
    {
        $checkIn = Carbon::parse($data['check_in']);
        $checkOut = Carbon::parse($data['check_out']);
        $days = $checkIn->diffInDays($checkOut);

        $roomTypes = RoomType::all();
        $results = [];

        foreach ($roomTypes as $room) {

            // Skip if guests exceed capacity
            if ($data['guests'] > $room->capacity) {
                continue;
            }

            $isAvailable = $this->checkAvailability($room, $checkIn, $checkOut);

            if ($isAvailable) {
                $pricing = $this->calculatePrice($room, $checkIn, $checkOut, $days, $data['meal_plan']);
            } else {
                $pricing = [
                    'base_price' => 0,
                    'final_price' => 0,
                    'discounts' => []
                ];
            }

            $results[] = [
                'room_type' => $room->name,
                'available' => $isAvailable,
                'base_price' => $pricing['base_price'],
                'final_price' => $pricing['final_price'],
                'price_per_night' => $days ? round($pricing['final_price'] / $days) : 0,
                'discounts' => $pricing['discounts']
            ];
        }

        return $results;
    }

    private function checkAvailability($room, $checkIn, $checkOut)
    {
        $dates = CarbonPeriod::create($checkIn, $checkOut->copy()->subDay());

        foreach ($dates as $date) {

            $inventory = Inventory::where('room_type_id', $room->id)
                ->whereDate('date', $date)
                ->first();

            $bookedRooms = Booking::where('room_type_id', $room->id)
                ->where('check_in', '<=', $date)
                ->where('check_out', '>', $date)
                ->sum('rooms_booked');

            if (!$inventory || ($inventory->available_rooms - $bookedRooms) <= 0) {
                return false; // SOLD OUT
            }
        }

        return true;
    }

    private function calculatePrice($room, $checkIn, $checkOut, $days, $mealPlan)
    {
        $dates = CarbonPeriod::create($checkIn, $checkOut->copy()->subDay());

        $total = 0;

        foreach ($dates as $date) {
            $inventory = Inventory::where('room_type_id', $room->id)
                ->whereDate('date', $date)
                ->first();

            $total += $inventory->price ?? 0;
        }

        $basePrice = $total;

        // Meal Plan Cost
        if ($mealPlan === 'breakfast') {
            $total += 500 * $days;
        }

        $discountsApplied = [];

        // Long Stay Discount
        $longStay = Discount::where('type', 'long_stay')->first();
        if ($longStay && $days >= $longStay->min_days) {
            $discount = ($total * $longStay->value) / 100;
            $total -= $discount;

            $discountsApplied[] = [
                'type' => 'long_stay',
                'amount' => round($discount)
            ];
        }

        // Last Minute Discount
        $lastMinute = Discount::where('type', 'last_minute')->first();
        $daysBefore = now()->diffInDays($checkIn, false);

        if ($lastMinute && $daysBefore <= $lastMinute->days_before_checkin) {
            $discount = ($total * $lastMinute->value) / 100;
            $total -= $discount;

            $discountsApplied[] = [
                'type' => 'last_minute',
                'amount' => round($discount)
            ];
        }

        return [
            'base_price' => round($basePrice),
            'final_price' => round($total),
            'discounts' => $discountsApplied
        ];
    }
}