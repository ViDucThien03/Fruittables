<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/3/2024
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login V1</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" href="<c:url value="/resource/user/css/bootstrap.min.css"/>"  type="text/css">
    <!--===============================================================================================-->
    <link rel="stylesheet" href="<c:url value="/resource/user/css/font-awesome.min.css"/>" type="text/css">
    <!--===============================================================================================-->

    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/user/css/util.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/user/css/main.css"/>">
    <!--===============================================================================================-->
</head>
<body>
<decorator:body/>
<script src="<c:url value="/resource/user/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/resource/user/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resource/user/js/main.js"/>"></script>
</body>
</html>
