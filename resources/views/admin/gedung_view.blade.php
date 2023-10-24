@extends('admin.layout.app')

@section('heading', 'Data Gedung')

@section('right_top_button')
<a href="{{ route('admin_gedung_add') }}" class="btn btn-primary"><i class="fa fa-plus"></i> Tambah</a>
@endsection

@section('main_content')
<div class="section-body">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="example1">
                            <thead>
                                <tr>
                                    <th>SL</th>
                                    <th>Photo</th>
                                    <th>Nama</th>
                                    <th>Booking Gedung</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php $i=0; @endphp
                                @foreach($gedung as $row)
                                @php $i++; @endphp
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>
                                        <img src="{{ asset('uploads/'.$row->featured_photo) }}" alt="" class="w_200">
                                    </td>
                                    <td>{{ $row->name }}</td>
                                    <td>Rp. {{ $row->price }}</td>
                                    <td class="pt_10 pb_10">

                                        {{-- <button class="btn btn-warning" data-toggle="modal" data-target="#exampleModal{{ $i }}">Detail</button> --}}

                                        <a href="{{ route('admin_gedung_gallery',$row->id) }}" class="btn btn-success">Gallery</a>

                                        <a href="{{ route('admin_gedung_edit',$row->id) }}" class="btn btn-primary">Edit</a>
                                        <a href="{{ route('admin_gedung_delete',$row->id) }}" class="btn btn-danger" onClick="return confirm('Are you sure?');">Delete</a>
                                    </td>
                                </tr>

                                <div class="modal fade" id="exampleModal{{ $i }}" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Detail Gedung</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group row bdb1 pt_10 mb_0">
                                                    <div class="col-md-4"><label class="form-label">Foto</label></div>
                                                    <div class="col-md-8">
                                                        <img src="{{ asset('uploads/'.$row->featured_photo) }}" alt="" class="w_200">
                                                    </div>
                                                </div>
                                                <div class="form-group row bdb1 pt_10 mb_0">
                                                    <div class="col-md-4"><label class="form-label">Name</label></div>
                                                    <div class="col-md-8">{{ $row->name }}</div>
                                                </div>
                                                <div class="form-group row bdb1 pt_10 mb_0">
                                                    <div class="col-md-4"><label class="form-label">Description</label></div>
                                                    <div class="col-md-8">{!! $row->description !!}</div>
                                                </div>
                                                <div class="form-group row bdb1 pt_10 mb_0">
                                                    <div class="col-md-4"><label class="form-label">Booking Gedung</label></div>
                                                    <div class="col-md-8">Rp. {{ $row->price }}</div>
                                                </div>
                                                <div class="form-group row bdb1 pt_10 mb_0">
                                                    <div class="col-md-4"><label class="form-label">Total Gedung</label></div>
                                                    <div class="col-md-8">{{ $row->total_gedung }}</div>
                                                </div>
                                                <div class="form-group row bdb1 pt_10 mb_0">
                                                    <div class="col-md-4"><label class="form-label">Total Amenities</label></div>
                                                    <div class="col-md-8">
                                                        @php
                                                        $arr = explode(',',$row->amenities);
                                                        for($j=0;$j<count($arr);$j++) {
                                                            $temp_row = \App\Models\Amenity::where('id',$arr[$j])->first();
                                                            echo $temp_row->name.'<br>';
                                                        }
                                                        @endphp
                                                    </div>
                                                </div>
                                                <div class="form-group row bdb1 pt_10 mb_0">
                                                    <div class="col-md-4"><label class="form-label">Size</label></div>
                                                    <div class="col-md-8">{{ $row->size }}</div>
                                                </div>
                                                <div class="form-group row bdb1 pt_10 mb_0">
                                                    <div class="col-md-4"><label class="form-label">Total Guests</label></div>
                                                    <div class="col-md-8">{{ $row->total_guests }}</div>
                                                </div>
                                                <div class="form-group row bdb1 pt_10 mb_0">
                                                    <div class="col-md-4"><label class="form-label">Video</label></div>
                                                    <div class="col-md-8">
                                                        <div class="iframe-container1">
                                                            <iframe width="560" height="315" src="https://www.youtube.com/embed/{{ $row->video_id }}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
