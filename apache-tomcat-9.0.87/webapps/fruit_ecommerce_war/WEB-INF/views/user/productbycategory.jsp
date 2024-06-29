<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/19/2024
  Time: 12:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
<c:forEach var="probycate" items="${probycate}">
    <div class="col-md-6 col-lg-4 col-xl-3">
        <div class="rounded position-relative fruite-item">
            <div class="fruite-img">
                <img src="<c:url value="/resource/user/img/products/${probycate.productImg}"/>"
                     class="img-fluid w-100 rounded-top"
                     alt="">
            </div>
            <div class="id-${probycate.cateId}"></div>
            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                 style="top: 10px; left: 10px;">${probycate.cateName}</div>
            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                <h4>${probycate.productName}</h4>
                    <%--                                            <p>${probycate.shortDesc}</p>--%>
                <div class="d-flex justify-content-between flex-lg-wrap">
                    <p class="text-dark fs-5 fw-bold mb-0">${probycate.productPrice} / kg</p>
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
                <c:forEach begin="1" end="${endPagebyCate}" var="i">
                    <button class="active rounded px-3 border-warning border-1 me-2 bg-white" id="page-${i}">${i}</button>
                </c:forEach>
        <a href="#" class="rounded">&raquo;</a>
    </div>
</div>
<script>
    $(document).ready(function () {
        let cateId;
        $('[class^="id-"]').each(function () {
            // Lấy ra class của phần tử hiện tại
            let classes = $(this).attr('class').split(' ');
            // Tìm và lấy ra cateId từ danh sách class
            for (let i = 0; i < classes.length; i++) {
                if (classes[i].startsWith('id-')) {
                    // Lấy ra cateId từ class
                    cateId = classes[i].split('-')[1];
                    // In ra cateId để kiểm tra
                    console.log('cateId:', cateId);
                    // Đoạn mã xử lý tiếp theo ở đây
                }
            }
        });
        $('.page-product button').click(function () {
            let index = $(this).attr('id').split('-')[1];
            updateProducts(cateId, index);
        });
        function updateProducts(cateId, index) {
            let url = '/productbycate/' + cateId + '/' + index + '.html';
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}' + url,
                success: function (data) {
                    $('.result-ajax').html(data);
                },
                error: function (XMLHttpResponse, textStatus, errorThrown) {
                    XMLHttpResponse.toString();
                },
            });
        }
    });
</script>
</body>

