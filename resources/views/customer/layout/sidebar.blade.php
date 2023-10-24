<div class="main-sidebar">
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand">
            <a href="{{ route('customer_home') }}">User</a>
        </div>
        <div class="sidebar-brand sidebar-brand-sm">
            <a href="{{ route('customer_home') }}"></a>
        </div>

        <ul class="sidebar-menu">

            <li class="nav-item dropdown {{ Request::is('customer/datewise-rooms')||Request::is('customer/datewise-gedung') ? 'active' : '' }}">
                <a href="#" class="nav-link has-dropdown"><i class="fa fa-calendar"></i><span>Ketersediaan Fasilitas</span></a>
                <ul class="dropdown-menu">
                    <li class="{{ Request::is('customer/datewise-rooms') ? 'active' : '' }}"><a class="nav-link" href="{{ route('customer_datewise_rooms') }}" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-title="Datewise Rooms"><i class="fa fa-angle-right"></i> <span> Cek Kamar</span></a></li>
                    <li class="{{ Request::is('customer/datewise-gedung') ? 'active' : '' }}"><a class="nav-link" href="{{ route('customer_datewise_gedung') }}" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-title="Datewise Gedung"><i class="fa fa-angle-right"></i> <span> Cek Gedung</span></a></li>
                </ul>
            </li>

            <!-- <li class="{{ Request::is('customer/home') ? 'active' : '' }}"><a class="nav-link" href="{{ route('customer_home') }}"><i class="fa fa-hand-o-right"></i> <span>Order</span></a></li> -->

            <!-- <li class="{{ Request::is('customer/order/*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('customer_order_view') }}"><i class="fa fa-hand-o-right"></i> <span>Cek Fasilitas</span></a></li> -->


            {{-- <li class="nav-item dropdown {{ Request::is('admin/amenity/view')||Request::is('admin/room/view') ? 'active' : '' }}">
                <a href="#" class="nav-link has-dropdown"><i class="fa fa-hand-o-right"></i><span>Room Section</span></a>
                <ul class="dropdown-menu">
                    <li class="{{ Request::is('admin/amenity/view') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin_amenity_view') }}"><i class="fa fa-angle-right"></i> Amenities</a></li>

                    <li class="{{ Request::is('admin/room/view') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin_room_view') }}"><i class="fa fa-angle-right"></i> Rooms</a></li>
                </ul>
            </li> --}}


            {{-- <li class="{{ Request::is('admin/faq/*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin_faq_view') }}"><i class="fa fa-hand-o-right"></i> <span>FAQ</span></a></li> --}}


        </ul>
    </aside>
</div>