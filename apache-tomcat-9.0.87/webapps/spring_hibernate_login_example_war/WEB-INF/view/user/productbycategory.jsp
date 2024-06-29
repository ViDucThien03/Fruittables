<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/31/2023
  Time: 11:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>Danh mục - </title>

<body>
<section class="breadcrumb-section set-bg" data-setbg="<c:url value="/resource/user/img/breadcrumb.jpg"/> ">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>OGANI SHOP</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">Trang chủ</a>
                        <span>Cửa hàng</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="section-title from-blog__title">
    <h2>Các sản phẩm trong danh mục</h2>
</div>
<div class="row">
        <c:forEach var="bycate" items="${probycate}">
        <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="product__item">
                <div class="product__item__pic set-bg" data-setbg="<c:url value='/resource/user/img/product/${bycate.image}'/>">
                    <ul class="product__item__pic__hover">
                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                    </ul>
                </div>
                <div class="product__item__text">
                    <h6><a href="<c:url value="/shop-detail/${bycate.productid}"/>">${bycate.productName}</a></h6>
                    <h5>$${bycate.price}</h5>
                </div>
            </div>
        </div>
        </c:forEach>
</div>
<div class="product__pagination">
    <a href="#">1</a>
    <a href="#">2</a>
    <a href="#">3</a>
    <a href="#"><i class="fa fa-long-arrow-right"></i></a>
</div>
</body>
