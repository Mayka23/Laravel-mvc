@extends('admin.layout.app')

@section('heading', 'Laporan')

@section('right_top_button')
<a href="javascript:window.print();" class="btn btn-warning btn-icon icon-left text-white print-invoice-button"><i class="fa fa-print"></i> Print</a>
@endsection

@section('main_content')
<div class="section-body">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="example1">
                            <thead>
                                <tr>
                                    <th>SL</th>
                                    <th>No Order</th>
                                    <th class="text-right">Status</th>
                                    <th class="text-center">Tanggal Checkin</th>
                                    <th class="text-center">Tanggal Checkout</th>
                                    <th class="text-center">Jumlah Dewasa</th>
                                    <th class="text-center">Jumlah Anak</th>
                                    <th class="text-right">Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
                            @foreach($otherTableData as $key => $orders)
                                <tr>
                                    <td>{{ $key + 1 }}</td>
                                    <td class="text-center">{{ $orders->order_no }}</td>
                                    <td class="text-center">{{ $orders->status }}</td>
                                    @foreach($orderDetails as $key2 => $orderDetail)
                                        @if ($key == $key2)
                                        <td class="text-center">{{ $orderDetail->checkin_date }}</td>
                                        <td class="text-center">{{ $orderDetail->checkout_date }}</td>
                                        <td class="text-center">{{ $orderDetail->adult }}</td>
                                        <td class="text-center">{{ $orderDetail->children }}</td>
                                        <td class="text-right">{{ $orderDetail->subtotal }}</td>
                                        @endif
                                    @endforeach
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