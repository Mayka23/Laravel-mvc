<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Customer;
use App\Model\BookedRoom;

class CustomerDatewiseRoomController extends Controller
{
    public function index()
    {
        return view('customer.datewise_rooms');
    }

    public function show(Request $request) 
    {
        $request->validate([
            'selected_date' => 'required'
        ]);

        $selected_date = $request->selected_date;

        return view('customer.datewise_rooms_detail', compact('selected_date'));
    }
}
