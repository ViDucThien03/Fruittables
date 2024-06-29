<%--
  Created by IntelliJ IDEA.
  User: vithi
  Date: 6/17/2024
  Time: 10:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Order</title>

<body>
<div class="col-sm-12 col-xl-12">
    <div class="bg-light rounded h-100 p-4">
        <h6 class="mb-4">Orders</h6>

        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Ngày đặt</th>
                <th scope="col">Tổng giá</th>
                <th scope="col">Số lượng sản phẩm</th>
                <th scope="col">Trạng thái</th>
                <th scope="col">Phương thức thanh toán</th>
                <th scope="col">Trạng thái thanh toán</th>
                <th scope="col">Mã người dùng</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${listOrder}">
                <tr>
                    <th scope="row">${item.orderId}</th>
                    <td>${item.createDay}</td>
                    <td>${item.total}</td>
                    <td>${item.quantity}</td>
                    <td>
                        <form action="updateDeliveryStatus" method="post">
                            <input type="hidden" name="orderId" value="${item.orderId}" />
                            <select class="form-select" aria-label="Default select example" name="status" onchange="this.form.submit()">
                                <option selected>${item.status}</option>
                                <c:if test="${item.status != 'Delivering'}">
                                    <option value="Delivering">Delivering</option>
                                </c:if>
                                <c:if test="${item.status != 'Preparing'}">
                                    <option value="Preparing">Preparing</option>
                                </c:if>
                                <c:if test="${item.status != 'Fulfilled'}">
                                    <option value="Fulfilled">Fulfilled</option>
                                </c:if>
                                <c:if test="${item.status != 'Rejected'}">
                                    <option value="Rejected">Rejected</option>
                                </c:if>
                            </select>
                        </form>
                    </td>
                    <td>${item.paymentMethod}</td>
                    <td>${item.statusPayment}</td>
                    <td>${item.userid}</td>

                    <td>
                        <a href="orderDetail?orderId=${item.orderId}" class="me-4">Chi tiết đơn hàng</a>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="d-flex justify-content-center">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${endPage}" var="i">
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/order/${i}">${i}</a></li>
                    </c:forEach>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script>
    function deleteFeedback(id) {
        let ans = confirm("Bạn có đồng ý xóa đánh giá này?");
        if(ans){
            window.location = "delete/"+id;
        }
    }
</script>
</body>

