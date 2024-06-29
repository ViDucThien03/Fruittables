<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 6/13/2024
  Time: 12:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<title>Thêm Người Dùng</title>
<body>
<!-- Add User Form Start -->
<div class="container-fluid pt-4 px-4">
  <div class="bg-light rounded p-4">
    <h6 class="mb-4">Thêm Người Dùng</h6>
    <form:form action="${pageContext.request.contextPath}/user/add" method="post" modelAttribute="user">
      <div class="mb-3">
        <label for="cusName" class="form-label">Tên</label>
        <input type="text" class="form-control" id="cusName" name="cusName" required>
      </div>
      <div class="mb-3">
        <label for="username" class="form-label">Tên tài khoản</label>
        <input type="text" class="form-control" id="username" name="username" required>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Mật khẩu</label>
        <input type="password" class="form-control" id="password" name="password" required>
      </div>
      <div class="mb-3">
        <label for="cusPhone" class="form-label">Điện thoại</label>
        <input type="text" class="form-control" id="cusPhone" name="cusPhone">
      </div>
      <div class="mb-3">
        <label for="cusEmail" class="form-label">Email</label>
        <input type="email" class="form-control" id="cusEmail" name="cusEmail">
      </div>
      <div class="mb-3">
        <label for="cusAddress" class="form-label">Địa chỉ</label>
        <textarea class="form-control" id="cusAddress" name="cusAddress"></textarea>
      </div>
      <div class="mb-3">
        <label for="gender" class="form-label">Giới tính</label>
        <select class="form-control" id="gender" name="gender">
          <option value="true">Nam</option>
          <option value="false">Nữ</option>
        </select>
      </div>
      <div class="mb-3">
        <label for="roleId" class="form-label">ID quyền</label>
        <form:select path="roleId" id="roleId" class="form-control" required="true">
          <form:options items="${roles}" itemValue="id" itemLabel="roles"/>
        </form:select>
      </div>
      <div class="mb-3">
        <label for="gender" class="form-label">Trạng Thái</label>
        <input type="text" class="form-control" id="cusEnable" name="cusEnable"value="Kích hoạt" readonly="true">
      </div>
      <a href="${pageContext.request.contextPath}/user/1" class="btn btn-secondary">Trở lại</a>
      <button type="submit" class="btn btn-primary">Thêm</button>
    </form:form>
  </div>
</div>
<!-- Add User Form End -->
</body>
