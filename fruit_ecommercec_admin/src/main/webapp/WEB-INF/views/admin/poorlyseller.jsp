<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>Product</title>
<body>
<div class="col-sm-12 col-xl-12">
    <div class="bg-light rounded h-100 p-4">
        <h3 class="mb-4">Top 10 sảm phẩm bán ế</h3>
        <p class="text-danger">${msg}</p>
        <table class="table table-hover">

            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Tên sản phẩm</th>
                <th scope="col">Giá</th>
                <th scope="col">Số lượng bán</th>
                <th scope="col">Số lượng còn</th>
                <th scope="col" class="d-none">Ngày thêm</th>
                <th scope="col">Ngày hết hạn</th>
                <th scope="col">Giảm giá</th>
                <th scope="col">Danh mục sản phẩm</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${list}">
                <tr>
                    <th scope="row">${product.productId}</th>
                    <td>${product.productName}</td>
                    <td>${product.productPrice}</td>
                    <td>${product.sell_quantity}</td>
                    <td>${product.quantity}</td>
                    <td class="d-none">${product.createDate}</td>
                    <td class="fw-bold">${product.expDate}</td>
                    <td>${product.sale}</td>
                    <td>${product.cateName}</td>
                    <td>
                        <a href="updateProduct?productId=${product.productId}" class="me-4"><i class="fa-solid fa-arrows-rotate"></i></a>
                        <a href="#"><i class="fa-solid fa-trash-can" style="width: 24px; height: 24px" onclick="deleteProduct('${product.productId}')"></i></a>
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
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/product/${i}">${i}</a></li>
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

    function deleteProduct(id) {
        let ans = confirm("Bạn có đồng ý xóa sản phẩm này?");
        if(ans){
            window.location = "delete/"+id;
        }
    }
    document.addEventListener("DOMContentLoaded", function () {

        let rows = document.querySelectorAll("tbody tr");
        rows.forEach(function (row) {
            let createDateStr = row.querySelector("td:nth-child(6)").textContent.trim();
            let expDateStr = row.querySelector("td:nth-child(7)").textContent.trim();

            let createDate = new Date(createDateStr);
            let expDate = new Date(expDateStr);
            console.log("createDate: ",createDate);
            console.log("expDateStr: ",expDate);
            let diffTime = expDate.getTime() - createDate.getTime();
            let diffDays = Math.ceil(diffTime/(1000*60*60*24))
            if(diffDays > 3){
                row.querySelector("td:nth-child(7)").classList.add("text-success")
            }
            else if(diffDays <= 3 && diffDays > 0){
                row.querySelector("td:nth-child(7)").classList.add("text-warning")
            } else {
                row.querySelector("td:nth-child(7)").classList.add("text-danger")
            }

        })
    })
</script>

</body>

