<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Gedung;

class GedungController extends Controller
{
    public function index()
    {
        $gedung_all = Gedung::paginate(12);
        return view('front.gedung', compact('gedung_all'));
    }

    public function single_gedung($id)
    {
        $single_gedung_data = Gedung::with('rGedungPhoto')->where('id',$id)->first();
        return view('front.gedung_detail', compact('single_gedung_data'));
    }
}
