<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: vithi
  Date: 6/23/2024
  Time: 12:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <title>Chi tiết đơn hàng</title>

<body>
<div class="receipt bg-light vh-100">
    <div class="text-center">
        <h3>Fruittables</h3>
    </div>
    <div class="w-100 d-flex justify-content-center gap-4">
        <div>
            <p>Ngày: ${orders.createDay}</p>
            <p>Khách hàng: ${order.userid}</p>
        </div>
        <div>
            <p>Số: ${orders.orderId}</p>
            <p>Phương thức thanh toán: ${orders.paymentMethod}</p>
        </div>
    </div>
    <div class="text-center"><span>Địa chỉ: ${orders.address}</span></div>
    <div class="text-center"><span>Số điện thoại: ${orders.phone}</span></div>
    <div class="text-center"><span>Ghi chú: ${orders.desc_order}</span></div>
    <div class="d-flex justify-content-center">
        <table class="table w-50">
            <thead>
            <tr>
                <th>Sản phẩm</th>
                <th>Số lượng</th>
                <th>Giá</th>
                <th>Thành tiền</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${listProductOrder}">
            <tr>
                <td>${item.productName}</td>
                <td>${item.quantityProduct}</td>
                <td>${item.productPrice}</td>
                <td>${item.totalPiad}</td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="total d-flex justify-content-end w-75">
        <span class="fs-3 font-weight-bold ">Tổng đơn hàng: ${orders.total} VND</span>
    </div>
    <div class="footer">
    </div>
</div>
</body>

