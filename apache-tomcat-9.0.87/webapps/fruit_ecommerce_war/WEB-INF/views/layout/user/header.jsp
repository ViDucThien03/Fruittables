<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/10/2024
  Time: 5:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Navbar start -->
<div class="container-fluid fixed-top">
    <div class="container topbar bg-primary d-none d-lg-block">
        <div class="d-flex justify-content-between">
            <div class="top-info ps-2">
                <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#"
                                                                                                 class="text-white">Bac Tu Liem, Ha Noi</a></small>
                <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#"
                                                                                          class="text-white">N16@gmail.com</a></small>
            </div>
            <div class="top-link pe-2">
                <a href="#" class="text-white"><small class="text-white mx-2">Privacy Policy</small>/</a>
                <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
                <a href="#" class="text-white"><small class="text-white ms-2">Sales and Refunds</small></a>
            </div>
        </div>
    </div>
    <div class="container px-0">
        <nav class="navbar navbar-light bg-white navbar-expand-xl">
            <a href="<c:url value="/"/>" class="navbar-brand">
                <h1 class="text-primary display-6">Fruitables</h1>
            </a>
            <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse">
                <span class="fa fa-bars text-primary"></span>
            </button>
            <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                <div class="navbar-nav mx-auto">
                    <a href="<c:url value="/"/>" class="nav-item nav-link active">Home</a>
                    <a href="${pageContext.request.contextPath}/shop/1" class="nav-item nav-link">Cửa hàng</a>
                    <a href="${pageContext.request.contextPath}/blog/1" class="nav-item nav-link">Bài vết</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Danh mục</a>
                        <div class="dropdown-menu m-0 bg-secondary rounded-0">
                            <c:forEach var="cate" items="${categories}">
                                <a href="${pageContext.request.contextPath}/productbycatepage/${cate.cateId}/1" class="dropdown-item">${cate.cateName}</a>
                            </c:forEach>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/newsale" class="nav-item nav-link"><b>New & Sale</b></a>
                    <a href="${pageContext.request.contextPath}/contact" class="nav-item nav-link">Liên hệ</a>

                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Tài Khoản</a>
                        <div class="dropdown-menu m-0 bg-secondary rounded-0">
                            <a href="javascript:void(0);" class="nav-item nav-link" onclick="redirectToPage('${pageContext.request.contextPath}/trackorder', ${empty loginInfo})">Đơn Hàng</a>
                            <a href="javascript:void(0);" class="nav-item nav-link" onclick="redirectToPage('${pageContext.request.contextPath}/setup_user', ${empty loginInfo})">Thông tin</a>
                        </div>
                    </div>

                </div>
                <div class="d-flex m-3 me-0 ">

<%--                    <form action="${pageContext.request.contextPath}/search" method="GET" class="pt-3">--%>
<%--                        <div class="position-relative me-3">--%>
<%--                            <input id="searchInput"--%>
<%--                                   class="form-control border-2 border-secondary w-90 py-2 px-3 rounded-pill"--%>
<%--                                   type="text" placeholder="Search" name="freeText"/>--%>
<%--                            <button id="searchButton" type="submit"--%>
<%--                                    class="btn btn-primary py-2 px-3 position-absolute rounded-pill text-white h-100 fas fa-search"--%>
<%--                                    style="top: 0; right: 0;">--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                    </form>  FORM SEARCH --%>

                    <div>
                        <form class="position-relative me-3" id="searchForm" action="${pageContext.request.contextPath}/search/${freeText}" method="GET">
                            <input name="freeText" id="searchInput" class="form-control border-2 border-secondary w-90 py-2 px-3 rounded-pill" type="text" placeholder="Tìm kiếm">
                            <button type="submit" class="btn btn-primary py-2 px-3 position-absolute rounded-pill text-white h-100 fas fa-search" style="top: 0; right: 0;"></button>
                        </form>
                    </div>
<%--                    <a href="${pageContext.request.contextPath}/cart" class="position-relative me-4 my-auto">--%>

                    <a href="${pageContext.request.contextPath}/cart" class="position-relative me-4 my-auto">
                        <i class="fa fa-shopping-bag fa-2x"></i>
                            <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                    style="top: -5px; left: 15px; height: 20px; min-width: 20px;">${cart.size()}</span>
                    </a>
                        <c:if test="${empty loginInfo}">
                        <a href="${pageContext.request.contextPath}/login" class="my-auto">
                            <i class="fas fa-user fa-2x"></i>
                        </a>
                        </c:if>
                        <c:if test="${not empty loginInfo}">
                        <a href="#" class="my-auto" onclick="logout()">
                            <i class="fa-solid fa-right-from-bracket fa-2x"></i>
                        </a>
                        </c:if>
                </div>
            </div>
        </nav>
    </div>
</div>
<!-- Navbar End -->

<!-- Modal Search Start -->
<div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content rounded-0">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-75 mx-auto d-flex">
                    <input type="search" class="form-control p-3" placeholder="keywords"
                           aria-describedby="search-icon-1">
                    <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Search End -->

<script>
    function redirectToPage(targetUrl, isNotLoggedIn) {
        if (!isNotLoggedIn) {
            window.location.href = targetUrl;
        } else {
            alert('You need to login to continue');
            window.location.href = '${pageContext.request.contextPath}/login?redirect=' + encodeURIComponent(targetUrl);
        }
    }

    function logout() {
        let ans = confirm("Do you want to logout?");
        if (ans) {
            window.location = "${pageContext.request.contextPath}/logout";
        }
    }

    document.getElementById("searchForm").addEventListener("submit", function(event) {
        event.preventDefault(); // Prevent default action from web
        const searchText = document.getElementById("searchInput").value;// var
        window.location.href = "${pageContext.request.contextPath}/search/" + searchText;
    });
</script>

