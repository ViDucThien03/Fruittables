<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<body>
<div class="container-fluid">
    <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
        <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
            <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                <div class="d-flex align-items-center justify-content-between mb-3">
                    <a href="index.html" class="">
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>Fruittables</h3>
                    </a>
                    <h3>Sign In</h3>
                </div>
                <form:form action="login" method="post" modelAttribute="user">
                    <div class="form-floating mb-3">
                        <form:input path="username" type="text" class="form-control" id="floatingInput" />
                        <label for="floatingInput">Email address</label>
                    </div>
                    <div class="form-floating mb-4">
                        <form:input type="password" class="form-control" id="floatingPassword" path="password"/>
                        <label for="floatingPassword">Password</label>
                    </div>
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1"/>
                            <label class="form-check-label" for="exampleCheck1">Check me out</label>
                        </div>
                        <a href="">Forgot Password</a>
                    </div>
                    <button type="submit" class="btn btn-primary py-3 w-100 mb-4">Sign In</button>
                </form:form>
                <c:if test="${not empty statuslogin}">
                    <div class="alert alert-danger" role="alert">
                            ${statuslogin}
                    </div>
                </c:if>
                <p class="text-center mb-0">Don't have an Account? <a href="">Sign Up</a></p>
            </div>
        </div>
    </div>
</div>
</body>
