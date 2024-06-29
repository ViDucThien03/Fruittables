<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>

<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">Shop Detail</h1>
    <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Pages</a></li>
        <li class="breadcrumb-item active text-white">Shop Detail</li>
    </ol>
</div>
<!-- Single Page Header End -->

<!-- Single Product Start -->
<div class="container-fluid py-5 mt-5">
    <div class="container py-5">
        <div class="row g-4 mb-5">
            <div class="col-lg-8 col-xl-9">
                <div class="row g-4">
                    <c:forEach var="item" items="${productById}">
                        <div class="col-lg-6">
                            <div class="border rounded">
                                <a href="#">
                                    <img src="<c:url value="/resource/user/img/products/${item.productImg}"/>" class="img-fluid rounded" alt="Image">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <h4 class="fw-bold mb-3">${item.productName}</h4>
                            <p class="mb-3">Category: ${item.cateName}</p>
                            <div class="d-flex mb-2">
                                <c:choose>
                                    <c:when test="${item.sale > 0}">
                                        <h5 class="fw-bold me-2">${item.productPrice - (item.productPrice * item.sale / 100)}
                                            vnd/kg</h5>
                                        <h5 class="text-danger text-decoration-line-through">${item.productPrice}</h5>
                                    </c:when>
                                    <c:otherwise>
                                        <h5 class="fw-bold me-2">${item.productPrice} $</h5>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="d-flex mb-4">
                                <i class="fa fa-star text-secondary"></i>
                                <i class="fa fa-star text-secondary"></i>
                                <i class="fa fa-star text-secondary"></i>
                                <i class="fa fa-star text-secondary"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <p class="mb-4">${item.productDesc}</p>


                            <div class="input-group quantity mb-5" style="width: 100px;">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <input id="quantity-itemcart-${item.productId}" type="text" class="form-control form-control-sm text-center border-0" value="1">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <a id="addToCartLink" data-id="${item.productId}" href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">
                                <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>

                        </div>
                    <div class="col-lg-12">
                        <nav>
                            <div class="nav nav-tabs mb-3">
                                <button class="nav-link active border-white border-bottom-0" type="button" role="tab"
                                        id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                                        aria-controls="nav-about" aria-selected="true">Description
                                </button>
                                <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                                        id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                        aria-controls="nav-mission" aria-selected="false">Reviews
                                </button>
                            </div>
                        </nav>
                        <div class="tab-content mb-5">
                            <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                <p>${item.productDesc}</p>
                            </div>
                            </c:forEach>
                            <div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
                                <c:forEach var="item" items="${feedbacks}">
                                    <div class="d-flex">
                                        <img src="img/avatar.jpg" class="img-fluid rounded-circle p-3"
                                             style="width: 100px; height: 100px;" alt="">
                                        <div class="">
                                            <p class="mb-2" style="font-size: 14px;">April 12, 2024</p>
                                            <div class="d-flex justify-content-between">
                                                <h5>${item.cusName}</h5>
                                                <div class="d-flex mb-3">
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                            <p class="text-dark">${item.content}</p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="tab-pane" id="nav-vision" role="tabpanel">
                                <p class="text-dark">Tempor erat elitr rebum at clita. Diam dolor diam ipsum et tempor
                                    sit. Aliqu diam
                                    amet diam et eos labore. 3</p>
                                <p class="mb-0">Diam dolor diam ipsum et tempor sit. Aliqu diam amet diam et eos labore.
                                    Clita erat ipsum et lorem et sit</p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-lg-4 col-xl-3">
                <div class="row g-4 fruite">
                    <div class="col-lg-12">
                        <div class="input-group w-100 mx-auto d-flex mb-4">
                            <input type="search" class="form-control p-3" placeholder="keywords"
                                   aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                        <div class="mb-4">
                            <h4>Categories</h4>
                            <ul class="list-unstyled fruite-categorie">
                                <c:forEach var="item" items="${categories}">
                                    <li>
                                        <div class="d-flex justify-content-between fruite-name">
                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>${item.cateName}</a>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <h4 class="mb-4">Discount products</h4>
                        <c:forEach var="item" items="${productSales}">
                            <div class="d-flex align-items-center justify-content-start">
                                <div class="rounded" style="width: 100px; height: 100px;">
                                    <img class="img-fluid me-5 rounded-circle" src="<c:url value="/resource/user/img/products/${item.productImg}"/>"
                                         class="img-fluid rounded" alt="Image">
                                </div>
                                <div>
                                    <h6 class="mb-2"><a
                                            href="${pageContext.request.contextPath}/shop-detail/${item.productId}">${item.productName}</a>
                                    </h6>
                                    <div class="d-flex mb-2">
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="d-flex mb-2">
                                        <h5 class="fw-bold me-2">${item.productPrice} $</h5>
                                        <h5 class="text-danger text-decoration-line-through">${item.sale} $</h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="d-flex justify-content-center my-4">
                            <a href="#" class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100">Vew
                                More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <h1 class="fw-bold mb-0">Related products</h1>
        <div class="vesitable">
            <div class="owl-carousel vegetable-carousel justify-content-center">
                <c:forEach var="items" items="${similarProducts}">
                    <div class="border border-primary rounded position-relative vesitable-item">
                        <div class="vesitable-img">
                            <img src="<c:url value="/resource/user/img/products/${items.productImg}"/>"
                                 class="img-fluid w-100 rounded-top" alt="">
                        </div>
                        <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                             style="top: 10px; right: 10px;">${items.cateName}</div>
                        <div class="p-4 pb-0 rounded-bottom">
                            <h4>
                                <a href="${pageContext.request.contextPath}/shop-detail/${items.productId}">${items.productName}</a>
                            </h4>
                            <p>${items.productDesc}</p>
                            <div class="d-flex justify-content-between flex-lg-wrap">
                                <p class="text-dark fs-5 fw-bold">${items.productPrice} / kg</p>
                                <a href="#"
                                   class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                        class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!-- Single Product End -->

<script>
    $(document).ready(function() {
        $("#addToCartLink").on("click", function(e) {
            e.preventDefault(); // Ngăn chặn hành động mặc định của thẻ a
            var productId = $(this).data("id");
            var quantity = $("#quantity-itemcart-" + productId).val();
            var url = "${pageContext.request.contextPath}/addCart/" + productId + "/" + quantity;
            window.location.href = url;
        });
    });

</script>

</body>