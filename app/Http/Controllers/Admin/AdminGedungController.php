<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Amenity;
use App\Models\Gedung;
use App\Models\GedungPhoto;

class AdminGedungController extends Controller
{
    public function index()
    {
        $gedung = Gedung::get();
        return view('admin.gedung_view', compact('gedung'));
    }

    public function add()
    {
        $all_amenities = Amenity::get();
        return view('admin.gedung_add',compact('all_amenities'));
    }

    public function store(Request $request)
    {
        $amenities = '';
        $i=0;
        if(isset($request->arr_amenities)) {
            foreach($request->arr_amenities as $item) {
                if($i==0) {
                    $amenities .= $item;
                } else {
                    $amenities .= ','.$item;
                }            
                $i++;
            }
        }

        $request->validate([
            'featured_photo' => 'required|image|mimes:jpg,jpeg,png,gif',
            'name' => 'required',
            'description' => 'required',
            'price' => 'required',
            'total_gedung' => 'required'
        ]);

        $ext = $request->file('featured_photo')->extension();
        $final_name = time().'.'.$ext;
        $request->file('featured_photo')->move(public_path('uploads/'),$final_name);

        $obj = new Gedung();
        $obj->featured_photo = $final_name;
        $obj->name = $request->name;
        $obj->description = $request->description;
        $obj->price = $request->price;
        $obj->total_gedung = $request->total_gedung;
        $obj->amenities = $amenities;
        $obj->size = $request->size;
        $obj->total_guests = $request->total_guests;
        $obj->video_id = $request->video_id;
        $obj->save();

        return redirect()->back()->with('success', 'Gedung Berhasil Ditambahkan');

    }

    public function edit($id)
    {
        $all_amenities = Amenity::get();
        $gedung_data = Gedung::where('id',$id)->first();

        $existing_amenities = array();
        if($gedung_data->amenities != '') {
            $existing_amenities = explode(',',$gedung_data->amenities);
        }
        return view('admin.gedung_edit', compact('gedung_data','all_amenities','existing_amenities'));
    }

    public function update(Request $request,$id) 
    {        
        $obj = Gedung::where('id',$id)->first();

        $amenities = '';
        $i=0;
        if(isset($request->arr_amenities)) {
            foreach($request->arr_amenities as $item) {
                if($i==0) {
                    $amenities .= $item;
                } else {
                    $amenities .= ','.$item;
                }            
                $i++;
            }
        }

        $request->validate([
            'name' => 'required',
            'description' => 'required',
            'price' => 'required',
            'total_gedung' => 'required'
        ]);

        if($request->hasFile('featured_photo')) {
            $request->validate([
                'featured_photo' => 'image|mimes:jpg,jpeg,png,gif'
            ]);
            unlink(public_path('uploads/'.$obj->featured_photo));
            $ext = $request->file('featured_photo')->extension();
            $final_name = time().'.'.$ext;
            $request->file('featured_photo')->move(public_path('uploads/'),$final_name);
            $obj->featured_photo = $final_name;
        }

        $obj->name = $request->name;
        $obj->description = $request->description;
        $obj->price = $request->price;
        $obj->total_gedung = $request->total_gedung;
        $obj->amenities = $amenities;
        $obj->size = $request->size;
        $obj->total_guests = $request->total_guests;
        $obj->video_id = $request->video_id;
        $obj->update();

        return redirect()->back()->with('success', 'Gedung Berhasil Di Update');
    }

    public function delete($id)
    {
        $single_data = Gedung::where('id',$id)->first();
        unlink(public_path('uploads/'.$single_data->featured_photo));
        $single_data->delete();

        $gedung_photo_data = GedungPhoto::where('gedung_id',$id)->get();
        foreach($gedung_photo_data as $item) {
            unlink(public_path('uploads/'.$item->photo));
            $item->delete();
        }

        return redirect()->back()->with('success', 'Gedung Berhasil Dihapus');
    }

    public function gallery($id)
    {
        $gedung_data = Gedung::where('id',$id)->first();
        $gedung_photos = GedungPhoto::where('gedung_id',$id)->get();
        return view('admin.gedung_gallery', compact('gedung_data','gedung_photos'));
    }

    public function gallery_store(Request $request,$id)
    {
        $request->validate([
            'photo' => 'required|image|mimes:jpg,jpeg,png,gif'
        ]);

        $ext = $request->file('photo')->extension();
        $final_name = time().'.'.$ext;
        $request->file('photo')->move(public_path('uploads/'),$final_name);

        $obj = new GedungPhoto();
        $obj->photo = $final_name;
        $obj->gedung_id = $id;
        $obj->save();

        return redirect()->back()->with('success', 'Foto Berhasil Ditambah');
    }

    public function gallery_delete($id)
    {
        $single_data = GedungPhoto::where('id',$id)->first();
        unlink(public_path('uploads/'.$single_data->photo));
        $single_data->delete();

        return redirect()->back()->with('success', 'Foto Berhasil Di Hapus');
    }
}
