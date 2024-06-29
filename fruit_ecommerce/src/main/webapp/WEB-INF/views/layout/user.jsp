<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/10/2024
  Time: 5:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<html>
<head>
    <c:choose>
        <c:when test="${empty requestScope.ajaxRequest || !requestScope.ajaxRequest}">
            <meta charset="utf-8">
            <title><decorator:title default="Master-layout"/></title>
            <meta content="width=device-width, initial-scale=1.0" name="viewport">
            <meta content="" name="keywords">
            <meta content="" name="description">

            <!-- Google Web Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                  rel="stylesheet">

            <!-- Icon Font Stylesheet -->
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
                  integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
                  crossorigin="anonymous" referrerpolicy="no-referrer"/>
            <!-- Libraries Stylesheet -->
            <link href="<c:url value="/resource/user/lib/lightbox/css/lightbox.min.css"/>" rel="stylesheet">
            <link href="<c:url value="/resource/user/lib/owlcarousel/assets/owl.carousel.min.css"/>" rel="stylesheet">

            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
                    integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
                    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
            <!-- Customized Bootstrap Stylesheet -->
            <link href="<c:url value="/resource/user/css/bootstrap.min.css"/>" rel="stylesheet">

            <!-- Template Stylesheet -->
            <link href="<c:url value="/resource/user/css/style.css"/>" rel="stylesheet">
        </c:when>
    </c:choose>
</head>
<body>
<c:choose>
    <c:when test="${empty requestScope.ajaxRequest || !requestScope.ajaxRequest}">
        <%@include file="/WEB-INF/views/layout/user/header.jsp" %>
    </c:when>
</c:choose>
<decorator:body/>
<c:choose>
    <c:when test="${empty requestScope.ajaxRequest || !requestScope.ajaxRequest}">
        <%@include file="/WEB-INF/views/layout/user/footer.jsp" %>
    </c:when>
</c:choose>
<c:choose>
    <c:when test="${empty requestScope.ajaxRequest || !requestScope.ajaxRequest}">
        <!-- JavaScript Libraries -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="<c:url value="/resource/user/lib/easing/easing.min.js"/>"></script>
        <script src="<c:url value="/resource/user/lib/waypoints/waypoints.min.js"/>"></script>
        <script src="<c:url value="/resource/user/lib/lightbox/js/lightbox.min.js"/>"></script>
        <script src="<c:url value="/resource/user/lib/owlcarousel/owl.carousel.min.js"/>"></script>

        <!-- Template Javascript -->
        <script src="<c:url value="/resource/user/js/main.js"/>"></script>
        <decorator:getProperty property="page.script"/>
    </c:when>
</c:choose>

</body>
</html>
