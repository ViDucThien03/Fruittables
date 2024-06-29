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
    <title>Quản Lý Bài Viết</title>
</head>
<body>
<!-- BlogDetails Management Start -->
<div class="container-fluid pt-4 px-4">
    <div class="bg-light text-center rounded p-4">
        <div class="d-flex align-items-center justify-content-between mb-4">
            <h6 class="mb-0">Quản Lý Bài Viết</h6>
            <a class="btn btn-sm btn-primary" href="${pageContext.request.contextPath}/blogdetails/add">Thêm Bài Viết</a>
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
                    <th scope="col">Tiêu đề</th>
                    <th scope="col">Miêu tả</th>
                    <th scope="col">Ảnh</th>
                    <th scope="col">Hành động</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="blogDetail" items="${paginationBlogDetails}">
                    <tr>
                        <td>${blogDetail.id}</td>
                        <td>${blogDetail.title}</td>
                        <td>${blogDetail.description}</td>
                        <td><img src="${pageContext.request.contextPath}/blog/image/${blogDetail.blogImg}" width="100" height="100"/></td>
<%--                        <c:out value="${pageContext.request.contextPath}/blog/image/${blogDetail.blogImg}" />--%>
<%--                        <td>${blogDetail.blogImg} </td>--%>
                        <td>
                           <a href="${pageContext.request.contextPath}/blogdetails/edit/${blogDetail.id}" class="me-4"><i class="fa-solid fa-arrows-rotate"></i></a>
                            <a href="${pageContext.request.contextPath}/blogdetails/delete/${blogDetail.id}" onclick="deleteBlogDetail('${blogDetail.id}')"><i class="fa-solid fa-trash-can" style="width: 24px; height: 24px" onclick="deleteProduct('${product.productId}')"></i></a>

<%--                            <a class="btn btn-sm btn-warning" href="${pageContext.request.contextPath}/blogdetails/edit/${blogDetail.id}">Edit</a>--%>
<%--                            <a class="btn btn-sm btn-danger" href="${pageContext.request.contextPath}/blogdetails/delete/${blogDetail.id}" onclick="deleteBlogDetail('${blogDetail.id}')">Delete</a>--%>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="d-flex justify-content-center">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="${pageContext.request.contextPath}/blogdetails/${1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                        <c:forEach begin="1" end="${endPage}" var="i">
                            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/blogdetails/${i}">${i}</a></li>
                        </c:forEach>
                        <li class="page-item">
                            <a class="page-link" href="${pageContext.request.contextPath}/blogdetails/${endPage}" aria-label="Next">
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
    function deleteBlogDetail(id) {
        let ans = confirm("Bạn có chắc chắn muốn xóa bài viết này?");
        if(ans){
            window.location = "${pageContext.request.contextPath}/blogdetails/delete/"+id;
        }
    }
</script>
<!-- BlogDetails Management End -->
</body>
</html>
