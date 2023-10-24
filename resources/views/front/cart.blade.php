@extends('front.layout.app')

@section('main_content')
<div class="page-top">
    <div class="bg" style="background: linear-gradient(180deg, #FFFFFF 0%, #000000 100%), linear-gradient(90deg, #FFFFFF 0%, #000000 100%), #0000FF;
background-blend-mode: multiply, screen, normal;"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{{ $global_page_data->cart_heading }}</h2>
            </div>
        </div>
    </div>
</div>
<div class="page-content" style="background: radial-gradient(100% 225% at 100% 0%, #FF0000 0%, #000000 100%), linear-gradient(236deg, #00C2FF 0%, #000000 100%), linear-gradient(135deg, #CDFFEB 0%, #CDFFEB 36%, #009F9D 36%, #009F9D 60%, #07456F 60%, #07456F 67%, #0F0A3C 67%, #0F0A3C 100%);
background-blend-mode: overlay, hard-light, normal;">
    <div class="container">
        <div class="row cart">
            <div class="col-md-12">


                @if(session()->has('cart_room_id'))

                <div class="table-responsive">
                    <table class="table table-bordered table-cart">
                        <thead>
                            <tr>
                                <th></th>
                                <th>No</th>
                                <th>Foto</th>
                                <th>Jenis Booking</th>
                                <th>Harga </th>
                                <th>Checkin</th>
                                <th>Checkout</th>
                                <th>Jumlah Tamu</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>

                            @php
                            $arr_cart_room_id = array();
                            $i=0;
                            foreach(session()->get('cart_room_id') as $value) {
                                $arr_cart_room_id[$i] = $value;
                                $i++;
                            }

                            $arr_cart_checkin_date = array();
                            $i=0;
                            foreach(session()->get('cart_checkin_date') as $value) {
                                $arr_cart_checkin_date[$i] = $value;
                                $i++;
                            }

                            $arr_cart_checkout_date = array();
                            $i=0;
                            foreach(session()->get('cart_checkout_date') as $value) {
                                $arr_cart_checkout_date[$i] = $value;
                                $i++;
                            }

                            $arr_cart_adult = array();
                            $i=0;
                            foreach(session()->get('cart_adult') as $value) {
                                $arr_cart_adult[$i] = $value;
                                $i++;
                            }

                            $arr_cart_children = array();
                            $i=0;
                            foreach(session()->get('cart_children') as $value) {
                                $arr_cart_children[$i] = $value;
                                $i++;
                            }

                            $total_price = 0;
                            for($i=0;$i<count($arr_cart_room_id);$i++)
                            {
                                $room_data = DB::table('rooms')->where('id',$arr_cart_room_id[$i])->first();
                                @endphp
                                <tr>
                                    <td>
                                        <a href="{{ route('cart_delete',$arr_cart_room_id[$i]) }}" class="cart-delete-link" onclick="return confirm('Are you sure?');"><i class="fa fa-times"></i></a>
                                    </td>
                                    <td style="color:white">{{ $i+1 }}</td>
                                    <td><img src="{{ asset('uploads/'.$room_data->featured_photo) }}"></td>
                                    <td>
                                        <a href="{{ route('room_detail',$room_data->id) }}" class="room-name" style="color:white">{{ $room_data->name }}</a>
                                    </td>
                                    <td style="color:white">${{ $room_data->price }}</td>
                                    <td style="color:white">{{ $arr_cart_checkin_date[$i] }}</td>
                                    <td style="color:white">{{ $arr_cart_checkout_date[$i] }}</td>
                                    <td style="color:white">
                                        Dewasa: {{ $arr_cart_adult[$i] }}<br>
                                        Anak-anak: {{ $arr_cart_children[$i] }}
                                    </td>
                                    <td style="color:white">
                                    @php
                                        $d1 = explode('/',$arr_cart_checkin_date[$i]);
                                        $d2 = explode('/',$arr_cart_checkout_date[$i]);
                                        $d1_new = $d1[2].'-'.$d1[1].'-'.$d1[0];
                                        $d2_new = $d2[2].'-'.$d2[1].'-'.$d2[0];
                                        $t1 = strtotime($d1_new);
                                        $t2 = strtotime($d2_new);
                                        $diff = ($t2-$t1)/60/60/24;
                                        echo 'Rp. '.$room_data->price*$diff;
                                    @endphp
                                    </td>
                                </tr style="color:white">
                                @php
                                $total_price = $total_price+($room_data->price*$diff);
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
                    <a href="{{ route('checkout') }}" class="btn btn-primary bg-website">Bayar</a>
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
