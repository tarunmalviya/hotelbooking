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

    if ($data['guests'] > $room->max_occupancy) {
        continue;
    }

    foreach ($room->ratePlans as $ratePlan) {

        $isAvailable = $this->checkAvailability($room, $checkIn, $checkOut);

        if ($isAvailable) {
            $pricing = $this->calculatePrice($room, $ratePlan, $checkIn, $checkOut, $days);
        } else {
            $pricing = [
                'base_price' => 0,
                'final_price' => 0,
                'discounts' => []
            ];
        }

        $results[] = [
            'room_type' => $room->name,
            'rate_plan' => $ratePlan->name,
            'meal_plan' => $ratePlan->meal_plan,
            'available' => $isAvailable,
            'base_price' => $pricing['base_price'],
            'final_price' => $pricing['final_price'],
            'price_per_night' => $pricing['price_per_night'] ?? 0, // ✅ FIX
            'discounts' => $pricing['discounts']
        ];
    }
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

    private function calculatePrice($room, $ratePlan, $checkIn, $checkOut, $days)
{
    $dates = \Carbon\CarbonPeriod::create($checkIn, $checkOut->copy()->subDay());

    $total = 0;

    foreach ($dates as $date) {
        $inventory = Inventory::where('room_type_id', $room->id)
            ->whereDate('date', $date)
            ->first();

        $total += $inventory->price ?? 0;
    }

    $basePrice = $total;

    // Meal Plan Pricing
    if ($ratePlan->meal_plan === 'breakfast') {
        $total += 500 * $days;
    }

    if ($ratePlan->meal_plan === 'all_meals') {
        $total += 1000 * $days;
    }

    $discountsApplied = [];

    $daysBefore = now()->diffInDays($checkIn);

    foreach ($ratePlan->discounts as $discount) {

        if ($daysBefore >= $discount->days_before_checkin) {
            $amount = ($total * $discount->value) / 100;
            $total -= $amount;

            $discountsApplied[] = [
                'type' => $discount->type,
                'amount' => round($amount)
            ];
        }
    }

    return [
    'base_price' => round($basePrice),
    'final_price' => round($total),
    'price_per_night' => round($total / $days), // ✅ ADD THIS
    'discounts' => $discountsApplied
];
}
}