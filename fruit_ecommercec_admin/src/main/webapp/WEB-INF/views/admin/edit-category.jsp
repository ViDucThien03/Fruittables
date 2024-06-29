<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 6/13/2024
  Time: 12:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<title>Chỉnh Sửa Danh Mục</title>
<body>
<div class="container-fluid pt-4 px-4">
  <div class="bg-light rounded p-4">
    <h6 class="mb-4">Chỉnh Sửa Danh Mục</h6>
    <form:form method="post" action="${pageContext.request.contextPath}/category/edit/${categories.cateId}" enctype="multipart/form-data" modelAttribute="categories">
      <form:hidden path="cateId"/>
      <div class="mb-3">
        <label for="cateImg" class="form-label">Ảnh</label>
        <img id="blah" src="${categories.cateImg}" alt="Category Image" style="max-width:100px; max-height:100px;"/>
      </div>
      <div class="mb-3">
        <input accept="image/*" type='file' id="imgInp" name="file" class="form-control" />
        <form:hidden path="cateImg" id="fileInput" value="${categories.cateImg}"/>
      </div>
      <div class="mb-3">
        <label for="cateName" class="form-label">Tên danh mục</label>
        <form:input type="text" path="cateName" class="form-control" id="cateName"/>
      </div>
      <div class="form-group mb-3">
        <label for="enable">Status</label>
        <form:select path="enable" id="enable" class="custom-select tm-select-accounts" required="true">
          <option value="" disabled>Select status</option>
          <option value="true" ${categories.enable == 'true' ? 'selected' : ''}>Enabled</option>
          <option value="false" ${categories.enable == 'false' ? 'selected' : ''}>Disabled</option>
        </form:select>
      </div>
      <a href="${pageContext.request.contextPath}/category/1" class="btn btn-secondary">Trở lại</a>
      <button type="submit" class="btn btn-primary">Cập nhật</button>
    </form:form>
  </div>
</div>
<script>
  imgInp.onchange = evt => {
    const [file] = imgInp.files;
    if (file) {
      document.getElementById('blah').src = URL.createObjectURL(file);
    }
  };
  document.getElementById('imgInp').addEventListener('change', function() {
    document.getElementById('fileInput').value = this.files[0].name;
  });
</script>
</body>
