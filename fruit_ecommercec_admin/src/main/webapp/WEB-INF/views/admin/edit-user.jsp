<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 6/13/2024
  Time: 12:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<title>Chỉnh Sửa Người Dùng</title>
<body>
<!-- Edit User Form Start -->
<div class="container-fluid pt-4 px-4">
  <div class="bg-light rounded p-4">
    <h6 class="mb-4">Chỉnh Sửa Người Dùng</h6>
    <form:form action="${pageContext.request.contextPath}/user/edit/${user.id}" method="post" modelAttribute="user">
      <div class="mb-3">
        <label for="cusName" class="form-label">Tên</label>
        <input type="text" class="form-control" id="cusName" name="cusName" value="${user.cusName}" required>
      </div>
      <div class="mb-3">
        <label for="username" class="form-label">Tên tài khoản</label>
        <input type="text" class="form-control" id="username" name="username" value="${user.username}" required>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Mật khẩu</label>
        <input type="password" class="form-control" id="password" name="password" required>
      </div>
      <div class="mb-3">
        <label for="cusPhone" class="form-label">Điện thoại</label>
        <input type="text" class="form-control" id="cusPhone" name="cusPhone" value="${user.cusPhone}">
      </div>
      <div class="mb-3">
        <label for="cusEmail" class="form-label">Email</label>
        <input type="email" class="form-control" id="cusEmail" name="cusEmail" value="${user.cusEmail}">
      </div>
      <div class="mb-3">
        <label for="cusAddress" class="form-label">Địa chỉ</label>
        <textarea class="form-control" id="cusAddress" name="cusAddress">${user.cusAddress}</textarea>
      </div>
      <div class="mb-3">
        <label for="gender" class="form-label">Giới Tính</label>
        <select class="form-control" id="gender" name="gender">
          <option value="true" ${user.gender ? 'selected' : ''}>Nam</option>
          <option value="false" ${!user.gender ? 'selected' : ''}>Nữ</option>
        </select>
      </div>
<%--      <div class="mb-3">--%>
<%--        <label for="roleId" class="form-label">Role ID</label>--%>
<%--        <input type="text" class="form-control" id="roleId" name="roleId" value="${user.roleId}">--%>
<%--      </div>--%>
      <div class="mb-3">
        <label for="roleId" class="form-label">ID Quyền</label>
        <form:select path="roleId" id="roleId" class="form-control" required="true">
          <form:options items="${roles}" itemValue="id" itemLabel="id"/>
        </form:select>
      </div>
      <a href="${pageContext.request.contextPath}/user/1" class="btn btn-secondary">Trở lại</a>
      <button type="submit" class="btn btn-primary">Cập Nhật</button>
    </form:form>
  </div>
</div>
<!-- Edit User Form End -->
</body>
