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
<title>Quản Lý Người Dùng</title>
<body>
<!-- Recent Users Start -->
<div class="container-fluid pt-4 px-4">
    <div class="bg-light text-center rounded p-4">
        <div class="d-flex align-items-center justify-content-between mb-4">
            <h6 class="mb-0">Quản Lý Người Dùng</h6>
            <td><a class="btn btn-sm btn-primary" href="${pageContext.request.contextPath}/user/add">Thêm Người Dùng</a></td>
        </div>
        <p class="text-success">${addMessageSuccess}</p>
        <p class="text-danger">${addMessageFail}</p>
        <p class="text-success">${updateMessageSuccess}</p>
        <p class="text-danger">${updateMessageFail}</p>
        <p class="text-success">${deteleMessageSuccess}</p>
        <p class="text-danger">${deteleMessageFail}</p>
        <div class="table-responsive">
            <table class="table text-start align-middle table table-hover table-striped mb-0">
                <thead>
                <tr class="text-dark">
                    <th scope="col">ID</th>
                    <th scope="col">Tên</th>
                    <th scope="col">Tên tài khoản</th>
                    <th scope="col">Email</th>
                    <th scope="col">Số điện thoại</th>
                    <th scope="col">Địa chỉ</th>
                    <th scope="col">Giới tính</th>
                    <th scope="col">ID quyền</th>
                    <th scope="col">Trạng Thái</th>
                    <th scope="col">Hành động</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${paginationUsers}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.cusName}</td>
                        <td>${user.username}</td>
                        <td>${user.cusEmail}</td>
                        <td>${user.cusPhone}</td>
                        <td>${user.cusAddress}</td>
                        <td>${user.gender ? 'Nam' : 'Nữ'}</td>

                        <td>
                            <form action="${pageContext.request.contextPath}/user/updateRole" method="post">
                                <input type="hidden" name="userId" value="${user.id}" />
                                <select class="form-select" aria-label="Default select example" name="roleId" onchange="this.form.submit()">
                                    <c:if test="${user.roleId == 2}">
                                        <option value="2" selected>Khách hàng</option>
                                    </c:if>
                                    <c:if test="${user.roleId == 1}">
                                        <option value="1"  selected>Quản trị viên</option>
                                    </c:if>
                                    <c:forEach var="item" items="${listRole}">
                                        <c:if test="${item.id == 2}">
                                            <option value="2" >Khách hàng</option>
                                        </c:if>
                                        <c:if test="${item.id == 1}">
                                            <option value="1" >Quản trị viên</option>
                                        </c:if>
                                    </c:forEach>

                                </select>
                            </form></td>
                        <td>
                            <form action="${pageContext.request.contextPath}/user/updateUserStatus" method="post">
                                <input type="hidden" name="userId" value="${user.id}" />
                                <select class="form-select" aria-label="Default select example" name="userStatus" onchange="this.form.submit()">
                                    <option selected>${user.cusEnable}</option>
                                    <c:if test="${user.cusEnable != 'active'}">
                                        <option value="active">Active</option>
                                    </c:if>
                                    <c:if test="${user.cusEnable != 'disable'}">
                                        <option value="disable">Disable</option>
                                    </c:if>
                                </select>
                            </form>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/user/delete/${user.id}" onclick="deleteUser('${user.id}')"><i class="fa-solid fa-trash-can" style="width: 24px; height: 24px"></i></a>
<%--                            <a class="btn btn-sm btn-warning" href="${pageContext.request.contextPath}/user/edit/${user.id}">Edit</a>--%>
<%--                            <a class="btn btn-sm btn-danger" href="${pageContext.request.contextPath}/user/delete/${user.id}" onclick="deleteUser('${user.id}')">Delete</a>--%>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="d-flex justify-content-center">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="${pageContext.request.contextPath}/user/${1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                        <c:forEach begin="1" end="${endPage}" var="i">
                            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/user/${i}">${i}</a></li>
                        </c:forEach>
                        <li class="page-item">
                            <a class="page-link" href="${pageContext.request.contextPath}/user/${endPage}" aria-label="Next">
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
    function deleteUser(id) {
        let ans = confirm("Bạn có đồng ý xóa nguười dùng này này?");
        if(ans){
            window.location = "delete/"+id;
        }
    }
</script>
<!-- Recent Users End -->
</body>
