<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Xác thực người dùng</title>
</head>
<body style="background-color: #ebecf0;">
<div class="container p-5">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-5 mt-5">
            <div class="bg-white p-5 rounded-3 shadow-sm border">
                <div>
                    <p class="text-center text-success" style="font-size: 5.5rem;"><i class="fa-solid fa-envelope-circle-check"></i></p>
                    <p class="text-center text-center h5 ">Please check your email</p>
                    <p class="text-muted text-center">We've sent a code to contact@curfcode.com</p>
                    <form action="${pageContext.request.contextPath}/verifyAccount" method="post">
                        <div class="row pt-4 pb-2">
                            <input type="text" class="border-1 p-2 rounded-3" id="guessedNumber" name="guessedNumber" required/>
                        </div>

                            <p class="text-danger mt-2">${requestScope.message}</p>

                        <p class="text-muted text-center">Didn't get the code? <a href="#" class="text-success">Click to resend.</a></p>
                        <div class="row pt-5">
                            <div class="col-6">
                                <button class="btn btn-outline-secondary w-100" style="height: 50px;">Cancel</button>
                            </div>
                            <div class="col-6">
                                <button type="submit" class="btn btn-success w-100" style="height: 50px;">Verify</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
