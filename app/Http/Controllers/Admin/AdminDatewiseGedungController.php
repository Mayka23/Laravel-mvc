<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\BookedGedung;

class AdminDatewiseGedungController extends Controller
{
    public function index()
    {
        return view('admin.datewise_gedung');
    }

    public function show(Request $request) 
    {
        $request->validate([
            'selected_date' => 'required'
        ]);

        $selected_date = $request->selected_date;

        return view('admin.datewise_gedung_detail', compact('selected_date'));
    }
}
