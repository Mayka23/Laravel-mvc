@extends('admin.layout.app')

@section('heading', 'Gedung Yang Tersedia '.$selected_date)

@section('right_top_button')
<a href="{{ route('admin_datewise_gedung') }}" class="btn btn-primary"><i class="fa fa-plus"></i> Kembali</a>
@endsection

@section('main_content')
<div class="section-body">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="">
                            <thead>
                                <tr>
                                    <th>SL</th>
                                    <th>Nama Gedung</th>
                                    <th>Total Gedung</th>
                                    <th>Gedung Dipesan</th>
                                    <th>Gedung Tersedia</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                $gedung = \App\Models\Gedung::get();
                                @endphp 
                                @foreach($gedung as $row)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $row->name }}</td>
                                    <td>{{ $row->total_gedung }}</td>
                                    <td>
                                        @php
                                        $cnt = \App\Models\BookedGedung::where('gedung_id',$row->id)->where('booking_date',$selected_date)->count();
                                        @endphp
                                        {{ $cnt }}
                                    </td>
                                    <td>
                                        {{ $row->total_gedung-$cnt }}
                                    </td>
                                </tr>
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