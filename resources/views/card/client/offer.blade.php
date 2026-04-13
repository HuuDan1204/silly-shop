<div class="row">
@foreach ($vouchers as $voucher)
    <div class="col-md-6 mb-3">
        <form action="{{ route('dashboard.voucher.accept', $voucher->id) }}" method="POST">
            @csrf

            <button type="submit" class="voucher-card">

                {{-- LEFT --}}
                <div class="voucher-left">
                    <h5>{{ $voucher->code }}</h5>
                    <small>
                        Giảm {{ $voucher->value }}
                        {{ $voucher->type_discount == 'percent' ? '%' : 'đ' }}
                    </small>
                </div>

                {{-- CENTER --}}
                <div class="voucher-middle">
                    NHẬN
                </div>

                {{-- RIGHT --}}
                <div class="voucher-right">
                    <img src="{{ asset($voucher->image ?? 'assets/images/shop/demo-fashion-store-menu-banner-01.jpg') }}">
                </div>

            </button>
        </form>
    </div>
@endforeach
</div>

<style>
.voucher-card {
    display: flex;
    width: 100%;
    border: none;
    padding: 0;
    background: white;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 3px 10px rgba(0,0,0,0.1);
    cursor: pointer;
    transition: 0.2s;
}

.voucher-card:hover {
    transform: translateY(-3px);
}

.voucher-left {
    flex: 1;
    padding: 15px;
    background: #fff3cd;
}

.voucher-left h5 {
    margin: 0;
    color: #dc3545;
}

.voucher-middle {
    background: #dc3545;
    color: white;
    font-weight: bold;
    padding: 0 15px;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
}

/* fake răng cưa */
.voucher-middle::before,
.voucher-middle::after {
    content: "";
    position: absolute;
    left: -6px;
    width: 12px;
    height: 12px;
    background: white;
    border-radius: 50%;
}

.voucher-middle::before {
    top: 10px;
}

.voucher-middle::after {
    bottom: 10px;
}

.voucher-right {
    width: 100px;
}

.voucher-right img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
</style>