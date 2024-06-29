<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
  <title>Chỉnh Sửa Nhà Cung Cấp</title>
</head>
<body>
<!-- Edit Supplier Form Start -->
<div class="container-fluid pt-4 px-4">
  <div class="bg-light rounded p-4">
    <h6 class="mb-4">Chỉnh Sửa Nhà Cung Cấp</h6>
    <form:form method="post" action="${pageContext.request.contextPath}/supplier/edit/${supplier.id}" modelAttribute="supplier">
      <div class="mb-3">
        <label for="name" class="form-label">Tên nhà cung cấp</label>
        <form:input path="supName" id="name" class="form-control" required="true"/>
      </div>
      <div class="mb-3">
        <label for="address" class="form-label">Địa chỉ</label>
        <form:input path="supAddress" id="address" class="form-control" required="true"/>
      </div>
      <div class="mb-3">
        <label for="awards" class="form-label">Giải thưởng</label>
        <form:input path="awards" id="awards" class="form-control" required="true"/>
      </div>
      <div class="mb-3">
        <label for="supImg" class="form-label">Ảnh</label>
        <input accept="image/*" type='file' id="imgInp" class="form-control" />
        <form:hidden path="supImg" id="fileInput" value="${supplier.supImg}"/>
      </div>
      <a href="${pageContext.request.contextPath}/supplier/1" class="btn btn-secondary">Trở lại</a>
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
<!-- Edit Supplier Form End -->
</body>

