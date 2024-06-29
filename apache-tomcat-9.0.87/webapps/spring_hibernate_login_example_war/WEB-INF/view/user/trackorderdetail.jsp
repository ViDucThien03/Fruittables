<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/5/2024
  Time: 1:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <title>Chi tiết đơn hàng</title>

<body>
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


<section class="checkout spad">
    <div class="container">

        <div class="checkout__form">
            <h4>Chi tiết thanh toán</h4>
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h4>Đơn hàng của bạn</h4>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Giá</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="order" items="${orderdetail}">
                                    <tr>
                                        <td>${order.productName}</td>
                                        <td>${order.quantity}</td>
                                        <td>${order.totalPrice}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

        </div>
    </div>
</section>





</body>

