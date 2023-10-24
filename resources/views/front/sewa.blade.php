@extends('front.layout.app')

@section('main_content')
<div class="page-top">
    <div class="bg" style="background: linear-gradient(180deg, #FFFFFF 0%, #000000 100%), linear-gradient(90deg, #FFFFFF 0%, #000000 100%), #0000FF;
background-blend-mode: multiply, screen, normal;"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{{ $global_page_data->privacy_heading }}</h2>
            </div>
        </div>
    </div>
</div>
<div class="page-content" style="background: radial-gradient(100% 225% at 100% 0%, #FF0000 0%, #000000 100%), linear-gradient(236deg, #00C2FF 0%, #000000 100%), linear-gradient(135deg, #CDFFEB 0%, #CDFFEB 36%, #009F9D 36%, #009F9D 60%, #07456F 60%, #07456F 67%, #0F0A3C 67%, #0F0A3C 100%);
background-blend-mode: overlay, hard-light, normal;">
    <div class="container">
        <div class="row cart">
            <div class="col-md-12">


                @if(session()->has('sewa_gedung_id'))

                <div class="table-responsive">
                    <table class="table table-bordered table-cart">
                        <thead>
                            <tr>
                                <th></th>
                                <th>No</th>
                                <th>Foto</th>
                                <th>Fasilitas Booking</th>
                                <th>Harga </th>
                                <th>Tgl Acara</th>
                                <th>Selesai Acara</th>
                                <th>Detail</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>

                            @php
                            $arr_sewa_gedung_id = array();
                            $i=0;
                            foreach(session()->get('sewa_gedung_id') as $value) {
                                $arr_sewa_gedung_id[$i] = $value;
                                $i++;
                            }

                            $arr_sewa_checkin_date = array();
                            $i=0;
                            foreach(session()->get('sewa_checkin_date') as $value) {
                                $arr_sewa_checkin_date[$i] = $value;
                                $i++;
                            }

                            $arr_sewa_checkout_date = array();
                            $i=0;
                            foreach(session()->get('sewa_checkout_date') as $value) {
                                $arr_sewa_checkout_date[$i] = $value;
                                $i++;
                            }

                            $arr_sewa_adult = array();
                            $i=0;
                            foreach(session()->get('sewa_adult') as $value) {
                                $arr_sewa_adult[$i] = $value;
                                $i++;
                            }

                            $arr_sewa_children = array();
                            $i=0;
                            foreach(session()->get('sewa_children') as $value) {
                                $arr_sewa_children[$i] = $value;
                                $i++;
                            }

                            $total_price = 0;
                            for($i=0;$i<count($arr_sewa_gedung_id);$i++)
                            {
                                $gedung_data = DB::table('gedungs')->where('id',$arr_sewa_gedung_id[$i])->first();
                                @endphp
                                <tr>
                                    <td>
                                        <a href="{{ route('sewa_delete',$arr_sewa_gedung_id[$i]) }}" class="sewa-delete-link" onclick="return confirm('Are you sure?');"><i class="fa fa-times"></i></a>
                                    </td>
                                    <td style="color:white">{{ $i+1 }}</td>
                                    <td><img src="{{ asset('uploads/'.$gedung_data->featured_photo) }}"></td>
                                    <td>
                                        <a href="{{ route('gedung_detail',$gedung_data->id) }}" class="room-name" style="color:white">{{ $gedung_data->name }}</a>
                                    </td>
                                    <td style="color:white">${{ $gedung_data->price }}</td>
                                    <td style="color:white">{{ $arr_sewa_checkin_date[$i] }}</td>
                                    <td style="color:white">{{ $arr_sewa_checkout_date[$i] }}</td>
                                    <td style="color:white">
                                        Jenis Acara: {{ $arr_sewa_adult[$i] }}<br>
                                        Jumlah Peserta: {{ $arr_sewa_children[$i] }}
                                    </td>
                                    <td style="color:white">
                                    @php
                                        $d1 = explode('/',$arr_sewa_checkin_date[$i]);
                                        $d2 = explode('/',$arr_sewa_checkout_date[$i]);
                                        $d1_new = $d1[2].'-'.$d1[1].'-'.$d1[0];
                                        $d2_new = $d2[2].'-'.$d2[1].'-'.$d2[0];
                                        $t1 = strtotime($d1_new);
                                        $t2 = strtotime($d2_new);
                                        $diff = ($t2)/60/60/24;
                                        echo 'Rp. '.$gedung_data->price;
                                    @endphp
                                    </td>
                                </tr style="color:white">
                                @php
                                $total_price = $total_price+($gedung_data->price);
                            }
                            @endphp
                            <tr style="color:white">
                                <td colspan="8" class="tar">Total:</td>
                                <td>Rp. {{ $total_price }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="checkout mb_20">
                    <a href="{{ route('keranjang') }}" class="btn btn-primary bg-website">Bayar</a>
                </div>

                @else

                <div class="text-danger mb_30">
                    Yang Harus Dibayar Kosong!
                </div>

                @endif

            </div>
        </div>
    </div>
</div>
@endsection
