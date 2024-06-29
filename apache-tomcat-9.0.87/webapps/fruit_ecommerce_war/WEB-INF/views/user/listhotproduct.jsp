<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ANPHATPC
  Date: 21/05/2024
  Time: 23:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<body>
<h4 class="mb-3">Featured products</h4>
<c:forEach var="hotProducts" items="${hotProducts}">
    <div class="d-flex align-items-center justify-content-start">
        <div class="rounded me-4" style="width: 100px; height: 100px;">
            <img src="<c:url value="/resource/user/products/img/${hotProducts.productImg}"/> " class="img-fluid rounded"
                 alt="">
        </div>
        <div>
            <h6 class="mb-2">${hotProducts.productName}</h6>
            <div class="d-flex mb-2">
                <i class="fa fa-star text-secondary"></i>
                <i class="fa fa-star text-secondary"></i>
                <i class="fa fa-star text-secondary"></i>
                <i class="fa fa-star text-secondary"></i>
                <i class="fa fa-star"></i>
            </div>
            <div class="d-flex mb-2">
                <h5 class="fw-bold me-2">${hotProducts.productPrice}</h5>
            </div>
        </div>
    </div>

</c:forEach>
<c:if test="${limit != count}">
<div class="d-flex justify-content-center my-4">
    <a href="#"
       class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100 hot-product"
       onclick="loadHotProduct('${limit}')">Vew More</a>
</div>
</c:if>
<script>
    function loadHotProduct(limit) {
        let currentLimit = parseInt(limit) + 3;
        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/hot-products/' + currentLimit + '.html',
            success: function (data) {
                $('.result-hot').html(data);
            },
            error: function (XMLHttpResponse, textStatus, errorThrown) {
                XMLHttpResponse.toString();
            }
        });
    }
</script>
</body>

