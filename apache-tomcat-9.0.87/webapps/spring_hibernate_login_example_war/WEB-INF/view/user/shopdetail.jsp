<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/1/2024
  Time: 4:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <title>Sản phẩm chi tiết</title>

<body>
<h1>${Cart.size()}</h1>
<section class="product-details spad">
    <c:set var="detail" value="${productdetail}"/>
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <img class="product__details__pic__item--large"
                             src="<c:url value="/resource/user/img/product/${detail.image}"/> " alt="">
                    </div>
                    <div class="product__details__pic__slider owl-carousel">
                        <img data-imgbigurl="img/product/details/product-details-2.jpg"
                             src="img/product/details/thumb-1.jpg" alt="">
                        <img data-imgbigurl="img/product/details/product-details-3.jpg"
                             src="img/product/details/thumb-2.jpg" alt="">
                        <img data-imgbigurl="img/product/details/product-details-5.jpg"
                             src="img/product/details/thumb-3.jpg" alt="">
                        <img data-imgbigurl="img/product/details/product-details-4.jpg"
                             src="img/product/details/thumb-4.jpg" alt="">
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">

                <div class="product__details__text">
                    <h3>${detail.productName}</h3>

                    <div class="product__details__price">$${detail.price}</div>
                    <p>${detail.title}</p>
                    <div class="product__details__quantity">
                        <div class="quantity">
                            <div class="pro-qty">
                                <input type="text" value="1">
                            </div>
                        </div>
                    </div>
                    <a href="<c:url value="/addcart/${detail.productid}"/> " class="primary-btn">THÊM VÀO GIỎ HÀNG</a>
                    <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                    <ul>
                        <li><b>Số lượng trong kho</b> <span style="color: red">Còn ${detail.quantity} sản phẩm</span></li>
                        <li><b>Khối lượng</b> <span>${detail.weight}</span></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                               aria-selected="false">Thông tin về sản phẩm</a>
                        </li>

                    </ul>

                    <div class="tab-pane" id="tabs-2" role="tabpanel">
                        <div class="product__details__tab__desc">


                            <p>${detail.description}</p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    </div>
</section>
<!-- Product Details Section End -->

<!-- Related Product Section Begin -->
<section class="related-product">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title related__product__title">
                    <h2>Sản phẩm liên quan</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <c:forEach var="relate" items="${relateproduct}">
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="<c:url value="/resource/user/img/product/${relate.image}"/> ">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">${relate.productName}</a></h6>
                        <h5>$${relate.price}</h5>
                    </div>
                </div>
            </div>
            </c:forEach>

        </div>
    </div>
</section>

</body>

