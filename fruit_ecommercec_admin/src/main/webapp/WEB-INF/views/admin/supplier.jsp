<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <title>Quản Lý Nhà Cung Cấp</title>
  <style>
  </style>
</head>
<body>
<!-- Supplier Management Start -->
<div class="container-fluid pt-4 px-4">
  <div class="bg-light text-center rounded p-4">
    <div class="d-flex align-items-center justify-content-between mb-4">
      <h6 class="mb-0">Quản Lý Nhà Cung Cấp</h6>
      <td><a class="btn btn-sm btn-primary" href="${pageContext.request.contextPath}/supplier/add">Thêm nhà cung cấp</a></td>
    </div>
    <p class="text-success">${addMessageSuccess}</p>
    <p class="text-danger">${addMessageFail}</p>
    <p class="text-success">${updateMessageSuccess}</p>
    <p class="text-danger">${updateMessageFail}</p>
    <p class="text-success">${deleteMessageSuccess}</p>
    <p class="text-danger">${deleteMessageFail}</p>

    <div class="table-responsive">
      <table class="table text-start align-middle table-bordered table-hover mb-0">
        <thead>
        <tr class="text-dark">
          <th scope="col">ID</th>
          <th scope="col">Tên nhà cung cấp</th>
          <th scope="col">Địa chỉ</th>
          <th scope="col">Giải thưởng</th>
          <th scope="col">Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="supplier" items="${paginationSupplier}">
          <tr>
            <td>${supplier.id}</td>
            <td>${supplier.supName}</td>
            <td>${supplier.supAddress}</td>
            <td>${supplier.awards}</td>
            <td>
              <a href="${pageContext.request.contextPath}/supplier/edit/${supplier.id}" class="me-4"><i class="fa-solid fa-arrows-rotate"></i></a>
              <a href="${pageContext.request.contextPath}/supplier/delete/${supplier.id}" onclick="deleteSupplier('${supplier.id}')"><i class="fa-solid fa-trash-can" style="width: 24px; height: 24px"></i></a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      <div class="d-flex justify-content-center">
        <nav aria-label="Page navigation example">
          <ul class="pagination">
            <li class="page-item">
              <a class="page-link" href="${pageContext.request.contextPath}/supplier/${1}" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
                <span class="sr-only">Previous</span>
              </a>
            </li>
            <c:forEach begin="1" end="${endPage}" var="i">
              <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/supplier/${i}">${i}</a></li>
            </c:forEach>
            <li class="page-item">
              <a class="page-link" href="${pageContext.request.contextPath}/supplier/${endPage}" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
                <span class="sr-only">Next</span>
              </a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
</div>
<script>
  function deleteSupplier(id) {
    let ans = confirm("Bạn có chắc chắn muốn xóa nhà cung cấp này?");
    if(ans){
      window.location = "${pageContext.request.contextPath}/supplier/delete/"+id;
    }
  }
</script>
<!-- Supplier Management End -->
</body>
</html>
