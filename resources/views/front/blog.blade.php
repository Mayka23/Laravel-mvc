@extends('front.layout.app')

@section('main_content')
<div class="page-top">
    <div class="bg" style="background: linear-gradient(180deg, #FFFFFF 0%, #000000 100%), linear-gradient(90deg, #FFFFFF 0%, #000000 100%), #0000FF;
background-blend-mode: multiply, screen, normal;"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{{ $global_page_data->blog_heading }}</h2>
            </div>
        </div>
    </div>
</div>

<div class="home-feature" style="background-color:black">
    <div class="container">
        <div class="row">
        </div>
    </div>

<div class="blog-item"  style="background: radial-gradient(100% 225% at 100% 0%, #FF0000 0%, #000000 100%), linear-gradient(236deg, #00C2FF 0%, #000000 100%), linear-gradient(135deg, #CDFFEB 0%, #CDFFEB 36%, #009F9D 36%, #009F9D 60%, #07456F 60%, #07456F 67%, #0F0A3C 67%, #0F0A3C 100%);
background-blend-mode: overlay, hard-light, normal;">
    <div class="container">
        <div class="row">
            @foreach($post_all as $item)
            <div class="col-md-4">
                <div class="inner">
                    <div class="photo">
                        <img src="{{ asset('uploads/'.$item->photo) }}" alt="">
                    </div>
                    <div class="text">
                        <h2><a href="{{ route('post',$item->id) }}" style="color: white">{{ $item->heading }}</a></h2>
                        <div class="short-des">
                            <p style="color: white">
                                {!! $item->short_content !!}
                            </p>
                        </div>
                        <div class="button">
                            <a href="{{ route('post',$item->id) }}" class="btn btn-primary" style="color: white">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        </div>

        <div class="row">
            <div class="col-md-12">
                {{ $post_all->links() }}
            </div>
        </div>

    </div>
</div>
@endsection