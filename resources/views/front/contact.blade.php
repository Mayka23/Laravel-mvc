@extends('front.layout.app')

@section('main_content')
<div class="page-top">
    <div class="bg" style="background: linear-gradient(180deg, #FFFFFF 0%, #000000 100%), linear-gradient(90deg, #FFFFFF 0%, #000000 100%), #0000FF;
background-blend-mode: multiply, screen, normal;"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{{ $page_data->contact_heading }}</h2>
            </div>
        </div>
    </div>
</div>

<div class="page-content" style="background: radial-gradient(100% 225% at 100% 0%, #FF0000 0%, #000000 100%), linear-gradient(236deg, #00C2FF 0%, #000000 100%), linear-gradient(135deg, #CDFFEB 0%, #CDFFEB 36%, #009F9D 36%, #009F9D 60%, #07456F 60%, #07456F 67%, #0F0A3C 67%, #0F0A3C 100%);
background-blend-mode: overlay, hard-light, normal;">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-12">
                <form action="{{ route('contact_send_email') }}" method="post" class="form_contact_ajax">
                    @csrf
                    <div class="contact-form">
                        <div class="mb-3">
                            <label for="" class="form-label" style="color: white">Nama</label>
                            <input type="text" class="form-control" name="name">
                            <span class="text-danger error-text name_error"></span>
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label" style="color: white">Alamat Email</label>
                            <input type="text" class="form-control" name="email">
                            <span class="text-danger error-text email_error"></span>
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label" style="color: white">Pesan</label>
                            <textarea class="form-control" rows="3" name="message"></textarea>
                            <span class="text-danger error-text message_error"></span>
                        </div>
                        <div class="mb-3">
                            <button type="submit" class="btn btn-primary bg-website">Kirim Pesan</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-6 col-md-12">
                <div class="map">
                    {!! $page_data->contact_map !!}
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    (function($){
        $(".form_contact_ajax").on('submit', function(e){
            e.preventDefault();
            $('#loader').show();
            var form = this;
            $.ajax({
                url:$(form).attr('action'),
                method:$(form).attr('method'),
                data:new FormData(form),
                processData:false,
                dataType:'json',
                contentType:false,
                beforeSend:function(){
                    $(form).find('span.error-text').text('');
                },
                success:function(data)
                {
                    $('#loader').hide();
                    if(data.code == 0)
                    {
                        $.each(data.error_message, function(prefix, val) {
                            $(form).find('span.'+prefix+'_error').text(val[0]);
                        });
                    }
                    else if(data.code == 1)
                    {
                        $(form)[0].reset();
                        iziToast.success({
                            title: '',
                            position: 'topRight',
                            message: data.success_message,
                        });
                    }
                    
                }
            });
        });
    })(jQuery);
</script>
<div id="loader"></div>
@endsection