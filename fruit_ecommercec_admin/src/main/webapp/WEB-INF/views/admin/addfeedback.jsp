<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Add feedback</title>
<body>
<div class="col-sm-12 col-xl-12">
    <div class="bg-light rounded h-100 p-4">
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Add Product</h2>
                            </div>
                        </div>

                        <div class="row tm-edit-product-row">
                            <div class="col-xl-6 col-lg-6 col-md-12">
                                <form:form action="add" method="post" modelAttribute="feedback">
                                    <div class="form-group">
                                        <label for="content">Content</label>
                                        <form:textarea path="content" type="text" id="content" class="form-control"
                                                    required="true"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="rate">Rate</label>
                                        <form:input path="rate" id="rate" class="form-control"
                                                    required="true"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="product_id">Product ID</label>
                                        <form:input path="product_id" type="text" id="product_id" class="form-control"
                                                    required="true"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="customer_id">Customer ID</label>
                                        <form:input path="customer_id" type="text" id="customer_id" class="form-control"
                                                    required="true"/>
                                    </div>
                                    <button type="submit" class="btn btn-primary mt-2">Add</button>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>