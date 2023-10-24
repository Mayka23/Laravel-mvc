@extends('admin.layout.app')

@section('heading', 'Tambah Gedung')

@section('right_top_button')
<a href="{{ route('admin_gedung_view') }}" class="btn btn-primary"><i class="fa fa-previous"></i> Kembali</a>
@endsection

@section('main_content')
<div class="section-body">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form action="{{ route('admin_gedung_store') }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-4">
                                    <label class="form-label">Upload Foto *</label>
                                    <div>
                                        <input type="file" name="featured_photo">
                                    </div>
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Nama *</label>
                                    <input type="text" class="form-control" name="name" value="{{ old('name') }}">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Deskripsi *</label>
                                    <textarea name="description" class="form-control snote" cols="30" rows="10">{{ old('description') }}</textarea>
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Harga *</label>
                                    <input type="text" class="form-control" name="price" value="{{ old('price') }}">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Total Gedung *</label>
                                    <input type="text" class="form-control" name="total_gedung" value="{{ old('total_gedung') }}">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Fasilitas</label>
                                    @php $i=0; @endphp
                                    @foreach($all_amenities as $item)
                                    @php $i++; @endphp
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="{{ $item->id }}" id="defaultCheck{{ $i }}" name="arr_amenities[]">
                                        <label class="form-check-label" for="defaultCheck{{ $i }}">
                                            {{ $item->name }}
                                        </label>
                                    </div>
                                    @endforeach
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Ukuran Gedung</label>
                                    <input type="text" class="form-control" name="size" value="{{ old('size') }}">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Total Peserta</label>
                                    <input type="text" class="form-control" name="total_guests" value="{{ old('total_guests') }}">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Video</label>
                                    <input type="text" class="form-control" name="video_id" value="{{ old('video_id') }}">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label"></label>
                                    <button type="submit" class="btn btn-primary">Submit</button>
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