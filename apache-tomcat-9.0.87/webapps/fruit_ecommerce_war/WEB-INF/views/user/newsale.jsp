<%--
  Created by IntelliJ IDEA.
  User: FPT
  Date: 4/16/2024
  Time: 11:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>

<div class="container-fluid py-5 mt-5">
    <div class="container py-5">
        <div class="row g-4 mb-5">
            <h1 class="fw-bold mb-0">Sản phẩm Bán chạy</h1>
            <div class="vesitable">
                <div class="owl-carousel vegetable-carousel justify-content-center">

                    <c:forEach var="item" items="${sellingProduct}">
                        <div class="border border-primary rounded position-relative vesitable-item">
                            <div class="vesitable-img">
                                <img src="<c:url value="/resource/user/img/products/${item.productImg}"/>" class="img-fluid w-100 rounded-top" alt="">
                            </div>
                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">${item.cateName}</div>
                            <div class="p-4 pb-0 rounded-bottom">
                                <h4>${item.productName}</h4>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                <div class="d-flex justify-content-between flex-lg-wrap">
                                    <p class="text-dark fs-5 fw-bold">${item.productPrice} VND/KG</p>
                                    <a href="${pageContext.request.contextPath}/addCart/${item.productId}/1" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
            <h1 class="fw-bold mb-0">Sản phẩm khuyến mãi</h1>
            <div class="vesitable">
                <div class="owl-carousel vegetable-carousel justify-content-center">

                    <c:forEach var="item" items="${discountProduct}">
                        <div class="border border-primary rounded position-relative vesitable-item">
                            <div class="vesitable-img">
                                <img src="<c:url value="/resource/user/img/products/${item.productImg}"/>" class="img-fluid w-100 rounded-top bg-light" alt="">
                            </div>
                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">${item.cateName}</div>
                            <div class="p-4 pb-0 rounded-bottom">
                                <h4>${item.productName}</h4>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                <div class="d-flex justify-content-between flex-lg-wrap">
                                    <div class="w-100">
                                        <p class="text-danger text-decoration-line-through fs-5 fw-bold ml-2">${item.productPrice} VND/KG</p>
                                        <p class="text-dark fs-5 fw-bold ml-2">${item.productPrice - (item.productPrice * item.sale / 100)} VND/KG</p>
                                    </div>
                                </div>
                                <div class="w-100"><a href="${pageContext.request.contextPath}/addCart/${item.productId}/1" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a></div>
                                <!-- CHUYEN RA GIUA -->
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
