<%--
  Created by IntelliJ IDEA.
  User: ANPHATPC
  Date: 29/05/2024
  Time: 16:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<title>Dashboard</title>

<body>
<div class="container-fluid pt-4 col-8">
    <div class="row g-4">
        <div class="col-sm-6 col-xl-6">
            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                <i class="fa fa-chart-area fa-3x text-primary"></i>
                <div class="ms-3">
                    <p class="mb-2">Số lượng đơn hàng hôm nay</p>
                    <h3 class="mb-0 text-center">${revenueToday.SoLuongDonHang}</h3>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-6">
            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                <i class="fa fa-chart-pie fa-3x text-primary"></i>
                <div class="ms-3">
                    <p class="mb-2">Doanh thu hôm nay</p>
                    <h3 class="mb-0 text-center">${revenueToday.DoanhThu} VND</h3>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
        <div class="col-12">
            <div class="bg-light text-center rounded p-4">
                <h3>Doanh thu và số lượng đơn hàng theo ngày</h3>
                <div class="text-end">
                    <form action="${pageContext.request.contextPath}/" method="get">
                        <label for="year_1">Năm:</label>
                        <select name="year_1" id="year_1" class="py-1 px-3 rounded">
                            <c:forEach begin="2020" end="2030" var="year">
                                <option value="${year}" <c:if test="${year == selectedYear_1}">selected</c:if>>${year}</option>
                            </c:forEach>
                        </select>

                        <label for="month">Tháng:</label>
                        <select name="month" id="month" class="py-1 px-3 rounded">
                            <c:forEach begin="1" end="12" var="month">
                                <option value="${month}" <c:if test="${month == selectedMonth}">selected</c:if>>${month}</option>
                            </c:forEach>
                        </select>

                        <button type="submit" class="btn btn-primary px-3">
                            <i class="fa-solid fa-filter me-2" style="color: #ffffff;"></i>Lọc
                        </button>
                    </form>
                </div>
                <canvas id="myChart" width="688" height="250" style="display: block; box-sizing: border-box;"></canvas>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
        <div class="col-12">
            <div class="bg-light text-center rounded p-4">
                <h3>Doanh thu và số lượng đơn hàng theo tháng</h3>
                <div class="text-end">
                    <form action="${pageContext.request.contextPath}/" method="get">
                        <label for="year_2">Năm:</label>
                        <select name="year_2" id="year_2" class="py-1 px-3 rounded">
                            <c:forEach begin="2020" end="2030" var="year">
                                <option value="${year}" <c:if test="${year == selectedYear_2}">selected</c:if>>${year}</option>
                            </c:forEach>
                        </select>
                        <button type="submit" class="btn btn-primary px-3">
                            <i class="fa-solid fa-filter me-2" style="color: #ffffff;"></i>Lọc
                        </button>
                    </form>
                </div>
                <canvas id="chartMonth" width="688" height="250" style="display: block; box-sizing: border-box;"></canvas>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
        <div class="col-12">
            <div class="bg-light text-center rounded p-4">
                <h3>Doanh thu và số lượng đơn hàng theo năm</h3>
                <canvas id="chartYear" width="688" height="200" style="display: block; box-sizing: border-box;"></canvas>
            </div>
        </div>
    </div>
</div>


<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
        <div class="col-sm-12 col-xl-12">
            <div class="bg-light text-center rounded p-4">
                <h3 class="pb-2">Số lượng sản phẩm bán được trong ngày</h3>
                <form method="get" action="${pageContext.request.contextPath}/">
                    <label for="day">Chọn ngày:</label>
                    <input type="date" id="day" name="day"
                           value="${fn:escapeXml(selectedDay)}" onchange="this.form.submit()" class="py-1 px-3 rounded">
                </form>

                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">Tên sản phẩm</th>
                        <th scope="col">Số lượng bán được</th>
                        <th scope="col">Giá sản phẩm</th>
                        <th scope="col">Tổng</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${productSellByDay}">
                            <tr>
                                <td>${item.Name}</td>
                                <td>${item.SoLuongSanPhamBanDuoc}</td>
                                <td>${item.Price}</td>
                                <td>${item.Price * item.SoLuongSanPhamBanDuoc}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
        <div class="col-sm-12 col-xl-12">
            <div class="bg-light text-center rounded p-4">
                <h3 class="pb-2">Số lượng sản phẩm bán được trong tháng</h3>
                <div class="text-end">
                    <form action="${pageContext.request.contextPath}/" method="get">
                        <label for="year">Năm:</label>
                        <select name="year_1" id="year" class="py-1 px-3 rounded">
                            <c:forEach begin="2020" end="2030" var="year">
                                <option value="${year}" <c:if test="${year == selectedYear_1}">selected</c:if>>${year}</option>
                            </c:forEach>
                        </select>

                        <label for="month_1">Tháng:</label>
                        <select name="month" id="month_1" class="py-1 px-3 rounded">
                            <c:forEach begin="1" end="12" var="month">
                                <option value="${month}" <c:if test="${month == selectedMonth}">selected</c:if>>${month}</option>
                            </c:forEach>
                        </select>

                        <button type="submit" class="btn btn-primary px-3">
                            <i class="fa-solid fa-filter me-2" style="color: #ffffff;"></i>Lọc
                        </button>
                    </form>
                </div>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">Tên sản phẩm</th>
                        <th scope="col">Số lượng bán được</th>
                        <th scope="col">Giá sản phẩm</th>
                        <th scope="col">Tổng</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${productSellByMonth}">
                        <tr>
                            <td>${item.Name}</td>
                            <td>${item.SoLuongSanPhamBanDuoc}</td>
                            <td>${item.Price}</td>
                            <td>${item.Price * item.SoLuongSanPhamBanDuoc}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
        <div class="col-sm-12 col-xl-12">
            <div class="bg-light text-center rounded p-4">
                <h3 class="pb-2">Số lượng sản phẩm bán được trong năm</h3>
                <div class="text-end">
                    <form action="${pageContext.request.contextPath}/" method="get">
                        <label for="nam">Năm:</label>
                        <select name="year_2" id="nam" class="py-1 px-3 rounded">
                            <c:forEach begin="2020" end="2030" var="year">
                                <option value="${year}" <c:if test="${year == selectedYear_2}">selected</c:if>>${year}</option>
                            </c:forEach>
                        </select>
                        <button type="submit" class="btn btn-primary px-3">
                            <i class="fa-solid fa-filter me-2" style="color: #ffffff;"></i>Lọc
                        </button>
                    </form>
                </div>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">Tên sản phẩm</th>
                        <th scope="col">Số lượng bán được</th>
                        <th scope="col">Giá sản phẩm</th>
                        <th scope="col">Tổng</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${productSellByYear}">
                        <tr>
                            <td>${item.Name}</td>
                            <td>${item.SoLuongSanPhamBanDuoc}</td>
                            <td>${item.Price}</td>
                            <td>${item.Price * item.SoLuongSanPhamBanDuoc}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<%--<div class="container-fluid pt-4 px-4">--%>
<%--    <div class="row g-4">--%>
<%--        <div class="col-sm-12 col-xl-12">--%>
<%--            <div class="bg-light text-center rounded p-4">--%>
<%--                <h3 class="pb-2">Số lượng và Doanh thu theo ngày</h3>--%>
<%--                <table class="table table-striped">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th scope="col">Ngày</th>--%>
<%--                        <th scope="col">Số lượng đơn hàng</th>--%>
<%--                        <th scope="col">Doanh thu(VND)</th>--%>
<%--                    </tr>--%>

<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <c:forEach var="list" items="${listRevenueDay}">--%>
<%--                        <tr>--%>
<%--                            <td>${list.createDay}</td>--%>
<%--                            <td>${list.SoLuongDonHang}</td>--%>
<%--                            <td>${list.DoanhThu}</td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--    </div>--%>
<%--</div>--%>
<%--<div class="container-fluid pt-4 px-4">--%>
<%--    <div class="row g-4">--%>
<%--        <div class="col-sm-12 col-xl-12">--%>
<%--            <div class="bg-light text-center rounded p-4">--%>
<%--                <h3 class="pb-2 ">Số lượng và Doanh thu theo tháng</h3>--%>
<%--                <table class="table table-striped">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th scope="col">Năm</th>--%>
<%--                        <th scope="col">Tháng</th>--%>
<%--                        <th scope="col">Số lượng đơn hàng</th>--%>
<%--                        <th scope="col">Doanh thu(VND)</th>--%>
<%--                    </tr>--%>

<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <c:forEach var="list" items="${listRevenueMonth}">--%>
<%--                        <tr>--%>
<%--                            <td>${list.Nam}</td>--%>
<%--                            <td>${list.Thang}</td>--%>
<%--                            <td>${list.SoLuongDonHang}</td>--%>
<%--                            <td>${list.DoanhThu}</td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--    </div>--%>
<%--</div>--%>
<%--<div class="container-fluid pt-4 px-4">--%>
<%--    <div class="row g-4">--%>
<%--        <div class="col-sm-12 col-xl-12">--%>
<%--            <div class="bg-light text-center rounded p-4">--%>
<%--                <h3 class="pb-2">Số lượng và Doanh thu theo năm</h3>--%>
<%--                <table class="table table-striped">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th scope="col">Năm</th>--%>
<%--                        <th scope="col">Số lượng đơn hàng</th>--%>
<%--                        <th scope="col">Doanh thu(VND)</th>--%>
<%--                    </tr>--%>

<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <c:forEach var="list" items="${listRevenueYear}">--%>
<%--                        <tr>--%>
<%--                            <td>${list.Nam}</td>--%>
<%--                            <td>${list.SoLuongDonHang}</td>--%>
<%--                            <td>${list.DoanhThu}</td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--    </div>--%>
<%--</div>--%>


<script>
    const xValues = [];
    const yValues = [0];
    const barData = [0];

    <c:forEach var="item" items="${listRevenueDay}">
        xValues.push('${item.createDay}')
        yValues.push(${item.DoanhThu})
        barData.push(${item.SoLuongDonHang})
    </c:forEach>
    console.log(xValues)
    console.log(yValues)
    new Chart("myChart", {
        type: 'bar',
        data: {
            labels: xValues,
            datasets: [{
                type: 'bar',
                label: 'Doanh thu',
                data: yValues,
                backgroundColor: '#009CFF',
                borderColor: '#009CFF',
                borderWidth: 1
            }, {
                type: 'line',
                label: 'Số lượng đơn hàng',
                data: barData,
                backgroundColor: '#0dcaf0',
                borderColor: '#0dcaf0',
                fill: false
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
<script>
    const nam = [];
    const thang = [];
    const thangNam = [];
    const dtData = [0];
    const datalenght = [0];

    <c:forEach var="item" items="${listRevenueMonth}">
    nam.push('${item.Nam}')
    thang.push('${item.Thang}')
    dtData.push(${item.DoanhThu})
    datalenght.push(${item.SoLuongDonHang})
    </c:forEach>
    let minLenght = Math.min(nam.length, thang.length);
    for(let i = 0; i < minLenght; i++){
        thangNam.push(nam[i]+ '-'+ thang[i])
    }
    console.log(nam)
    console.log(thang)
    console.log(thangNam)
    new Chart("chartMonth", {
        type: 'bar',
        data: {
            labels: thangNam,
            datasets: [{
                type: 'bar',
                label: 'Doanh thu',
                data: dtData,
                backgroundColor: '#009CFF',
                borderColor: '#009CFF',
                borderWidth: 1
            }, {
                type: 'line',
                label: 'Số lượng đơn hàng',
                data: datalenght,
                backgroundColor: '#0dcaf0',
                borderColor: '#0dcaf0',
                fill: false
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
<script>
    const revenueYear = [];
    const dtnData = [];
    const datalenght_2 = [0];
    <c:forEach var="item" items="${listRevenueYear}">
    revenueYear.push('${item.Nam}');
    dtnData.push(${item.DoanhThu});
    datalenght_2.push(${item.SoLuongDonHang});
    </c:forEach>;

    console.log(revenueYear);
    console.log(dtnData);
    console.log(datalenght_2);

    new Chart("chartYear", {
        type: 'bar',
        data: {
            labels: revenueYear,
            datasets: [{
                type: 'bar',
                label: 'Doanh thu',
                data: dtnData,
                backgroundColor: '#009CFF',
                borderColor: '#009CFF',
                borderWidth: 1
            }, {
                type: 'line',
                label: 'Số lượng đơn hàng',
                data: datalenght_2,
                backgroundColor: '#0dcaf0',
                borderColor: '#0dcaf0',
                fill: false
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

</body>

