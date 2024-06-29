<%--
  Created by IntelliJ IDEA.
  User: ANPHATPC
  Date: 24/05/2024
  Time: 16:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Sidebar Start -->
<div class="sidebar pe-4 pb-3">
    <nav class="navbar bg-light navbar-light">
        <a href="index.html" class="navbar-brand mx-4 mb-3">
            <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>Fruittables</h3>
        </a>
        <div class="d-flex align-items-center ms-4 mb-4">
            <div class="position-relative">
                <img class="rounded-circle" src="<c:url value="/resource/admin/img/user.jpg"/>" alt=""
                     style="width: 40px; height: 40px;">
                <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
            </div>
            <div class="ms-3">
                <h6 class="mb-0">${loginInfor.username}</h6>
                <span>Admin</span>
            </div>
        </div>
        <div class="navbar-nav w-100">
            <a href="${pageContext.request.contextPath}/" class="nav-item nav-link active"><i class="fa-solid fa-chart-simple me-2"></i>Thống kê</a>
            <a href="${pageContext.request.contextPath}/order/1" class="nav-item nav-link"><i class="fa-solid fa-cart-shopping me-2"></i>Đơn hàng</a>
            <a href="${pageContext.request.contextPath}/product/1" class="nav-item nav-link"><i class="fa-brands fa-product-hunt me-2"></i>Sản phẩm</a>
            <a href="${pageContext.request.contextPath}/category/1" class="nav-item nav-link"><i
                    class="fa fa-keyboard me-2"></i>Danh mục SP</a>
            <a href="${pageContext.request.contextPath}/blogdetails/1" class="nav-item nav-link"><i class="fa-solid fa-paper-plane me-2"></i>Bài viết</a>
            <a href="${pageContext.request.contextPath}/user/1" class="nav-item nav-link"><i class="fa-solid fa-user me-2"></i>Người dùng</a>
            <a href="${pageContext.request.contextPath}/feedback/1" class="nav-item nav-link"><i class="fa-solid fa-comment me-2"></i>Đánh giá</a>
            <a href="${pageContext.request.contextPath}/supplier/1" class="nav-item nav-link"><i class="fa-solid fa-truck-field-un"></i>Nhà cung cấp</a>
            <%--            <a href="${pageContext.request.contextPath}/user/1" class="nav-item nav-link"><i class="fa fa-th me-2"></i>User</a>--%>
        </div>
    </nav>
</div>
<!-- Sidebar End -->
