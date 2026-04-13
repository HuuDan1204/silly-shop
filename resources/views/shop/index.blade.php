
<!DOCTYPE html>
<html lang="en">
@include('card.client.head')

<body>
    <!-- Topbar Start -->
@include('card.client.topbar')
   
    <!-- Topbar End -->


    <!-- Navbar Start -->
   @include('card.client.navbar')

    <!-- Navbar End -->


    <!-- Featured Start -->
   @include('card.client.featured')
    <!-- Featured End -->


    <!-- Categories Start -->
    @include('card.client.categories')
    <!-- Categories End -->


    <!-- Offer Start -->
    @include('card.client.offer')
    <!-- Offer End -->


    <!-- Products Start -->
    @include('card.client.productstart')
    <!-- Products End -->


    <!-- Subscribe Start -->
    
    <!-- Subscribe End -->


    <!-- Products Start -->
    
    <!-- Products End -->


    <!-- Vendor Start -->
  
    <!-- Vendor End -->


    <!-- Footer Start -->
    @include('card.client.footer')
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    @include('card.client.script')
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    @if(session('success'))
<script>
    toastr.success("{{ session('success') }}");
</script>
@endif

@if(session('error'))
<script>
    toastr.error("{{ session('error') }}");
</script>
@endif
</body>

</html>