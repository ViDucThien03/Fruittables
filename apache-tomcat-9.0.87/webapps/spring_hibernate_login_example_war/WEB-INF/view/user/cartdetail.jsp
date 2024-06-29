<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/2/2024
  Time: 9:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <title>Giỏ hàng</title>

<body>
<section class="breadcrumb-section set-bg" data-setbg="<c:url value="/resource/user/img/breadcrumb.jpg"/> ">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Shopping Cart</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">Home</a>
                        <span>Shopping Cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th class="shoping__product">Sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Tổng</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${cart}">
                        <tr>
                            <td class="shoping__cart__item">
                                <img src="<c:url value="/resource/user/img/product/${item.value.product.image}"/> " alt="" width="100" height="100">
                                <h5>${item.value.product.productName}</h5>
                            </td>
                            <td class="shoping__cart__price">
                                    ${item.value.product.price}
                            </td>
                            <td class="shoping__cart__quantity">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="${item.value.quantity}" id="quantity-cart-${item.key}"/>
                                    </div>
                                </div>
                            </td>
                            <td class="shoping__cart__total">
                                $${item.value.totalPrice}
                            </td>
                            <td class="shoping__cart__item__close">
                                <a href="<c:url value="deletecart/${item.key}"/>"><span class="icon_close"></span></a>
                            </td>
                            <td class="shoping__cart__item__edit">
                                <button  data-id="${item.key}" class="edit-cart"><span class="icon_pencil-edit_alt " ></span></button>
                            </td>

                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__btns">
                    <a href="<c:url value="/shop-gird"/> " class="primary-btn cart-btn">Tiếp tục mua sắm</a>
                </div>
                <div class="shoping__cart__btns">
                    <a href="<c:url value="/trackorder/${loginInfo.id}"/> " class="primary-btn cart-btn">Theo dõi đơn hàng</a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="shoping__checkout">
                    <h5>Cart Total</h5>
                    <ul>
                        <li>Subtotal <span>$0</span></li>
                        <li>Total <span>$${totalPrice}</span></li>
                    </ul>
                    <a href="<c:url value="/checkout"/> " class="primary-btn">Thanh toán</a>
                </div>
            </div>
        </div>
    </div>
</section>
<content tag="script">
    <script>
        $(document).ready(function () {
            $(".edit-cart").on("click", function () {

                var id = $(this).data("id");
                var quantity = $("#quantity-cart-"+id).val();
                window.location = "editcart/"+id+"/"+quantity;
            });
        });
    </script>
</content>

</body>

