<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/28/2023
  Time: 10:43 PM
  To change this template use File | Settings | File Templates.
--%>


<!-- Header Section Begin -->
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/28/2023
  Time: 10:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i>vithienym19@gmail.com</li>
                            <li>Free Shipping for all Order of $99</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-pinterest-p"></i></a>
                        </div>

                        <div class="header__top__right__auth">
                            <c:if test="${not empty loginInfo}">
                                <div class="header__top__right__language">
                                    <div>${loginInfo.userName}</div>
                                    <span class="arrow_carrot-down"></span>
                                    <ul>
                                        <li><a href="<c:url value="/trackorder/${loginInfo.id}"/> ">Đơn hàng của tôi</a></li>
                                        <li><a href="<c:url value="logout"/> ">Đăng xuất</a></li>
                                    </ul>
                                </div>
                            </c:if>
                            <c:if test="${empty loginInfo}">
                            <a href="<c:url value="login"/> "><i class="fa fa-user"></i>Đăng nhập</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="./index.html"><img src="<c:url value="/resource/user/img/logo.png"/> " alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li class="active"><a href="<c:url value="/home"/>">Trang chủ</a></li>
                        <li><a href="<c:url value="/shop-gird"/> ">Cửa hàng</a></li>
                        <li><a href="#">Trang</a>
                            <ul class="header__menu__dropdown">
                                <li><a href="">Chi tiết cửa hàng</a></li>
                                <li><a href="./shoping-cart.html">Giỏ hàng</a></li>
                                <li><a href="./checkout.html">Thanh toán</a></li>
                                <li><a href="./blog-details.html">Chi tiết bài viết</a></li>
                            </ul>
                        </li>
                        <li><a href="<c:url value="/blog"/> ">Bài viết</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                        <li><a href="<c:url value="/cartdetail"/> "><i class="fa fa-shopping-bag"></i> <span>${cart.size()}</span></a></li>
<%--                        <li><a href="<c:url value="login"/> "><i class="fa fa-user"></i></a></li>--%>
                    </ul>
                    <div class="header__cart__price">item: <span>$${totalPrice}</span></div>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<!-- Header Section End -->

<!-- Hero Section Begin -->
<section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>Danh sách sản phẩm</span>
                    </div>
                    <ul>
                        <c:forEach var="cate" items="${category}">
                            <li><a href="<c:url value="/product-category/${cate.id}"/> ">${cate.categoryName}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="#">
                            <div class="hero__search__categories">
                                All Categories
                                <span class="arrow_carrot-down"></span>
                            </div>
                            <input type="text" placeholder="What do yo u need?">
                            <button type="submit" class="site-btn">SEARCH</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>+84 367795730</h5>
                            <span>Hỗ trợ 24/7</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->

<!-- Breadcrumb Section End -->



