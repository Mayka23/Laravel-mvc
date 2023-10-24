<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Customer;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Bayar;
use App\Models\BayarDetail;
use App\Models\BookedGedung;
use App\Models\Gedung;
use Auth;
use DB;
use App\Mail\Websitemail;
use PayPal\Api\Amount;
use PayPal\Api\Details;
use PayPal\Api\Payment;
use PayPal\Api\PaymentExecution;
use PayPal\Api\Transaction;
Use Stripe;
use Midtrans\Snap;
use Midtrans\Config;
use Midtrans\Notification;
use App\Models\Rekening;

class SewaController extends Controller
{

    public function sewa_submit(Request $request)
    {
        $request->validate([
            'gedung_id' => 'required',
            'checkin_checkout' => 'required',
            'adult' => 'required'
        ]);

        $dates = explode(' - ',$request->checkin_checkout);
        $checkin_date = $dates[0];
        $checkout_date = $dates[1];

        $d1 = explode('/',$checkin_date);
        $d2 = explode('/',$checkout_date);
        $d1_new = $d1[2].'-'.$d1[1].'-'.$d1[0];
        $d2_new = $d2[2].'-'.$d2[1].'-'.$d2[0];
        $t1 = strtotime($d1_new);
        $t2 = strtotime($d2_new);

        $cnt = 1;
        while(1) {
            if($t1>=$t2) {
                break;
            }
            $single_date = date('d/m/Y',$t1);
            $total_already_booked_gedung = BookedGedung::where('booking_date',$single_date)->where('gedung_id',$request->gedung_id)->count();

            $arr = Gedung::where('id',$request->gedung_id)->first();
            $total_allowed_gedung = $arr->total_gedung;

            if($total_already_booked_gedung == $total_allowed_gedung) {
                $cnt = 0;
                break;
            }
            $t1 = strtotime('+1 day',$t1);
        }

        if($cnt == 0) {
            return redirect()->back()->with('error', 'Maximum number of this room is already booked');
        }

        session()->push('sewa_gedung_id',$request->gedung_id);
        session()->push('sewa_checkin_date',$checkin_date);
        session()->push('sewa_checkout_date',$checkout_date);
        session()->push('sewa_adult',$request->adult);
        session()->push('sewa_children',$request->children);

        return redirect()->back()->with('success', 'Gedung is added to the cart successfully.');
    }

    public function sewa_view()
    {
        return view('front.sewa');
    }

    public function sewa_delete($id)
    {
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

        session()->forget('sewa_gedung_id');
        session()->forget('sewa_checkin_date');
        session()->forget('sewa_checkout_date');
        session()->forget('sewa_adult');
        session()->forget('sewa_children');

        for($i=0;$i<count($arr_sewa_gedung_id);$i++)
        {
            if($arr_sewa_gedung_id[$i] == $id)
            {
                continue;
            }
            else
            {
                session()->push('sewa_gedung_id',$arr_sewa_gedung_id[$i]);
                session()->push('sewa_checkin_date',$arr_sewa_checkin_date[$i]);
                session()->push('sewa_checkout_date',$arr_sewa_checkout_date[$i]);
                session()->push('sewa_adult',$arr_sewa_adult[$i]);
                session()->push('sewa_children',$arr_sewa_children[$i]);
            }
        }

        return redirect()->back()->with('success', 'Cart item is deleted.');

    }


    public function keranjang()
    {
        if(!Auth::guard('customer')->check()) {
            return redirect()->back()->with('error', 'You must have to login in order to checkout');
        }

        if(!session()->has('sewa_gedung_id')) {
            return redirect()->back()->with('error', 'There is no item in the cart');
        }

        return view('front.keranjang');
    }

    public function bayar(Request $request)
    {
        if(!Auth::guard('customer')->check()) {
            return redirect()->back()->with('error', 'You must have to login in order to checkout');
        }

        if(!session()->has('sewa_gedung_id')) {
            return redirect()->back()->with('error', 'There is no item in the cart');
        }

        $request->validate([
            'billing_name' => 'required',
            'billing_email' => 'required|email',
            'billing_phone' => 'required',
            'billing_country' => 'required',
            'billing_address' => 'required',
            'billing_state' => 'required',
            'billing_city' => 'required',
            'billing_zip' => 'required',
            'payment_method' => 'required'
        ]);

        session()->put('billing_name',$request->billing_name);
        session()->put('billing_email',$request->billing_email);
        session()->put('billing_phone',$request->billing_phone);
        session()->put('billing_country',$request->billing_country);
        session()->put('billing_address',$request->billing_address);
        session()->put('billing_state',$request->billing_state);
        session()->put('billing_city',$request->billing_city);
        session()->put('billing_zip',$request->billing_zip);
        session()->put('payment_method',$request->payment_method);

        if ($request->payment_method == 'midtrans') {
            return view('front.bayar.midtrans');
        } else {
            $data = array(
                'rekening' => Rekening::all()
            );
            return view('front.bayar.transfer', $data);
        }
    }

    public function transaksi()
    {
        if(!Auth::guard('customer')->check()) {
            return redirect()->back()->with('error', 'You must have to login in order to checkout');
        }
        $orders = Bayar::where('customer_id', Auth::guard('customer')->user()->id)->orderBy('id','desc')->get();
        return view('front.transaksi.transaksi',compact('orders'));
    }

    public function transaksi_detail($id)
    {
        if(!Auth::guard('customer')->check()) {
            return redirect()->back()->with('error', 'You must have to login in order to checkout');
        }

        $order = Bayar::where('id',$id)->first();
        $order_detail = OrderDetail::where('order_id',$id)->get();
        return view('front.transaksi.detail', compact('order','order_detail'));
    }

    public function transaksi_detail_bank($id)
    {
        if(!Auth::guard('customer')->check()) {
            return redirect()->back()->with('error', 'You must have to login in order to checkout');
        }

        $order = Bayar::where('id',$id)->first();
        $order_detail = BayarDetail::where('order_id',$id)->get();
        return view('front.transaksi.detail_banktransfer', compact('order','order_detail'));
    }

    public function callback(Request $request)
    {
        // Set konfigurasi midtrans
        Config::$serverKey = config('services.midtrans.serverKey');
        Config::$clientKey = config('services.midtrans.clientKey');
        Config::$isProduction = config('services.midtrans.isProduction');
        Config::$isSanitized = config('services.midtrans.isSanitized');
        Config::$is3ds = config('services.midtrans.is3ds');

        // Buat instance midtrans notification
        $notification = new Notification();

        // Assign ke variable untuk memudahkan coding
        $status = $notification->transaction_status;
        $type = $notification->payment_type;
        $orderId = $notification->order_id;
        $fraud = $notification->fraud_status;

        // Handle notifikasi status midtrans
        if ($status == 'capture') {
            if ($type == 'credit_card') {
                if ($fraud == 'challenge') {
                    Bayar::where('order_no', $orderId)->update(['status' => 'Pending']);
                } else {
                    Bayar::where('order_no', $orderId)->update(['status' => 'Completed']);
                }
            }
        } elseif ($status == 'settlement') {
            Bayar::where('order_no', $orderId)->update(['status' => 'Completed']);
        } elseif ($status == 'pending') {
            Bayar::where('order_no', $orderId)->update(['status' => 'Pending']);
        } elseif ($status == 'deny') {
            Bayar::where('order_no', $orderId)->update(['status' => 'Cancelled']);
        } elseif ($status == 'expire') {
            Bayar::where('order_no', $orderId)->update(['status' => 'Cancelled']);
        } elseif ($status == 'cancel') {
            Bayar::where('order_no', $orderId)->update(['status' => 'Cancelled']);
        }

    }
    public function transfer_bank($id, Request $request)
    {
        if ( Auth::user()->roles == 'ADMIN' ) {
            //menampilkan view pembayaran
            $data = array(
                'rekening' => Rekening::all(),
                'order' => Transaction::findOrFail($id)
            );
            return view('pages.transfer_bank', $data);
        } else {
            //menampilkan view pembayaran
            $data = array(
                'rekening' => Rekening::all(),
                'order' => Bayar::where('order_no', $id)->where('customer_id', Auth::guard('customer')->user()->id)->first()
            );
            return view('pages.transfer_bank', $data);
        }

    }
    public function kirimbukti(Request $request)
    {
        //validasi
        $this->validate($request, [
            'order_no' => 'required',
            'bukti_pembayaran' => 'required|image|mimes:jpeg,png,jpg|max:2048'
        ]);
        //upload gambar
        $order_no = $request->order_no;
        //update data
        $order = Bayar::where('order_no', $order_no)->where('customer_id', Auth::guard('customer')->user()->id)->first();
        if($request->file('bukti_pembayaran')){
            $file = $request->file('bukti_pembayaran')->store('bukti_pembayaran','public');
            $order->bukti_pembayaran = $file;
            $order->status = 'Pending';
            $order->save();
            //redirect
            return redirect()->route('transaksi')->with('success', 'Bukti Pembayaran Berhasil Diupload');
        }

    }

}
