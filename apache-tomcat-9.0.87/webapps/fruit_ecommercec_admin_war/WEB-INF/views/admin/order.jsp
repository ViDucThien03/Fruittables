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
        <a href="addorder" class="btn btn-primary mb-2"><span>+</span> Add new order</a>
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Order Date</th>
                <th scope="col">Total Price</th>
                <th scope="col">Total Product</th>
                <th scope="col">Address</th>
                <th scope="col">Phone</th>
                <th scope="col">Email</th>

                <th scope="col">Delivery</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${listOrder}">
                <tr>
                    <th scope="row">${item.id}</th>
                    <td>${item.order.orderDate}</td>
                    <td>${item.order.totalPrice}</td>
                    <td>${item.order.cusId}</td>
                    <td>${item.order.productId}</td>
                    <td>${item.order.delivery}</td>
                    <td>${item.totalPiad}</td>
                    <td>
                        <form action="updateDeliveryStatus" method="post">
                            <input type="hidden" name="orderDetailId" value="${item.id}" />
                            <select class="form-select" aria-label="Default select example" name="deliveryStatus" onchange="this.form.submit()">
                                <option selected>${item.deliveryStatus}</option>
                                <c:if test="${item.deliveryStatus != 'Delivering'}">
                                    <option value="Delivering">Delivering</option>
                                </c:if>
                                <c:if test="${item.deliveryStatus != 'Preparing'}">
                                    <option value="Preparing">Preparing</option>
                                </c:if>
                                <c:if test="${item.deliveryStatus != 'Fulfilled'}">
                                    <option value="Fulfilled">Fulfilled</option>
                                </c:if>
                                <c:if test="${item.deliveryStatus != 'Rejected'}">
                                    <option value="Rejected">Rejected</option>
                                </c:if>
                            </select>
                        </form>
                    </td>
                    <td>
                        <a href="#" class="me-4"><i class="fa-solid fa-arrows-rotate"></i></a>
                        <a href="#"><i class="fa-solid fa-trash-can" style="width: 24px; height: 24px" onclick="deleteOrder('${item.id}')"></i></a>
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

