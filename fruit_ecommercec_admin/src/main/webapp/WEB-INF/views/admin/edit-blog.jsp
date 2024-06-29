<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<title>Chỉnh Sửa Bài Viết</title>
<body>
<div class="container-fluid pt-4 px-4">
  <div class="bg-light rounded p-4">
    <h6 class="mb-4">Chỉnh Sửa Bài Viết</h6>
      <form:form method="post" action="${pageContext.request.contextPath}/blogdetails/edit/${blogDetail.id}" enctype="multipart/form-data" modelAttribute="blogDetail">
      <form:hidden path="id"/>
      <div class="mb-3">
        <label for="title" class="form-label">Tiêu đề</label>
        <form:input type="text" path="title" class="form-control" id="title"/>
      </div>
      <div class="mb-3">
        <label for="content" class="form-label">Nội dung</label>
        <form:input path="content" class="form-control" id="content"/>
      </div>
      <div class="mb-3">
        <label for="description" class="form-label">Mô tả</label>
        <form:input path="description" class="form-control" id="description"/>
      </div>
      <div class="mb-3">
        <label for="blogImg" class="form-label">Tên danh mục</label>
        <img id="blah" src="${blogDetail.blogImg}" alt="Blog Image" style="max-width:100px; max-height:100px;"/>
      </div>
      <div class="mb-3">
        <input accept="image/*" type='file' id="imgInp" name="file" class="form-control" />
        <form:hidden path="blogImg" id="fileInput" value="${blogDetail.blogImg}"/>
      </div>

<%--      <div class="mb-3">--%>
<%--        <label for="createAt" class="form-label">Ngày tạo</label>--%>
<%--        <form:input type="date" path="createAt" class="form-control" id="createAt" readonly="true"/>--%>
<%--      </div>--%>
<%--      <div class="mb-3">--%>
<%--        <label for="blogId" class="form-label">Thuộc Tính</label>--%>
<%--        <form:select path="blogId" id="blogId" class="form-control" required="true">--%>
<%--          <form:options items="${blogTypes}" itemValue="id" itemLabel="id"/>--%>
<%--        </form:select>--%>
<%--      </div>--%>
<%--      <div class="mb-3">--%>
<%--        <label for="customerId" class="form-label">ID Người dùng</label>--%>
<%--        <form:select path="customerId" id="customerId" class="form-control" required="true">--%>
<%--          <form:options items="${customers}" itemValue="id" itemLabel="id"/>--%>
<%--        </form:select>--%>
<%--      </div>--%>
        <a href="${pageContext.request.contextPath}/blogdetails/1" class="btn btn-secondary">Trở lại</a>
      <button type="submit" class="btn btn-primary">Cật Nhật</button>
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
