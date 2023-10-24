@extends('admin.layout.app')

@section('heading', 'Cetak Laporan')

@section('right_top_button')
<a href="javascript:window.print();" class="btn btn-warning btn-icon icon-left text-white print-invoice-button"><i class="fa fa-print"></i> Print</a>
<a href="{{ route('admin_orders') }}" class="btn btn-primary"><i class=""></i>Kembali</a>
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
                                        <th>Metode Pembayaran</th>
                                        <th>Status Pembayaran</th>
                                        <th>Tanggal Booking</th>
                                        <th>Telah Dibayar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($cetak as $row)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>{{ $row->order_no }}</td>
                                            <td>{{ $row->payment_method }}</td>
                                            <td>
                                                @if ($row->status == 'Pending')
                                                    <span class="badge badge-warning">Pending</span>
                                                @elseif($row->status == 'Completed')
                                                    <span class="badge badge-success">Completed</span>
                                                @elseif($row->status == 'Cancel')
                                                    <span class="badge badge-danger">Batal</span>
                                                @endif
                                            </td>
                                            <td>{{ $row->booking_date }}</td>
                                    
                                            <td>Rp. {{ number_format($row->paid_amount, 0) }}</td>
                                            
                                            
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
