@extends('front.layout.app')

@section('main_content')
<div class="page-top">
    <div class="bg" style="background: linear-gradient(180deg, #FFFFFF 0%, #000000 100%), linear-gradient(90deg, #FFFFFF 0%, #000000 100%), #0000FF;
background-blend-mode: multiply, screen, normal;"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{{ $global_page_data->signin_heading }}</h2>
            </div>
        </div>
    </div>
</div>

<div class="page-content"  style="background: radial-gradient(100% 225% at 100% 0%, #FF0000 0%, #000000 100%), linear-gradient(236deg, #00C2FF 0%, #000000 100%), linear-gradient(135deg, #CDFFEB 0%, #CDFFEB 36%, #009F9D 36%, #009F9D 60%, #07456F 60%, #07456F 67%, #0F0A3C 67%, #0F0A3C 100%);
background-blend-mode: overlay, hard-light, normal;">
    <div class="container" >
        <div class="row justify-content-center">
            <div class="col-4">

                <form action="{{ route('customer_login_submit') }}" method="post">
                    @csrf
                    <div class="login-form">
                        <div class="mb-3">
                            <label for="" class="form-label"><font color="white">Email</label>
                            <input type="text" class="form-control" name="email">
                            @if($errors->has('email'))
                                <span class="text-danger">{{ $errors->first('email') }}</span>
                            @endif
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">Password</label>
                            <input type="password" class="form-control" name="password">
                            @if($errors->has('password'))
                                <span class="text-danger">{{ $errors->first('password') }}</span>
                            @endif
                        </div>
                        <div class="mb-3">
                            <button type="submit" class="btn btn-primary bg-website">Masuk</button>
                            <a href="{{ route('customer_forget_password') }}" class="primary-color"><font color="white">Lupa Password?</a>
                        </div>
                        <div class="mb-3">
                            <a href="{{ route('customer_signup') }}" class="primary-color"><font color="white">User Baru? Registrasi</a>
                        </div>
                    </div>
                </form>


            </div>
        </div>
    </div>
</div>
@endsection