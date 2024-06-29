<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>Product</title>
<head>
<%--    <style>--%>
<%--        .exprire-green {--%>
<%--            color: green;--%>
<%--        }--%>
<%--        .exprire-yellow {--%>
<%--            color: yellow;--%>
<%--        }--%>
<%--        .exprire-red {--%>
<%--            color: red;--%>
<%--        }--%>
<%--    </style>--%>
</head>
<body>
<div class="col-sm-12 col-xl-12">
    <div class="bg-light rounded h-100 p-4">
        <h6 class="mb-4">Product</h6>
        <div class="d-flex justify-content-between">
            <a href="addproduct" class="btn btn-primary mb-2"><span>+</span> Add new product</a>
            <div>
                <a class="btn btn-primary" href="bestSeller">Sản phẩm bán chạy</a>
                <a class="btn btn-primary" href="poorlySeller">Sản phẩm bán ế</a>
            </div>
        </div>

        <p class="text-danger">${msg}</p>

        <table class="table table-hover">

            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Ảnh</th>
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
            <c:forEach var="product" items="${paginationProduct}">
                <tr>
                    <th scope="row">${product.productId}</th>
                    <td><img src="${pageContext.request.contextPath}/product/image/${product.productImg}" width="100" height="100"/></td>
                    <td>${product.productName}</td>
                    <td>${product.productPrice}</td>
                    <td>${product.sell_quantity}</td>
                    <td>${product.quantity}</td>
                    <td class="d-none">${product.createDate}</td>
                    <td class="fw-bold">${product.expDate}</td>
                    <td>
                        <form action="updateSale" method="post">
                        <input type="hidden" name="productId" value="${product.productId}">
                        <select class="form-select" aria-label="Default select example" name="sale" onchange="this.form.submit()">
                            <option selected>${product.sale}%</option>
                            <option value="25">25%</option>
                            <option value="50">50%</option>
                            <option value="75">75%</option>
                        </select>
                        </form>
                    </td>
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
    function deleteProduct(id) {
        let ans = confirm("Bạn có đồng ý xóa sản phẩm này?");
        if(ans){
            window.location = "delete/"+id;
        }
    }
    document.addEventListener("DOMContentLoaded", function () {

        let rows = document.querySelectorAll("tbody tr");
        rows.forEach(function (row) {
            let createDateStr = row.querySelector("td:nth-child(7)").textContent.trim();
            let expDateStr = row.querySelector("td:nth-child(8)").textContent.trim();

            let createDate = new Date(createDateStr);
            let expDate = new Date(expDateStr);
            console.log("createDate: ",createDate);
            console.log("expDateStr: ",expDate);
            let diffTime = expDate.getTime() - createDate.getTime();
            let diffDays = Math.ceil(diffTime/(1000*60*60*24))
            if(diffDays > 3){
                row.querySelector("td:nth-child(8)").classList.add("text-success")
            }
            else if(diffDays <= 3 && diffDays > 0){
                row.querySelector("td:nth-child(8)").classList.add("text-warning")
            } else {
                row.querySelector("td:nth-child(8)").classList.add("text-danger")
            }

        })
    })
</script>

</body>

