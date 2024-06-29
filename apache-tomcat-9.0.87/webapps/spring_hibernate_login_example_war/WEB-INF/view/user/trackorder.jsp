<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/4/2024
  Time: 5:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <title>Theo dõi đơn hàng</title>

<body>
<div class="container">
    <div><h2>Thông tin đơn hàng</h2></div>
    <div>
        <p></p>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th>Khách hàng</th>
            <th>Địa chỉ</th>
            <th>Số điện thoại</th>
            <th>Email</th>
            <th>Tổng giá</th>
            <th>Xem chi tiết đơn hàng</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${trackorder}">
        <tr>
            <td>${order.firstName}${order.lastName}</td>
            <td>${order.address}</td>
            <td>${order.phone}</td>
            <td>${order.email}</td>
            <td>${order.total}</td>
            <td><a href="<c:url value="/trackorderdetail/${order.checkoutid}"/> ">Xem chi tiết đơn hàng</a></td>
            <td>Đang chờ giao hàng</td>
        </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
</body>

