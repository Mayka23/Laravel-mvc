@extends('front.layout.app')

@section('main_content')
<div class="page-top">
    <div class="bg"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{{ $global_page_data->checkout_heading }}</h2>
            </div>
        </div>
    </div>
</div>
<div class="page-content">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-6 checkout-left">

                <form action="{{ route('bayar') }}" method="post" class="frm_checkout">
                    @csrf
                    <div class="billing-info">
                        <h4 class="mb_30">Informasi Pembayaran</h4>
                        @php
                        if(session()->has('billing_name')) {
                            $billing_name = session()->get('billing_name');
                        } else {
                            $billing_name = Auth::guard('customer')->user()->name;
                        }

                        if(session()->has('billing_email')) {
                            $billing_email = session()->get('billing_email');
                        } else {
                            $billing_email = Auth::guard('customer')->user()->email;
                        }

                        if(session()->has('billing_phone')) {
                            $billing_phone = session()->get('billing_phone');
                        } else {
                            $billing_phone = Auth::guard('customer')->user()->phone;
                        }

                        if(session()->has('billing_country')) {
                            $billing_country = session()->get('billing_country');
                        } else {
                            $billing_country = Auth::guard('customer')->user()->country;
                        }

                        if(session()->has('billing_address')) {
                            $billing_address = session()->get('billing_address');
                        } else {
                            $billing_address = Auth::guard('customer')->user()->address;
                        }

                        if(session()->has('billing_state')) {
                            $billing_state = session()->get('billing_state');
                        } else {
                            $billing_state = Auth::guard('customer')->user()->state;
                        }

                        if(session()->has('billing_city')) {
                            $billing_city = session()->get('billing_city');
                        } else {
                            $billing_city = Auth::guard('customer')->user()->city;
                        }

                        if(session()->has('billing_zip')) {
                            $billing_zip = session()->get('billing_zip');
                        } else {
                            $billing_zip = Auth::guard('customer')->user()->zip;
                        }
                        @endphp
                        <div class="row">
                            <div class="col-lg-6">
                                <label for="">Nama: *</label>
                                <input type="text" class="form-control mb_15" name="billing_name" value="{{ $billing_name }}">
                            </div>
                            <div class="col-lg-6">
                                <label for="">Email: *</label>
                                <input type="text" class="form-control mb_15" name="billing_email" value="{{ $billing_email }}">
                            </div>
                            <div class="col-lg-6">
                                <label for="">No Telefon: *</label>
                                <input type="text" class="form-control mb_15" name="billing_phone" value="{{ $billing_phone }}">
                            </div>
                            <div class="col-lg-6">
                                <label for="">Negara: *</label>
                                <input type="text" class="form-control mb_15" name="billing_country" value="{{ $billing_country }}">
                            </div>
                            <div class="col-lg-6">
                                <label for="">Alamat: *</label>
                                <input type="text" class="form-control mb_15" name="billing_address" value="{{ $billing_address }}">
                            </div>
                            <div class="col-lg-6">
                                <label for="">Tanggal Lahir: *</label>
                                <input type="text" class="form-control mb_15" name="billing_state" value="{{ $billing_state }}">
                            </div>
                            <div class="col-lg-6">
                                <label for="">Kota: *</label>
                                <input type="text" class="form-control mb_15" name="billing_city" value="{{ $billing_city }}">
                            </div>
                            <div class="col-lg-6">
                                <label for="">No KTP: *</label>
                                <input type="text" class="form-control mb_15" name="billing_zip" value="{{ $billing_zip }}">
                            </div>
                            <div class="col-lg-6 mb-4">
                                <label for="">Pilih cara pembayaran: *</label>
                                <select name="payment_method" class="form-control select2" id="paymentMethodChange" autocomplete="off" required>
                                    <option value="">Pilih Metode Pembayaran</option>
                                    <option value="midtrans">Debit</option>
                                    <option value="transfer">Transfer Bank</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary bg-website mb_30">Lanjutkan ke pembayaran</button>
                </form>
            </div>
            <div class="col-lg-4 col-md-6 checkout-right">
                <div class="inner">
                    <h4 class="mb_10">Informasi Reservasi Fasilitas Hotmer</h4>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
