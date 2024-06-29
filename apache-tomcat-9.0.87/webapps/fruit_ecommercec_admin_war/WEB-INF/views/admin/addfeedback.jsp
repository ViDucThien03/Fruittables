<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Add feedback</title>
<body>
<form:form action="add" method="post" modelAttribute="feedback">
    <div class="form-group">
        <label for="content">Content</label>
        <form:input path="content" type="text" id="content" class="form-control" required="true"/>
    </div>
    <div class="form-group">
        <label for="rate">Rate</label>
        <form:input path="rate" type="number" id="rate" class="form-control" required="true"/>
    </div>
    <div class="form-group">
        <label for="product_id">Product ID</label>
        <form:input path="product_id" type="text" id="product_id" class="form-control" required="true"/>
    </div>
    <div class="form-group">
        <label for="customer_id">Customer ID</label>
        <form:input path="customer_id" type="text" id="customer_id" class="form-control" required="true"/>
    </div>
    <button type="submit" class="btn btn-primary">Add</button>
</form:form>
</body>