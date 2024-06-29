<%--
  Created by IntelliJ IDEA.
  User: FPT
  Date: 4/29/2024
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>

<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">Cart</h1>
    <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Pages</a></li>
        <li class="breadcrumb-item active text-white">Cart</li>
    </ol>
</div>
<!-- Single Page Header End -->

<!-- Cart Page Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Products</th>
                    <th scope="col">Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Total</th>
                    <th scope="col">Handle</th>
                </tr>
                </thead>
                <tbody id="cart-items">

                <c:forEach var="item" items="${cart}">
                    <tr>
                        <th scope="row">
                            <div class="d-flex align-items-center">
                                <img src="<c:url value="/resource/user/img/products/${item.value.product.productImage}"/>" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
                            </div>
                        </th>
                        <td>
                            <p class="mb-0 mt-4">${item.value.product.productName}</p>
                        </td>
                        <td>
                            <p class="mb-0 mt-4">${item.value.product.productPrice} VNĐ/KG</p>
                        </td>
                        <td>
                            <div class="input-group quantity mt-4" style="width: 100px;">
                                <div class="input-group-btn">
                                    <button data-id="${item.key}" class="btn btn-sm btn-minus rounded-circle bg-light border edit-cart" >
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <input type="text" id="quantity-itemcart-${item.key}" class="form-control form-control-sm text-center border-0" value="${item.value.quantity}">
                                <div class="input-group-btn">
                                    <button data-id="${item.key}" class="btn btn-sm btn-plus rounded-circle bg-light border edit-cart" >
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                        </td>
                        <td>
                            <p class="mb-0 mt-4">${item.value.totalPrice} VNĐ/KG</p>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/deleteCart/${item.value.product.id}" class="btn btn-md rounded-circle bg-light border mt-4" >
                                <i class="fa fa-trash text-danger"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

        <div class="row g-4 justify-content-end">
            <div class="col-8">
                <img style="width:700px; height:auto; margin-left:0; display: block" src="<c:url value="/resource/user/img/cartdecor.jpg"/>">;
            </div>
            <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                <div class="bg-light rounded">
                    <div class="p-4">
                        <h1 class="display-6 mb-4">Cart <span class="fw-normal">Total</span></h1>
                        <div class="d-flex justify-content-between mb-4">
                            <h5 class="mb-0 me-4">Subtotal:</h5>
                            <p class="mb-0">${totalPrice} VNĐ/KG</p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h5 class="mb-0 me-4">Shipping</h5>
                            <div class="">
                                <p class="mb-0">Flat rate: $3.00</p>
                            </div>
                        </div>
                        <p class="mb-0 text-end">Shipping to Ukraine.</p>
                    </div>
                    <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                        <h5 class="mb-0 ps-4 me-4">Total</h5>
                        <p class="mb-0 pe-4">$99.00</p>
                    </div>

                    <c:if test="${empty loginInfo}">
                        <button id="CheckoutButton" class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4" type="button" onclick="redirectToCheckout(false)">Proceed Checkout</button>
                    </c:if>
                    <c:if test="${ not empty loginInfo}">
                        <button id="CheckoutButton" class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4" type="button" onclick="redirectToCheckout(true)">Proceed Checkout</button>
                    </c:if>

                    <%--<button id="CheckoutButton" class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4" type="button" onclick="redirectToCheckout()">Proceed Checkout</button>--%>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Cart Page End -->

<content tag="script">
    <script>
        $(document).ready(function (){
            $(".edit-cart").on("click", function(){
                var id = $(this).data("id");
                var quantity = $("#quantity-itemcart-" + id).val();
                window.location = "editCart/" + id + "/" + quantity;
            });
        });
    </script>
</content>

<script>
    function redirectToCheckout(isLoggedIn) {
        if (isLoggedIn) {
            const cartItems = document.getElementById('cart-items').children.length;
            if(cartItems === 0) alert('Your cart is empty');
            else window.location.href = "${pageContext.request.contextPath}/checkout";
        } else {
            alert('Bạn cần đăng nhập để tiếp tục.');
            window.location.href = '${pageContext.request.contextPath}/login';
        }
    }
</script>

</body>