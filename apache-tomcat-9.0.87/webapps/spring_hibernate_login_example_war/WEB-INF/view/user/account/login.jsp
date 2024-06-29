<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/3/2024
  Time: 10:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    <title>Đăng nhập</title>

<body>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <div class="login100-pic js-tilt" data-tilt>
                <img src="<c:url value="/resource/user/img/login.png" />" alt="IMG">
            </div>
            <div>
                <p>${statuslogin}</p>
            </div>
                <form:form action="login" method="post" modelAttribute="user">
					<span class="login100-form-title">
						Đăng nhập
					</span>

                <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">

                    <form:input type="text" class="input100" path="userName" placeholder="Tài khoản"/>
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
                </div>

                <div class="wrap-input100 validate-input" data-validate = "Password is required">
                    <form:input type="password" class="input100" path="password" placeholder="Mật khẩu"/>
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
                </div>

                <div class="container-login100-form-btn">
                    <button class="login100-form-btn">
                        Login
                    </button>
                </div>

                <div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
                    <a class="txt2" href="#">
                        Username / Password?
                    </a>
                </div>

                <div class="text-center p-t-136">
                    <a class="txt2" href="<c:url value="register"/> ">
                        Bạn chưa có tài khoản? Đăng ký
                        <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                    </a>
                </div>
                </form:form>
        </div>
    </div>
</div>
</body>

