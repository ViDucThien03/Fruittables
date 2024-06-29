<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/3/2024
  Time: 1:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <title>Thanh toán</title>

<body>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="<c:url value="/resource/user/img/breadcrumb.jpg" />">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Checkout</h2>
                    <div class="breadcrumb__option">
                        <a href="<c:url value="home"/> ">Home</a>
                        <span>Checkout</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">

        <div class="checkout__form">
            <h4>Chi tiết thanh toán</h4>
            <form:form action="checkout" method="post" modelAttribute="checkout">
                <div class="row">
                    <div class="col-lg-8 col-md-6">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Họ<span>*</span></p>
                                    <form:input path="firstName" type="text"/>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Tên<span>*</span></p>
                                    <form:input path="lastName" type="text"/>
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input">
                            <p>Địa chỉ<span>*</span></p>
                            <form:input path="address" type="text"/>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Số điện thoại<span>*</span></p>
                                    <form:input path="phone" type="text"/>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Email<span>*</span></p>
                                    <form:input path="email" type="text"/>
                                </div>
                            </div>
                        </div>
<%--                        <div class="checkout__input">--%>
<%--                            <p>Nhập mật khẩu tài khoản<span>*</span></p>--%>
<%--                            <input type="text">--%>
<%--                        </div>--%>
                        <div class="checkout__input">
                            <p>Ghi chú khi giao hàng<span>*</span></p>
                            <form:input path="note" type="text"/>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h4>Đơn hàng của bạn</h4>
                            <div class="checkout__order__products">Sản phẩm <span>Tổng giá</span></div>
                            <ul>
                                <c:forEach var="item" items="${cart}">
                                <li>${item.value.product.productName} <span>$${item.value.totalPrice}</span></li>
                                </c:forEach>
                            </ul>
                            <div class="checkout__order__subtotal">Tổng phụ <span>$0.0</span></div>
                            <div class="checkout__order__total">Tổng <span>$${totalPrice}</span></div>


                            <p>Lưu ý: Cửa hàng chỉ chấp nhận hình thức thanh toán khi nhận hàng!</p>
                            <button type="submit" class="site-btn">Đặt hàng</button>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</section>
<!-- Checkout Section End -->
</body>

