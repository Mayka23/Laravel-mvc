@extends('front.layout.app')

@section('main_content')
<div class="page-top">
    <div class="bg" style="background: linear-gradient(180deg, #FFFFFF 0%, #000000 100%), linear-gradient(90deg, #FFFFFF 0%, #000000 100%), #0000FF;
background-blend-mode: multiply, screen, normal;"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{{ $single_post_data->heading }}</h2>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-6212352ed76fda0a"></script>

<div class="page-content" style="background: radial-gradient(100% 225% at 100% 0%, #FF0000 0%, #000000 100%), linear-gradient(236deg, #00C2FF 0%, #000000 100%), linear-gradient(135deg, #CDFFEB 0%, #CDFFEB 36%, #009F9D 36%, #009F9D 60%, #07456F 60%, #07456F 67%, #0F0A3C 67%, #0F0A3C 100%);
background-blend-mode: overlay, hard-light, normal;">
    <div class="container">
        <div class="row justify-content-center">


            <div class="col-lg-8 col-md-12">
                <div class="featured-photo">
                    <img src="{{ asset('uploads/'.$single_post_data->photo) }}" alt="">
                </div>
                <div class="sub">
                    <div class="item" style="color: white">
                        <b><i class="fa fa-clock-o"></i></b>
                        {{ date('d M, Y', strtotime($single_post_data->updated_at)) }}
                    </div>
                    <div class="item">
                        <b><i class="fa fa-eye" style="color: white"></i></b>
                        {{ $single_post_data->total_view }}
                    </div>
                </div>
                <div class="main-text" style="color: white">
                    {!! $single_post_data->content !!}
                </div>
                <div class="share-content" style="color: white">
                    <h2>Share</h2>
                    <div class="addthis_inline_share_toolbox"></div>
                </div>
            </div>



        </div>
    </div>
</div>
@endsection