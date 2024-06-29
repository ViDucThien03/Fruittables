<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<body>
<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">Checkout</h1>
    <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Pages</a></li>
        <li class="breadcrumb-item active text-white">Checkout</li>
    </ol>
</div>
<!-- Single Page Header End -->


<!-- Checkout Page Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <h1 class="mb-4">Chi tiết đơn hàng</h1>
        <form:form action="checkout" method="post" modelAttribute="checkout" id="checkoutForm" accept-charset="UTF-8">
            <div class="row g-5">
                <div class="col-md-12 col-lg-6 col-xl-6">
                    <div class="form-item">
                        <label class="form-label my-3"><b>Họ tên </b><sup>*</sup></label>
                        <form:input type="text" class="form-control" path="fullName" id="fullName"/>
                    </div>
                    <div class="form-item">
                        <label class="form-label my-3"><b>Địa chỉ </b> <sup>*</sup></label>
                        <form:input type="text" class="form-control"
                                    path="address" id="address"/>
                    </div>
                    <div class="form-item">
                        <label class="form-label my-3"><b>Số điện thoại </b> <sup>*</sup></label>
                        <form:input type="text" class="form-control" path="phone" id="phone"/>
                    </div>
                    <div class="form-item">
                        <label class="form-label my-3"><b>Email </b> <sup>*</sup></label>
                        <form:input type="email" class="form-control" path="email" id="email"/>
                    </div>
                    <br>
                    <div class="form-item">
                        <form:textarea name="text" class="form-control" spellcheck="false" cols="30" rows="11"
                                       placeholder="Order Notes (Optional)" path="desc_order"/>
                    </div>
                </div>
                <div class="col-md-12 col-lg-6 col-xl-6">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">Sản phẩm</th>
                                <th scope="col">Tên</th>
                                <th scope="col">Giá</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Tổng giá</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${cart}">
                                <tr>
                                    <th scope="row">
                                        <div class="d-flex align-items-center mt-2">
                                            <img src="${pageContext.request.contextPath}/product/image/${item.value.product.productImg}"

                                                 class="img-fluid rounded-circle" style="width: 90px; height: 90px;"
                                                 alt="">
                                        </div>
                                    </th>
                                    <td class="py-5">${item.value.product.productName}</td>
                                    <td class="py-5">${item.value.product.productPrice}</td>
                                    <td class="py-5">${item.value.quantity}</td>
                                    <td class="py-5">${item.value.totalPrice}</td>
                                </tr>
                            </c:forEach>

                            <tr>
                                <th scope="row"></th>
                                <td class="py-3">
                                    <p class="mb-0 text-dark text-uppercase py-3"><b>TỔNG</b></p>
                                </td>
                                <td class="py-3"></td>
                                <td class="py-3"></td>
                                <td class="py-3">
                                    <div class="py-3">
                                        <p class="mb-0 text-dark"><b>${totalPrice} VND</b></p>
                                        <input type="hidden" id="totalAmount" value="${totalPrice}">
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                        <div class="col-12">
                            <div class="form-check text-start my-3">
                                    <%--                                <input type="radio" class="form-check-input bg-primary border-0" id="Delivery-1" name="Delivery" value="COD">--%>
                                <label class="form-check-label mb-1 text-danger" for="delivery">Vui lòng chọn phương thức thanh toán*</label>
                                <form:input path="statusPayment" id="statusPayment" cssStyle="display: none"/>
                                <select class="form-select" id="delivery" aria-label="Default select example">
                                    <option value="COD" selected>Thanh toán khi nhận hàng</option>
                                    <option value="Online" >Thanh toán online</option>
                                </select>
                                 <form:input path="paymentMethod" id="paymentMethod"  cssStyle="display: none" />
                                <form:input path="userid" cssStyle="display: none" value="${loginInfo.id}"/>
                            </div>
                        </div>
                    </div>

                    <div class="row g-4 text-center align-items-center justify-content-center pt-4">
                        <button type="submit" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">
                            Place Order
                        </button>
                    </div>
                </div>
            </div>
        </form:form>
    </div>
</div>
<!-- Checkout Page End -->

<script>
    document.getElementById('checkoutForm').addEventListener('submit', function (event) {
        event.preventDefault();
        let fullName = document.getElementById('fullName').value.trim();
        let address = document.getElementById('address').value.trim();
        let phone = document.getElementById('phone').value.trim();
        let email = document.getElementById('email').value.trim();
        let totalAmount = document.getElementById('totalAmount').value.trim();
        let paymentMethod = document.getElementById('delivery').value;
        let isValid = true;
        if (paymentMethod === 'COD') {
            this.action = 'checkout';
        } else if (paymentMethod === 'Online') {
            this.action = 'saveData';
        }
        if (fullName === '') {
            isValid = false;
            alert('Full Name is required.');
        }
        if (address === '') {
            isValid = false;
            alert('Address is required.');
        }
        if (phone === '') {
            isValid = false;
            alert('Phone number is required.');
        } else if (!/^[0-9]{10}$/.test(phone)) {
            isValid = false;
            alert('Phone number should be exactly 10 digits.');
        }
        if (email === '') {
            isValid = false;
            alert('Email is required.');
        } else if (!/\S+@\S+\.\S+/.test(email)) {
            isValid = false;
            alert('Email should be valid.');
        }
        if (!isValid) {
            event.preventDefault();
            return;
        }
        if (paymentMethod === 'COD') {
            alert("Đặt hàng thành công!");
            document.getElementById('statusPayment').value = 'Chưa thanh toán';
            document.getElementById('paymentMethod').value = 'COD';
            this.submit();
        } else if (paymentMethod === 'Online') {
            document.getElementById('statusPayment').value= 'Đã thanh toán';
            document.getElementById('paymentMethod').value = 'Online';
            this.submit();
            fetch('${pageContext.request.contextPath}/api/payment/create_payment?amount=' + totalAmount)
                .then(response => response.json())
                .then(data => {
                    if (data.code === '00') {
                        window.location.href = data.data;
                    } else {
                        alert('Error: ' + data.message);
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('An error occurred while processing your payment.');
                });
        }
    });
</script>
</body>
