<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use App\Models\Customer;
use App\Models\Bayar;
use App\Models\BayarDetail;

class AdminBayarController extends Controller
{
    public function index()
    {
        $orders = Bayar::get();
        return view('admin.bayars', compact('orders'));
    }

    public function cetak()
    {
        $cetak = Bayar::get();
        return view('admin.cetak', compact('cetak'));
    }

    public function status($id)
    {
        $order = Bayar::where('id',$id)->first();
        $order_detail = BayarDetail::where('order_id',$id)->get();
        $customer_data = Customer::where('id',$order->customer_id)->first();
        return view('admin.status', compact('order','order_detail','customer_data'));
    }

    public function status_edit($id)
    {
        $order = Bayar::where('id',$id)->first();
        $order_detail = BayarDetail::where('order_id',$id)->get();
        $customer_data = Customer::where('id',$order->customer_id)->first();
        return view('admin.status_edit', compact('order','order_detail','customer_data'));
    }

    public function status_update(Request $request)
    {
        $order = Bayar::where('id',$request->order_id)->first();
        $order->status = $request->status;
        $order->save();
        return redirect()->route('admin_bayars')->with('success','Status Transaksi Gedung Berhasil Dirubah');
    }

    public function delete($id)
    {
        $obj = Bayar::where('id',$id)->delete();
        $obj = BayarDetail::where('order_id',$id)->delete();

        return redirect()->back()->with('success','Transaksi Kamar Berhasil Dihapus');
    }
}
