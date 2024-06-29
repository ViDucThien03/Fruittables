<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
  <title>Thêm Nhà Cung Cấp</title>
</head>
<body>
<!-- Add Supplier Form Start -->
<div class="container-fluid pt-4 px-4">
  <div class="bg-light rounded p-4">
    <h6 class="mb-4">Thêm Nhà Cung Cấp</h6>
    <form:form method="post" action="${pageContext.request.contextPath}/supplier/add" modelAttribute="supplier">
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
        <form:input id="fileInput" type="text" style="display: none;" path="supImg"/>
        <input accept="image/*" type='file' id="imgInp"  class="form-control" />
      </div>
      <a href="${pageContext.request.contextPath}/supplier/1" class="btn btn-secondary">Trở lại</a>
      <button type="submit" class="btn btn-primary">Thêm nhà cung cấp</button>
    </form:form>
  </div>
</div>
<script>
  imgInp.onchange = evt => {
    const [file] = imgInp.files
    if (file) {
      blah.src = URL.createObjectURL(file)
    }
  }
  document.getElementById('imgInp').addEventListener('change', function() {
    document.getElementById('fileInput').value = this.files[0].name;
  });
</script>
<!-- Add Supplier Form End -->
</body>

