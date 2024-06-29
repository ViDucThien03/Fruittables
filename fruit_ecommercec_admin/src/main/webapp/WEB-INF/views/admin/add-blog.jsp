<!-- add-blog.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<title>Thêm Blog</title>
<body>
<!-- Add BlogDetail Form Start -->
<div class="container-fluid pt-4 px-4">
    <div class="bg-light rounded p-4">
        <h6 class="mb-4">Thêm Bài Viết</h6>
        <form:form method="post" action="${pageContext.request.contextPath}/blogdetails/add" enctype="multipart/form-data" modelAttribute="blogDetail">
            <div class="mb-3">
                <label for="title" class="form-label">Tiêu đề</label>
                <form:input path="title" id="title" class="form-control" required="true"/>
            </div>
            <div class="mb-3">
                <label for="content" class="form-label">Nội dung</label>
                <form:textarea path="content" id="content" class="form-control" required="true"/>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Mô tả</label>
                <form:textarea path="description" id="description" class="form-control" required="true"/>
            </div>
<%--            <div class="mb-3">--%>
<%--                <label for="blogImg" class="form-label">Image</label>--%>
<%--                <input type="file" id="blogImg" name="blogImg" class="form-control-file" required="true"/>--%>
<%--            </div>--%>

                <div class="mb-3">
                        <form:input id="fileInput" type="text" style="display: none;" path="blogImg"/>
                        <input accept="image/*" type='file' id="imgInp" name="file"  class="form-control" />
                    </div>


            <div class="mb-3">
                <label for="blogId" class="form-label">Thuộc tính</label>
                <form:select path="blogId" id="blogId" class="form-control" required="true">
                    <form:options items="${blogTypes}" itemValue="id" itemLabel="typeName"/>
                </form:select>
            </div>
            <div class="mb-3">
                <label for="customerId" class="form-label">ID Người dùng</label>
                <form:select path="customerId" id="customerId" class="form-control" required="true">
                    <form:options items="${customers}" itemValue="id" itemLabel="username"/>
                </form:select>
            </div>
            <a href="${pageContext.request.contextPath}/blogdetails/1" class="btn btn-secondary">Trở lại</a>
            <button type="submit" class="btn btn-primary">Thêm Blog</button>
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
<!-- Add BlogDetail Form End -->
</body>
</html>
