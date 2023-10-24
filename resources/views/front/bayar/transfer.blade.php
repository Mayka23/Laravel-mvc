@extends('front.layout.app')

@section('main_content')

<div class="page-top">
    <div class="bg"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{{ $global_page_data->payment_heading }}</h2>
            </div>
        </div>
    </div>
</div>
<div class="page-content">
    <div class="container">
        <div class="row  mb-2 text-center">
            @foreach ($rekening as $key)
                <div class="col-md-3">
                    <div class="card text-white bg-info mb-3 "
                        style="max-width: 18rem;">
                        <div class="card-header">{{ $key->bank_name }}</div>
                        <div class="card-body">
                            <h5 class="card-title">{{ $key->no_rekening }}</h5>
                            <p class="card-text">Atas Nama {{ $key->atas_nama }}</p>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4 checkout-left mb_30">
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
                    $d1 = explode('/',$arr_sewa_checkin_date[$i]);
                    $d2 = explode('/',$arr_sewa_checkout_date[$i]);
                    $d1_new = $d1[2].'-'.$d1[1].'-'.$d1[0];
                    $d2_new = $d2[2].'-'.$d2[1].'-'.$d2[0];
                    $t1 = strtotime($d1_new);
                    $t2 = strtotime($d2_new);
                    $diff = ($t2-$t1)/60/60/24;
                    $total_price = $total_price+($gedung_data->price);
                }
                @endphp
                    <div class="mt_20">
                        <h4>Metode Pembayaran Bank Transfer</h4>
                        <span class="mt_20">Anda boleh menutup halaman ini. Upload bukti transfer juga tersedia di menu Transaksi.</span>

                        @php

                        use App\Models\BookedGedung;
                        use App\Models\Gedung;
                        use App\Models\Customer;
                        use App\Models\Order;
                        use App\Models\OrderDetail;
                        use App\Models\Bayar;
                        use App\Models\BayarDetail;

                        $cents = $total_price;
                        $customer_email = Auth::guard('customer')->user()->email;
                        $stripe_publishable_key = 'SB-Mid-client-q-f6xn-itJmypXeD';
                        $order_no = time();
                        $params = array(
                            'transaction_details' => array(
                                'order_id' => $order_no,
                                'gross_amount' => $cents,
                            ),
                            'customer_details' => array(
                                'first_name'    => Auth::guard('customer')->user()->name,
                                'last_name'     => Auth::guard('customer')->user()->name,
                                'email' => $customer_email,
                                'phone'         => Auth::guard('customer')->user()->phone,
                            ),
                        );

                        $statement = DB::select("SHOW TABLE STATUS LIKE 'bayars'");
                        $ai_id = $statement[0]->Auto_increment;

                        $obj = new Bayar();
                        $obj->customer_id = Auth::guard('customer')->user()->id;
                        $obj->order_no = $order_no;
                        $obj->transaction_id = $order_no;
                        $obj->payment_method = 'Bank Transfer';
                        $obj->card_last_digit = '';
                        $obj->paid_amount = $cents;
                        $obj->booking_date = date('d/m/Y');
                        $obj->status = 'Pending';
                        $obj->save();

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

                        for($i=0;$i<count($arr_sewa_gedung_id);$i++)
                        {
                            $r_info = Gedung::where('id',$arr_sewa_gedung_id[$i])->first();
                            $d1 = explode('/',$arr_sewa_checkin_date[$i]);
                            $d2 = explode('/',$arr_sewa_checkout_date[$i]);
                            $d1_new = $d1[2].'-'.$d1[1].'-'.$d1[0];
                            $d2_new = $d2[2].'-'.$d2[1].'-'.$d2[0];
                            $t1 = strtotime($d1_new);
                            $t2 = strtotime($d2_new);
                            $diff = ($t2-$t1)/60/60/24;
                            $sub = $r_info->price*$diff;

                            $obj = new BayarDetail();
                            $obj->order_id = $ai_id;
                            $obj->gedung_id = $arr_sewa_gedung_id[$i];
                            $obj->order_no = $order_no;
                            $obj->checkin_date = $arr_sewa_checkin_date[$i];
                            $obj->checkout_date = $arr_sewa_checkout_date[$i];
                            $obj->adult = $arr_sewa_adult[$i];
                            $obj->children = $arr_sewa_children[$i];
                            $obj->subtotal = $sub;
                            $obj->save();

                            while(1) {
                                if($t1>=$t2) {
                                    break;
                                }

                                $obj = new BookedGedung();
                                $obj->booking_date = date('d/m/Y',$t1);
                                $obj->order_no = $order_no;
                                $obj->gedung_id = $arr_sewa_gedung_id[$i];
                                $obj->save();

                                $t1 = strtotime('+1 day',$t1);
                            }

                        }

                @endphp
                <form action="{{ route('bukti') }}"
                    method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="form-group mt-4">
                        <label for="">Upload Bukti Pembayaran sekarang.</label>
                        <input type="hidden" name="order_no" value="{{ $order_no }}">
                        <input type="file" name="bukti_pembayaran" id=""
                            class="form-control" required>
                    </div>
                    <div class="text-right mt-4">
                        <button type="submit" class="btn btn-primary">Kirim</button>
                    </div>
                </form>
            </div>

            </div>
            <div class="col-lg-4 col-md-4 checkout-right">
                <div class="inner">
                    <h4 class="mb_10">Detail Pembayaran</h4>
                    <div>
                        Name: {{ session()->get('billing_name') }}
                    </div>
                    <div>
                        Email: {{ session()->get('billing_email') }}
                    </div>
                    <div>
                        Phone: {{ session()->get('billing_phone') }}
                    </div>
                    <div>
                        Country: {{ session()->get('billing_country') }}
                    </div>
                    <div>
                        Address: {{ session()->get('billing_address') }}
                    </div>
                    <div>
                        State: {{ session()->get('billing_state') }}
                    </div>
                    <div>
                        City: {{ session()->get('billing_city') }}
                    </div>
                    <div>
                        Zip: {{ session()->get('billing_zip') }}
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 checkout-right">
                <div class="inner">
                    <h4 class="mb_10">Detail Keranjang</h4>
                    <div class="table-responsive">
                        <table class="table">
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
                                            {{ $gedung_data->name }}
                                            <br>
                                            ({{ $arr_sewa_checkin_date[$i] }} - {{ $arr_sewa_checkout_date[$i] }})
                                            <br>
                                            Adult: {{ $arr_sewa_adult[$i] }}, Children: {{ $arr_sewa_children[$i] }}
                                        </td>
                                        <td class="p_price">
                                            @php
                                                $d1 = explode('/',$arr_sewa_checkin_date[$i]);
                                                $d2 = explode('/',$arr_sewa_checkout_date[$i]);
                                                $d1_new = $d1[2].'-'.$d1[1].'-'.$d1[0];
                                                $d2_new = $d2[2].'-'.$d2[1].'-'.$d2[0];
                                                $t1 = strtotime($d1_new);
                                                $t2 = strtotime($d2_new);
                                                $diff = ($t2-$t1)/60/60/24;
                                                echo 'Rp. '.$gedung_data->price;
                                            @endphp
                                        </td>
                                    </tr>
                                    @php
                                    $total_price = $total_price+($gedung_data->price);
                                }
                                @endphp
                                <tr>
                                    <td><b>Total:</b></td>
                                    <td class="p_price"><b>Rp. {{ $total_price }}</b></td>
                                </tr>
                            </tbody>
                        </table>
                        @php
                            $order_id = Bayar::where('order_no', $order_no)->orderBy('id','desc')->first();
                            if ($order_id) {
                                Session::forget('sewa_gedung_id');
                                Session::forget('sewa_checkin_date');
                                Session::forget('sewa_checkout_date');
                                Session::forget('sewa_adult');
                                Session::forget('sewa_children');
                            } else {
                                //
                            }
                        @endphp
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
