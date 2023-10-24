<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use App\Models\OrderDetail;

class AdminFaqController extends Controller
{
    public function index()
    {
        // Mendapatkan semua data dari tabel order_details
        $orderDetails = OrderDetail::all();

        $otherTableData = Order::all();

        // Lakukan sesuatu dengan data yang ditemukan
        foreach ($orderDetails as $orderDetail) {
            // Lakukan operasi yang diinginkan untuk setiap order detail
            echo $orderDetail->id;
        }

        foreach ($otherTableData as $orders) {
            // Lakukan operasi yang diinginkan untuk setiap data dari other_table
            echo $orders->status;
        }

        // Kembalikan tampilan atau respon yang sesuai
        return view('admin.faq_view', compact('orderDetails', 'otherTableData'));
    }
}
