<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\SearchService;

class SearchController extends Controller
{
    public function search(Request $request, SearchService $service)
    {
       
        $data = $request->validate([
            'check_in' => 'required|date',
            'check_out' => 'required|date|after:check_in',
            'guests' => 'required|integer|max:3',
            'meal_plan' => 'required|in:room_only,breakfast'
        ]);

        $result = $service->search($data);

        return response()->json($result);
    }
}