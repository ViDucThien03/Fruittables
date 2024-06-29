<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%--
  Created by IntelliJ IDEA.
  User: ANPHATPC
  Date: 24/05/2024
  Time: 16:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<html>
<head>
    <meta charset="utf-8">
    <title>DASHMIN - Bootstrap Admin Template</title>
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
</head>
<body>
<div class="container-xxl position-relative bg-white d-flex p-0">
    <%@include file="/WEB-INF/views/layout/admin/sidebar.jsp"%>
    <div class="content">
        <%@include file="/WEB-INF/views/layout/admin/header.jsp"%>
        <decorator:body/>
        <%@include file="/WEB-INF/views/layout/admin/footer.jsp"%>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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
