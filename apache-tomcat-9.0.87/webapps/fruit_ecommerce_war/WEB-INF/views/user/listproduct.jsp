<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/21/2024
  Time: 2:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>

<c:forEach var="product" items="${paginationProduct}">
    <div class="col-md-6 col-lg-4 col-xl-3">
        <div class="rounded position-relative fruite-item">
            <div class="fruite-img">
                <img src="<c:url value="/resource/user/img/products/${product.productImg}"/>"
                     class="img-fluid w-100 rounded-top"
                     alt="">
            </div>
            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                 style="top: 10px; left: 10px;">${product.cateName}
            </div>
            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                <h4>${product.productName}</h4>
                    <%--                                            <p>${product.shortDesc}</p>--%>
                <div class="d-flex justify-content-between flex-lg-wrap">
                    <p class="text-dark fs-5 fw-bold mb-0">${product.productPrice} / kg</p>
                    <a href="#"
                       class="btn border border-secondary rounded-pill px-3 text-primary"><i
                            class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                        cart</a>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

<div class="col-12 page-product">
    <div class="pagination d-flex justify-content-center mt-5">
        <a href="#" class="rounded">&laquo;</a>
        <c:forEach begin="1" end="${endPage}" var="i">
            <button class="active rounded px-3 border-warning border-1 me-2 bg-white" id="page-${i}">${i}</button>
        </c:forEach>

        <a href="#" class="rounded">&raquo;</a>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('.page-product button').click(function () {
            let index = $(this).attr('id').split('-')[1];
            let url = '/products/' + index + '.html';

            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}' + url,
                success: function (data) {
                    $('.list-product').html(data);
                },
                error: function (XMLHttpResponse, textStatus, errorThrown) {
                    XMLHttpResponse.toString();
                }
            });
        });
    })
</script>

</body>
