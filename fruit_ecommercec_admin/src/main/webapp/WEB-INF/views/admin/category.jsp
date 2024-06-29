<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 6/13/2024
  Time: 12:32 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <title>Quản Lý Danh Mục</title>
  <style>
  </style>
</head>
<body>
<!-- Category Management Start -->
<div class="container-fluid pt-4 px-4">
  <div class="bg-light text-center rounded p-4">
    <div class="d-flex align-items-center justify-content-between mb-4">
      <h6 class="mb-0">Quản Lý Danh Mục</h6>
      <td><a class="btn btn-sm btn-primary" href="${pageContext.request.contextPath}/category/add">Thêm danh mục</a></td>
    </div>
    <p class="text-success">${addMessageSuccess}</p>
    <p class="text-danger">${addMessageFail}</p>
      <p class="text-success">${updateMessageSuccess}</p>
      <p class="text-danger">${updateMessageFail}</p>
      <p class="text-success">${deteleMessageSuccess}</p>
      <p class="text-danger">${deteleMessageFail}</p>

    <div class="table-responsive">
      <table class="table text-start align-middle table-bordered table-hover mb-0">
        <thead>
        <tr class="text-dark">
          <th scope="col">ID</th>
          <th scope="col">Ảnh</th>
          <th scope="col">Tên danh mục</th>
          <th scope="col">Trạng thái</th>
          <th scope="col">Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="category" items="${paginationCategory}">
          <tr>
            <td>${category.cateId}</td>
<%--            <td>${category.cateImg}</td>--%>
            <td>
              <img src="${pageContext.request.contextPath}/category/image/${category.cateImg}" alt="Category Image" style="width: 100px; height: auto;"/>

            </td>

            <td>${category.cateName}</td>
            <td>
              <c:if test="${category.enable eq 'true'}">Enable</c:if>
              <c:if test="${category.enable eq 'false'}">Disable</c:if>
            </td>
            <td>
              <a href="${pageContext.request.contextPath}/category/edit/${category.cateId}" class="me-4"><i class="fa-solid fa-arrows-rotate"></i></a>
              <a href="${pageContext.request.contextPath}/category/delete/${category.cateId}" onclick="deleteCategory('${category.cateId}')"><i class="fa-solid fa-trash-can" style="width: 24px; height: 24px"></i></a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      <div class="d-flex justify-content-center">
        <nav aria-label="Page navigation example">
          <ul class="pagination">
            <li class="page-item">
              <a class="page-link" href="${pageContext.request.contextPath}/category/${1}" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
                <span class="sr-only">Previous</span>
              </a>
            </li>
            <c:forEach begin="1" end="${endPage}" var="i">
              <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/category/${i}">${i}</a></li>
            </c:forEach>
            <li class="page-item">
              <a class="page-link" href="${pageContext.request.contextPath}/category/${endPage}" aria-label="Next">
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
  function deleteCategory(id) {
    let ans = confirm("Bạn có chắc chắn muốn xóa danh mục này?");
    if(ans){
      window.location = "${pageContext.request.contextPath}/category/delete/"+id;
    }
  }
</script>
<!-- Category Management End -->
</body>
</html>
