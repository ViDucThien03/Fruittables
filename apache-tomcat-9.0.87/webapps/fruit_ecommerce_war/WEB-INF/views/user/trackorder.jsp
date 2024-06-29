<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<body>
<div class="container" style="margin-top: 100px">
    <div><h2>Thông tin đơn hàng</h2></div>
    <table class="table">
        <thead>
        <tr>
            <th>Full Name</th>
            <th>Address</th>
            <th>Phone Number</th>
            <th>Time</th>
            <th>Total Price</th>
            <th>Status</th>
            <th>Actions</th>
            <th>Cancel</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${trackorder}">
            <tr>
                <td style="height: 90px; vertical-align: middle">${order.fullName}</td>
                <td style="height: 90px; vertical-align: middle">${order.address}</td>
                <td style="height: 90px; vertical-align: middle">${order.phone}</td>
                <td style="height: 90px; vertical-align: middle">${order.createDay}</td>
                <td style="height: 90px; vertical-align: middle">${order.total}</td>
                <td style="height: 90px; vertical-align: middle">${order.status}</td>
                <td style="height: 90px; vertical-align: middle">
                    <c:if test="${order.status != 'Rejected'}">
                        <a href="<c:url value="/trackorderdetail/${order.checkoutid}"/>">View order details</a>
                    </c:if>
                </td>
                <td style="height: 90px; vertical-align: middle">
                    <c:if test="${order.status == 'Prepairing'}">
                        <form action="<c:url value='/cancelorder'/>" method="post" onsubmit="event.preventDefault(); confirmCancelOrder(this);">
                            <input type="hidden" name="checkoutid" value="${order.checkoutid}"/>
                            <button type="submit" class="btn btn-danger">Hủy đơn hàng</button>
                        </form>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script type="text/javascript">
    function confirmCancelOrder(form) {
        if (confirm("Bạn có chắc chắn muốn hủy đơn hàng này không?")) {
            form.submit();
        }
    }
</script>

</body>
</html>
