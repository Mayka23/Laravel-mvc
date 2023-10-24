@extends('front.layout.app')

@section('main_content')
<div class="page-top">
    <div class="bg" style="background: linear-gradient(180deg, #FFFFFF 0%, #000000 100%), linear-gradient(90deg, #FFFFFF 0%, #000000 100%), #0000FF;
background-blend-mode: multiply, screen, normal;"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{{ $single_gedung_data->name }}</h2>
            </div>
        </div>
    </div>
</div>

<div class="page-content room-detail" style="background: radial-gradient(100% 225% at 100% 0%, #FF0000 0%, #000000 100%), linear-gradient(236deg, #00C2FF 0%, #000000 100%), linear-gradient(135deg, #CDFFEB 0%, #CDFFEB 36%, #009F9D 36%, #009F9D 60%, #07456F 60%, #07456F 67%, #0F0A3C 67%, #0F0A3C 100%);
background-blend-mode: overlay, hard-light, normal;">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-7 col-sm-12 left">

                <div class="room-detail-carousel owl-carousel">
                    <div class="item" style="background-image:url({{ asset('uploads/'.$single_gedung_data->featured_photo) }});">
                        <div class="bg"></div>
                    </div>

                    @foreach($single_gedung_data->rGedungPhoto as $item)
                    <div class="item" style="background-image:url({{ asset('uploads/'.$item->photo) }});">
                        <div class="bg"></div>
                    </div>
                    @endforeach

                </div>

                <div class="description" style="color: white">
                    {!! $single_gedung_data->description !!}
                </div>

                <div class="amenity">
                    <div class="row">
                        <div class="col-md-12" style="color: white">
                            <h2>Fasilitas Gedung</h2>
                        </div>
                    </div>
                    <div class="row">
                        @php
                        $arr = explode(',',$single_gedung_data->amenities);
                        for($j=0;$j<count($arr);$j++) {
                            $temp_row = \App\Models\Amenity::where('id',$arr[$j])->first();
                            echo '<div class="col-lg-6 col-md-12" style="color: white">';
                            echo '<div class="item"><i class="fa fa-check-circle"></i> '.$temp_row->name.'</div>';
                            echo '</div>';
                        }
                        @endphp
                    </div>
                </div>


                <div class="feature">
                    <div class="row">
                        <div class="col-md-12" style="color: white">
                            <h2>Kriteria Gedung</h2>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered" style="color: white">
                            <tr>
                                <th>Ukuran Ruangan</th>
                                <td>{{ $single_gedung_data->size }}</td>
                            </tr>
                        </table>
                    </div>
                </div>

                @if($single_gedung_data->video_id != '')
                <div class="video">
                    <iframe width="560" height="315" src="https://www.youtube.com/embed/{{ $single_gedung_data->video_id }}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                @endif


            </div>
            <div class="col-lg-4 col-md-5 col-sm-12 right">

                <div class="sidebar-container" id="sticky_sidebar">

                    <div class="widget">
                        <h2>Harga Booking</h2>
                        <div class="price">
                            Rp. {{ number_format($single_gedung_data->price) }}
                        </div>
                    </div>
                    <div class="widget">
                        <h2>Transaksi Gedung</h2>
                        <form action="{{ route('sewa_submit') }}" method="post">
                            @csrf
                            <input type="hidden" name="gedung_id" value="{{ $single_gedung_data->id }}">
                            <div class="form-group mb_20">
                                <label for="">Tanggal Booking</label>
                                <input type="text" name="checkin_checkout" class="form-control daterange1" placeholder="Checkin & Checkout">
                            </div>
                            <div class="form-gryoup mb_20">
                                <label for="">Jenis Acara</label>
                                <input type="text" name="adult" class="form-control">
                            </div>
                            <div class="form-group mb_20">
                                <label for="">Jumlah Peserta</label>
                                <input type="number" name="children" class="form-control" min="0" max="3000">
                            </div>
                            <button type="submit" class="book-now">Bayar</button>
                        </form>
                    </div>

                </div>


            </div>
        </div>
    </div>
</div>

@if($errors->any())
    @foreach($errors->all() as $error)
        <script>
            iziToast.error({
                title: '',
                position: 'topRight',
                message: '{{ $error }}',
            });
        </script>
    @endforeach
@endif

@endsection
