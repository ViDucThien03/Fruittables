<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Đăng nhập</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="<c:url value="/resource/admin/img/favicon.ico"/>" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="<c:url value="/resource/admin/lib/owlcarousel/assets/owl.carousel.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resource/admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"/>" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <%--    <link href="<c:url value="/resource/admin/css/bootstrap.min.css"/>" rel="stylesheet">--%>
    <link href="<c:url value="/resource/admin/css/bootstrap.min.css"/>" rel="stylesheet"/>
    <!-- Template Stylesheet -->
    <link href="<c:url value="/resource/admin/css/style.css"/>" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</head>

<body>
<div class="container-xxl position-relative bg-white d-flex p-0">
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->
    <decorator:body/>
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/resource/admin/lib/chart/chart.min.js"/>"></script>
<script src="<c:url value="/resource/admin/lib/easing/easing.min.js"/>" ></script>
<script src="<c:url value="/resource/admin/lib/waypoints/waypoints.min.js"/>" ></script>
<script src="<c:url value="/resource/admin/lib/owlcarousel/owl.carousel.min.js"/>" ></script>
<script src="<c:url value="/resource/admin/lib/tempusdominus/js/moment.min.js"/>" ></script>
<script src="<c:url value="/resource/admin/lib/tempusdominus/js/moment-timezone.min.js"/>" ></script>
<script src="<c:url value="/resource/admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"/>" ></script>

<!-- Template Javascript -->
<script src="<c:url value="/resource/admin/js/main.js"/>" ></script>
</body>
</html>