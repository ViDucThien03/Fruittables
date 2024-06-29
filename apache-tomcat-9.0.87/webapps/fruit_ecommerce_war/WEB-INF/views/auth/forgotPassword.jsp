<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/22/2024
  Time: 10:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>Đăng ký</title>

<body>
<section class="vh-100" style="background-color: #f0f2f5;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card"
                     style="border-radius: 1rem;box-shadow: 0 2px 4px rgba(0, 0, 0, .1), 0 8px 16px rgba(0, 0, 0, .1);">
                    <div class="row g-0">
                        <div class="col-md-6 col-lg-5 d-none d-md-block ">
                            <img src="<c:url value="/resource/user/img/img-login.png"/>"
                                 alt="login form" class="img-fluid h-100" style="border-radius: 1rem 0 0 1rem;"/>
                        </div>
                        <div class="col-md-6 col-lg-7 d-flex align-items-center">
                            <div class="card-body p-4 p-lg-5 text-black">
                                <form action="sendCode" method="post" >

                                    <div class="d-flex align-items-center mb-3 pb-1">
                                        <span class="h1 fw-bold mb-0 text-primary">Fruitables</span>
                                    </div>

                                    <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Đổi mật khẩu</h5>
                                    <p class="text-danger mt-2">${requestScope.message}</p>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="email">Email</label>
                                        <input type="email" id="email" class="form-control form-control-lg" name="email" value="${checkEmail}" required/>

                                    </div>
                                    <div class="d-flex">
                                        <div class="form-outline mb-4 col-5 me-3">
                                            <label class="form-label">Mã xác minh</label>
                                            <input type="text" id="guessedNumber" class="form-control form-control-lg" name="guessedNumber" value="${guessedNumber}" required/>
                                        </div>
                                        <div class="form-outline mb-4">
                                            <button type="submit" id="sendButton" class="btn btn-warning " style="margin-top: 35px; padding-bottom: 10px; padding-top: 10px;" onclick="startCountdown()" >Gửi mã</button>
                                        </div>
                                    </div>
                                </form>
                                <c:if test="${not empty checkEmail}">
                                    <form action="forgotPassword" method="post"  id="forgotForm">
                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="newPassword">Mật khẩu mới</label>
                                            <input type="password" id="newPassword"
                                                   class="form-control form-control-lg" name="newPassword" required/>
                                        </div>
                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="rePassword">Nhập lại mật khẩu</label>
                                            <input type="password" id="rePassword"
                                                   class="form-control form-control-lg" name="rePassword" required/>
                                        </div>
                                        <input type="hidden" id="verificationCode" name="guessedNumber"/>
                                        <input type="hidden" id="emaill" name="email"/>
                                        <div class="pt-1 mb-4">
                                            <button class="btn btn-primary btn-lg btn-block w-100 text-white" onclick="submitSecondForm()">
                                                Đổi mật khẩu
                                            </button>
                                        </div>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    function submitSecondForm() {

        let verificationCode = document.getElementById('guessedNumber').value;
        let email = document.getElementById('email').value;
        console.log(verificationCode)

        document.getElementById('verificationCode').value = verificationCode;
        document.getElementById('emaill').value = email;


        document.getElementById('forgotForm').submit();
    }
</script>

</body>
