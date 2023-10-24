<!DOCTYPE html>
<html lang="en" style="background-color:#001C30">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">

    <link rel="icon" type="image/png" href="uploads/favicon.png">

    <title>Admin Panel</title>

    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@400;600;700&display=swap" rel="stylesheet">

    @include('admin.layout.styles')

    @include('admin.layout.scripts')

</head>

<body>
<div id="app">
    <div class="main-wrapper" style="background-color:#001C30">
        <section class="section">
            <div class="container container-login">
                <div class="row">
                    <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
                        <div class="card card-primary border-box" style="background: linear-gradient(126.95deg, #000000 0%, #F9FFB1 100%), radial-gradient(91.23% 100% at 50% 100%, #BE002E 0%, #6100FF 100%), linear-gradient(307.27deg, #1DAC92 0.37%, #2800C6 100%), radial-gradient(100% 140% at 100% 0%, #EAFF6B 0%, #006C7A 57.29%, #2200AA 100%);
background-blend-mode: overlay, difference, difference, normal;">
                            <div class="card-header card-header-auth">
                                <h4 class="text-center"><font color="white">Menu Login Admin</h4>
                            </div>
                            <div class="card-body card-body-auth">

                                @if(session()->get('success'))
                                    <div class="text-success">{{ session()->get('success') }}</div>
                                @endif

                                <form method="POST" action="{{ route('admin_login_submit') }}">
                                    @csrf
                                    <div class="form-group">
                                        <input type="text" class="form-control @error('email') is-invalid @enderror" name="email" placeholder="Email Address" value="{{ old('email') }}" autofocus>
                                        @error('email')
                                            <div class="text-danger">{{ $message }}</div>
                                        @enderror
                                        @if(session()->get('error'))
                                            <div class="text-danger">{{ session()->get('error') }}</div>
                                        @endif
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control @error('password') is-invalid @enderror" name="password" placeholder="Password">
                                        @error('password')
                                            <div class="text-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary btn-lg btn-block" style="background-color: #090580;">
                                            Login
                                        </button>
                                    </div>
                                    <div class="form-group">
                                        <div>
                                            <a href="{{ route('admin_forget_password') }}">
                                                <p style="color: #FCE22A;">Forget Password?</p>
                                            </a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

@include('admin.layout.scripts_footer')

</body>
</html>