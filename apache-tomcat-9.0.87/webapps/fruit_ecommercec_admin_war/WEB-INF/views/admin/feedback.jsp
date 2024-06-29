<%--
  Created by IntelliJ IDEA.
  User: vithi
  Date: 6/17/2024
  Time: 12:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <title>Feedback</title>

<body>
<div class="col-sm-12 col-xl-12">
    <div class="bg-light rounded h-100 p-4">
        <h6 class="mb-4">Feedback</h6>
        <a href="add" class="btn btn-primary mb-2"><span>+</span> Add new feedback</a>
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Content</th>
                <th scope="col">Rate</th>
                <th scope="col">Product ID</th>
                <th scope="col">Customer ID</th>

                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${listFeedback}">
                <tr>
                    <th scope="row">${item.id}</th>
                    <td>${item.content}</td>
                    <td>${item.rate}</td>
                    <td>${item.product_id}</td>
                    <td>${item.customer_id}</td>

                    <td>
                        <a href="#" class="me-4"><i class="fa-solid fa-arrows-rotate"></i></a>
                        <a href="#"><i class="fa-solid fa-trash-can" style="width: 24px; height: 24px" onclick="deleteFeedback('${item.id}')"></i></a>
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
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/user/${i}">${i}</a></li>
                    </c:forEach>
                    <%--                <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
                    <%--                <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
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

