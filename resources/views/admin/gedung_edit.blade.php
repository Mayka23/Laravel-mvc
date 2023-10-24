@extends('admin.layout.app')

@section('heading', 'Edit Gedung')

@section('right_top_button')
<a href="{{ route('admin_gedung_view') }}" class="btn btn-primary"><i class="fa"></i> Kembali</a>
@endsection

@section('main_content')
<div class="section-body">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form action="{{ route('admin_gedung_update',$gedung_data->id) }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-4">
                                    <label class="form-label">Foto Gedung</label>
                                    <div>
                                        <img src="{{ asset('uploads/'.$gedung_data->featured_photo) }}" alt="" class="w_200">
                                    </div>
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Ubah Foto</label>
                                    <div>
                                        <input type="file" name="featured_photo">
                                    </div>
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Nama *</label>
                                    <input type="text" class="form-control" name="name" value="{{ $gedung_data->name }}">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Deskripsi *</label>
                                    <textarea name="description" class="form-control snote" cols="30" rows="10">{{ $gedung_data->description }}</textarea>
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Harga *</label>
                                    <input type="text" class="form-control" name="price" value="{{ $gedung_data->price }}">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Total Gedung *</label>
                                    <input type="text" class="form-control" name="total_gedung" value="{{ $gedung_data->total_gedung }}">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Fasilitas</label>
                                    @php $i=0; @endphp
                                    @foreach($all_amenities as $item)

                                    @if(in_array($item->id,$existing_amenities))
                                    @php $checked_type = 'checked'; @endphp
                                    @else
                                    @php $checked_type = ''; @endphp
                                    @endif

                                    @php $i++; @endphp
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="{{ $item->id }}" id="defaultCheck{{ $i }}" name="arr_amenities[]" {{ $checked_type }}>
                                        <label class="form-check-label" for="defaultCheck{{ $i }}">
                                            {{ $item->name }}
                                        </label>
                                    </div>
                                    @endforeach
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Ukuran Gedung</label>
                                    <input type="text" class="form-control" name="size" value="{{ $gedung_data->size }}">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Total Peserta</label>
                                    <input type="text" class="form-control" name="total_guests" value="{{ $gedung_data->total_guests }}">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Video</label>
                                    <div class="iframe-container1">
                                        <iframe width="560" height="315" src="https://www.youtube.com/embed/{{ $gedung_data->video_id }}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                    </div>
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Upload Video</label>
                                    <input type="text" class="form-control" name="video_id" value="{{ $gedung_data->video_id }}">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label"></label>
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection