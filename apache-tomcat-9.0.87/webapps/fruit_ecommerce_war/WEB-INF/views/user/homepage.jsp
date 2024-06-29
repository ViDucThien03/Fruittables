<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/10/2024
  Time: 5:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>HomePage</title>
<body>
<!-- Hero Start -->
<div class="container-fluid py-5 mb-5 hero-header">
    <div class="container py-5">
        <div class="row g-5 align-items-center">
            <div class="col-md-12 col-lg-7">
                <h4 class="mb-3 text-secondary">100% Organic Foods</h4>
                <h1 class="mb-5 display-3 text-primary">Organic Veggies & Fruits Foods</h1>
                <div class="position-relative mx-auto">
                    <input class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" type="number"
                           placeholder="Search">
                    <button type="submit"
                            class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100"
                            style="top: 0; right: 25%;">Submit Now
                    </button>
                </div>
            </div>

            <div class="col-md-12 col-lg-5">

                <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                        <c:forEach var="cate" items="${categories}" varStatus="loop">
                            <div class="carousel-item ${loop.first ? "active" : ""}  rounded">
                                <img src="<c:url value="/resource/user/img/categories/${cate.cateImg}"/>"
                                     class="img-fluid w-100 h-100 bg-secondary rounded"
                                     alt="slide-${cate.cateId}">
                                <a href="#" class="btn px-4 py-2 text-white rounded">${cate.cateName}</a>
                            </div>
                        </c:forEach>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselId"
                            data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselId"
                            data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- Hero End -->


<!-- Featurs Section Start -->
<div class="container-fluid featurs py-5">
    <div class="container py-5">
        <div class="row g-4">
            <div class="col-md-6 col-lg-3">
                <div class="featurs-item text-center rounded bg-light p-4">
                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                        <i class="fas fa-car-side fa-3x text-white"></i>
                    </div>
                    <div class="featurs-content text-center">
                        <h5>Miễn phí vận chuyển</h5>
                        <p class="mb-0">Trong khu vực nội thành</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="featurs-item text-center rounded bg-light p-4">
                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                        <i class="fas fa-user-shield fa-3x text-white"></i>
                    </div>
                    <div class="featurs-content text-center">
                        <h5>Thanh toán an toàn</h5>
                        <p class="mb-0">100% Thanh toán an toàn</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="featurs-item text-center rounded bg-light p-4">
                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                        <i class="fas fa-exchange-alt fa-3x text-white"></i>
                    </div>
                    <div class="featurs-content text-center">
                        <h5>Hỗ trợ hoàn trả</h5>
                        <p class="mb-0">Hỗ trợ hoàn tiền</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="featurs-item text-center rounded bg-light p-4">
                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                        <i class="fa fa-phone-alt fa-3x text-white"></i>
                    </div>
                    <div class="featurs-content text-center">
                        <h5>Hỗ trợ 24/7</h5>
                        <p class="mb-0">Hỗ trợ nhiệt tình</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Featurs Section End -->


<!-- Fruits Shop Start-->
<div class="container-fluid fruite py-5">
    <div class="container py-5">
        <div class="tab-class text-center">
            <div class="row g-4">
                <div class="col-lg-4 text-start">
                    <h1>Sản phẩm hữu cơ</h1>
                </div>
                <div class="col-lg-8 text-end">
                    <ul class="nav nav-pills d-inline-flex text-center mb-5">
                        <li class="nav-item">
                            <a class="d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill"
                               href="#tab-1">
                                <span class="text-dark" style="width: 130px;">All Products</span>
                            </a>
                        </li>
                        <c:forEach var="cate" items="${categories}">
                            <li class="nav-item">
                                <a class="d-flex py-2 m-2 bg-light rounded-pill" data-bs-toggle="pill"
                                   href="#tab-${cate.cateId + 1}" id="cate-${cate.cateId}">

                                    <span class="text-dark" style="width: 130px;">${cate.cateName}</span>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="tab-content">
            <div id="tab-1" class="tab-pane fade show p-0 active">
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4 list-product">

                        </div>
                    </div>
                </div>
            </div>
            <c:forEach var="cate" items="${categories}">
            <div id="tab-${cate.cateId + 1}" class="tab-pane fade show p-0">
                </c:forEach>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4 result-ajax">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Fruits Shop End-->

<div class="col-12 page-product">
    <div class="pagination d-flex justify-content-center mt-5">
<%--        <a href="#" class="rounded">&laquo;</a>--%>
        <c:if test="${not empty endPage}">
            <c:forEach begin="1" end="${endPage}" var="i">
                <button class="active rounded px-3 border-warning border-1 me-2 bg-white" id="page-${i}">${i}</button>
            </c:forEach>
        </c:if>
<%--        THUA MOT PHAN TRANG--%>
<%--        <c:if test="${not empty endPageProductByCate}">--%>
<%--            <c:forEach begin="1" end="${endPageProductByCate}" var="i">--%>
<%--                <button class="active rounded px-3 border-warning border-1 me-2 bg-white" id="page-${i}">${i}</button>--%>
<%--            </c:forEach>--%>
<%--        </c:if>--%>
<%--        <a href="#" class="rounded">&raquo;</a>--%>
    </div>
</div>

<!-- Featurs Start -->
<div class="container-fluid service py-5">
    <div class="container py-5">
        <div class="row g-4 justify-content-center">
            <div class="col-md-6 col-lg-4">
                <a href="#">
                    <div class="service-item bg-secondary rounded border border-secondary">
                        <img src="<c:url value="/resource/user/img/featur-1.jpg"/>" class="img-fluid rounded-top w-100"
                             alt=""/>
                        <div class="px-4 rounded-bottom">
                            <div class="service-content bg-primary text-center p-4 rounded">
                                <h5 class="text-white">Fresh Apples</h5>
                                <h3 class="mb-0">20% OFF</h3>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-6 col-lg-4">
                <a href="#">
                    <div class="service-item bg-dark rounded border border-dark">
                        <img src="<c:url value="/resource/user/img/featur-2.jpg"/>" class="img-fluid rounded-top w-100"
                             alt="">
                        <div class="px-4 rounded-bottom">
                            <div class="service-content bg-light text-center p-4 rounded">
                                <h5 class="text-primary">Tasty Fruits</h5>
                                <h3 class="mb-0">Free delivery</h3>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-6 col-lg-4">
                <a href="#">
                    <div class="service-item bg-primary rounded border border-primary">
                        <img src="<c:url value="/resource/user/img/featur-3.jpg"/>" class="img-fluid rounded-top w-100"
                             alt="">
                        <div class="px-4 rounded-bottom">
                            <div class="service-content bg-secondary text-center p-4 rounded">
                                <h5 class="text-white">Exotic Vegitable</h5>
                                <h3 class="mb-0">Discount 30$</h3>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- Featurs End -->


<!-- Vesitable Shop Start-->
<div class="container-fluid vesitable py-5">
    <div class="container py-5">
        <h1 class="mb-0">Rau quả tươi</h1>
        <div class="owl-carousel vegetable-carousel justify-content-center">
            <c:forEach var="list" items="${listvegetable}">
            <div class="border border-primary rounded position-relative vesitable-item">
                <div class="vesitable-img">
                    <img src="<c:url value="/resource/user/img/products/${list.productImg}"/>"
                         class="img-fluid w-100 rounded-top" alt="">
                </div>
                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                     style="top: 10px; right: 10px;">${list.cateName}
                </div>
                <div class="p-4 rounded-bottom">
                    <h4>${list.productName}</h4>
<%--                    <p>${list.shortDesc}t</p>--%>
                    <div class="d-flex justify-content-between flex-lg-wrap">
                        <p class="text-dark fs-5 fw-bold mb-0">${list.productPrice} / kg</p>
                        <a href="${pageContext.request.contextPath}/addCart/${list.productId}/1" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- Vesitable Shop End -->


<!-- Banner Section Start-->
<div class="container-fluid banner bg-secondary my-5">
    <div class="container py-5">
        <div class="row g-4 align-items-center">
            <div class="col-lg-6">
                <div class="py-4">
                    <h1 class="display-3 text-white">Fresh Exotic Fruits</h1>
                    <p class="fw-normal display-3 text-dark mb-4">in Our Store</p>
                    <p class="mb-4 text-dark">The generated Lorem Ipsum is therefore always free from repetition
                        injected humour, or non-characteristic words etc.</p>
                    <a href="#"
                       class="banner-btn btn border-2 border-white rounded-pill text-dark py-3 px-5">BUY</a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="position-relative">
                    <img src="<c:url value="/resource/user/img/baner-1.png"/>" class="img-fluid w-100 rounded" alt="">
                    <div class="d-flex align-items-center justify-content-center bg-white rounded-circle position-absolute"
                         style="width: 140px; height: 140px; top: 0; left: 0;">
                        <h1 style="font-size: 100px;">1</h1>
                        <div class="d-flex flex-column">
                            <span class="h2 mb-0">50$</span>
                            <span class="h4 text-muted mb-0">kg</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner Section End -->


<!-- Bestsaler Product Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="text-center mx-auto mb-5" style="max-width: 700px;">
            <h1 class="display-4">Sản phẩm bán chạy</h1>
            <p>Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which
                looks reasonable.</p>
        </div>
        <div class="row g-4">
            <c:forEach var="seller" items="${bestseller}">
            <div class="col-lg-6 col-xl-4">
                <div class="p-4 rounded bg-light">
                    <div class="row align-items-center">
                        <div class="col-6">
                            <img src="<c:url value="/resource/user/img/products/${seller.productImg}"/>"
                                 class="img-fluid rounded-circle w-100" alt=""/>
                        </div>
                        <div class="col-6">
                            <a href="#" class="h5">${seller.productName}</a>
                            <div class="d-flex my-3">
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star"></i>
                            </div>
                            <h4 class="mb-3">${seller.productPrice}</h4>
                            <a href="${pageContext.request.contextPath}/addCart/${seller.productId}/1" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                    class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- Bestsaler Product End -->


<!-- Fact Start -->
<div class="container-fluid py-5">
    <div class="container">
        <div class="bg-light p-5 rounded">
            <div class="row g-4 justify-content-center">
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>satisfied customers</h4>
                        <h1>1963</h1>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>quality of service</h4>
                        <h1>99%</h1>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>quality certificates</h4>
                        <h1>33</h1>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>Available Products</h4>
                        <h1>789</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Fact Start -->

<!-- Tastimonial Start -->
<div class="container-fluid testimonial py-5">
    <div class="container py-5">
        <div class="testimonial-header text-center">
            <h4 class="text-primary">Our Testimonial</h4>
            <h1 class="display-5 mb-5 text-dark">Phản hồi khách hàng</h1>
        </div>
        <div class="owl-carousel testimonial-carousel">
            <div class="testimonial-item img-border-radius bg-light rounded p-4">
                <div class="position-relative">
                    <i class="fa fa-quote-right fa-2x text-secondary position-absolute"
                       style="bottom: 30px; right: 0;"></i>
                    <div class="mb-4 pb-4 border-bottom border-secondary">
                        <p class="mb-0">Lorem Ipsum is simply dummy text of the printing Ipsum has been the
                            industry's standard dummy text ever since the 1500s,
                        </p>
                    </div>
                    <div class="d-flex align-items-center flex-nowrap">
                        <div class="bg-secondary rounded">
                            <img src="<c:url value="/resource/user/img/testimonial-1.jpg"/>" class="img-fluid rounded"
                                 style="width: 100px; height: 100px;" alt=""/>
                        </div>
                        <div class="ms-4 d-block">
                            <h4 class="text-dark">Client Name</h4>
                            <p class="m-0 pb-3">Profession</p>
                            <div class="d-flex pe-5">
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="testimonial-item img-border-radius bg-light rounded p-4">
                <div class="position-relative">
                    <i class="fa fa-quote-right fa-2x text-secondary position-absolute"
                       style="bottom: 30px; right: 0;"></i>
                    <div class="mb-4 pb-4 border-bottom border-secondary">
                        <p class="mb-0">Lorem Ipsum is simply dummy text of the printing Ipsum has been the
                            industry's standard dummy text ever since the 1500s,
                        </p>
                    </div>
                    <div class="d-flex align-items-center flex-nowrap">
                        <div class="bg-secondary rounded">
                            <img src="<c:url value="/resource/user/img/testimonial-1.jpg"/>" class="img-fluid rounded"
                                 style="width: 100px; height: 100px;" alt="">
                        </div>
                        <div class="ms-4 d-block">
                            <h4 class="text-dark">Client Name</h4>
                            <p class="m-0 pb-3">Profession</p>
                            <div class="d-flex pe-5">
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="testimonial-item img-border-radius bg-light rounded p-4">
                <div class="position-relative">
                    <i class="fa fa-quote-right fa-2x text-secondary position-absolute"
                       style="bottom: 30px; right: 0;"></i>
                    <div class="mb-4 pb-4 border-bottom border-secondary">
                        <p class="mb-0">Lorem Ipsum is simply dummy text of the printing Ipsum has been the
                            industry's standard dummy text ever since the 1500s,
                        </p>
                    </div>
                    <div class="d-flex align-items-center flex-nowrap">
                        <div class="bg-secondary rounded">
                            <img src="<c:url value="/resource/user/img/testimonial-1.jpg"/>" class="img-fluid rounded"
                                 style="width: 100px; height: 100px;" alt="">
                        </div>
                        <div class="ms-4 d-block">
                            <h4 class="text-dark">Client Name</h4>
                            <p class="m-0 pb-3">Profession</p>
                            <div class="d-flex pe-5">
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Tastimonial End -->
<script type="text/javascript">

    $(document).ready(function () {

        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/products/1.html',
            success: function (data) {
                $('.list-product').html(data);
            },
            error: function (XMLHttpResponse, textStatus, errorThrown) {
                XMLHttpResponse.toString();
            }
        });
    });
    $(document).ready(function () {
        $('.nav-item a').click(function () {
            let cateId = $(this).attr('id').split('-')[1];
            let url = '/productbycate/' + cateId +'/1'+ '.html';

            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}' + url,
                success: function (data) {
                    $('.result-ajax').html(data)


                },
                error: function (XMLHttpResponse, textStatus, errorThrown) {
                    XMLHttpResponse.toString()
                },

            });
        });
    });

    $(document).ready(function () {

        $('.nav-item a').click(function () {
            let cateId = $(this).attr('id').split('-')[1];
            let index = $(this).attr('id').split('-')[1];
            let url = '/productbycate/' + cateId + '/'+index+ '.html';

            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}' + url,
                success: function (data) {
                    $('.result-ajax').html(data)
                },
                error: function (XMLHttpResponse, textStatus, errorThrown) {
                    XMLHttpResponse.toString()
                },

            });

        });
        $('.page-product button').click(function () {
            let index = $(this).attr('id').split('-')[1];
            let url = '/products/' + index + '.html';

            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}' + url,
                success: function (data) {
                    $('.list-product').html(data);
                },
                error: function (XMLHttpResponse, textStatus, errorThrown) {
                    XMLHttpResponse.toString();
                }
            });
        });
    });
</script>
</body>
