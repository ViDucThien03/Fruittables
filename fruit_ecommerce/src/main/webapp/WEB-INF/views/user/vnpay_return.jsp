<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <title>KẾT QUẢ THANH TOÁN</title>
<body>
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">Checkout</h1>
    <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Pages</a></li>
        <li class="breadcrumb-item active text-white">Checkout</li>
    </ol>
</div>
<div class="container-fluid py-5">
    <div class="container py-5">

    <div class="header clearfix">
        <h3 class="text-muted">KẾT QUẢ THANH TOÁN</h3>
    </div>
    <div class="table-responsive">
        <div class="form-group">
            <label>Mã giao dịch thanh toán:</label>
            <label>${txnRef}</label>
        </div>
        <div class="form-group">
            <label>Số tiền:</label>
            <label>${amount}</label>
        </div>
        <div class="form-group">
            <label>Mô tả giao dịch:</label>
            <label>${orderInfo}</label>
        </div>
        <div class="form-group">
            <label>Mã lỗi thanh toán:</label>
            <label>${responseCode}</label>
        </div>
        <div class="form-group">
            <label>Mã giao dịch tại CTT VNPAY-QR:</label>
            <label>${transactionNo}</label>
        </div>
        <div class="form-group">
            <label>Mã ngân hàng thanh toán:</label>
            <label>${bankCode}</label>
        </div>
        <div class="form-group">
            <label>Thời gian thanh toán:</label>
            <label>${payDate}</label>
        </div>
        <div class="form-group">
            <label>Tình trạng giao dịch:</label>
            <label>${transactionStatus}</label>
        </div>
    </div>
    <p>&nbsp;</p>
    <footer class="footer">
        <p>&copy; VNPAY 2020</p>
    </footer>
</div>
</div>
</body>

