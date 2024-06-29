<%--
  Created by IntelliJ IDEA.
  User: ANPHATPC
  Date: 20/05/2024
  Time: 22:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Fruittables-Shop</title>
<body>
<!-- Modal Search Start -->
<div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content rounded-0">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-75 mx-auto d-flex">
                    <input type="search" class="form-control p-3" placeholder="keywords"
                           aria-describedby="search-icon-1">
                    <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Search End -->


<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">Shop</h1>
    <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Pages</a></li>
        <li class="breadcrumb-item active text-white">Shop</li>
    </ol>
</div>
<!-- Single Page Header End -->


<!-- Fruits Shop Start-->
<div class="container-fluid fruite py-5">
    <div class="container py-5">
        <h1 class="mb-4">Fresh fruits shop</h1>
        <div class="row g-4">
            <div class="col-lg-12">
                <div class="row g-4">
                    <div class="col-xl-3">
                        <div class="input-group w-100 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords"
                                   aria-describedby="search-icon-1">
                            <span class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                    </div>
                    <div class="col-6"></div>
                    <div class="col-xl-3">
                        <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                            <label for="fruits">Default Sorting:</label>
                            <select id="fruits" name="fruitlist" class="border-0 form-select-sm bg-light me-3"
                                    form="fruitform">
                                <option value="volvo">Nothing</option>
                                <option value="saab">Popularity</option>
                                <option value="opel">Organic</option>
                                <option value="audi">Fantastic</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row g-4">
                    <div class="col-lg-3">
                        <div class="row g-4">
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <h4>Categories</h4>
                                    <ul class="list-unstyled fruite-categorie">
                                        <c:forEach var="item" items="${categories}">
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="#"><i class="fas fa-apple-alt me-2"></i>${item.cateName}
                                                    </a>

                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
<%--                            COMMENT THANH CHINH GIA--%>
<%--                            <div class="col-lg-12">--%>
<%--                                <div class="mb-3">--%>
<%--                                    <h4 class="mb-2">Price</h4>--%>
<%--                                    <input type="range" class="form-range w-100" id="rangeInput" name="rangeInput"--%>
<%--                                           min="0" max="500" value="0" oninput="amount.value=rangeInput.value">--%>
<%--                                    <output id="amount" name="amount" min-velue="0" max-value="500" for="rangeInput">0--%>
<%--                                    </output>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <h4>Additional</h4>
                                    <div class="mb-2">
                                        <input type="radio" class="me-2" id="Categories-1" name="Categories-1"
                                               value="Beverages">
                                        <label for="Categories-1"> Organic</label>
                                    </div>
                                    <div class="mb-2">
                                        <input type="radio" class="me-2" id="Categories-2" name="Categories-1"
                                               value="Beverages">
                                        <label for="Categories-2"> Fresh</label>
                                    </div>
                                    <div class="mb-2">
                                        <input type="radio" class="me-2" id="Categories-3" name="Categories-1"
                                               value="Beverages">
                                        <label for="Categories-3"> Sales</label>
                                    </div>
                                    <div class="mb-2">
                                        <input type="radio" class="me-2" id="Categories-4" name="Categories-1"
                                               value="Beverages">
                                        <label for="Categories-4"> Discount</label>
                                    </div>
                                    <div class="mb-2">
                                        <input type="radio" class="me-2" id="Categories-5" name="Categories-1"
                                               value="Beverages">
                                        <label for="Categories-5"> Expired</label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 result-hot">
<%--                                THIEU FEATURE SHOP--%>
                            </div>

                            <div class="col-lg-12">
                                <div class="position-relative">
                                    <img src="<c:url value="/resource/user/img/banner-fruits.jpg"/>"
                                         class="img-fluid w-100 rounded" alt="">
                                    <div class="position-absolute"
                                         style="top: 50%; right: 10px; transform: translateY(-50%);">
                                        <h3 class="text-secondary fw-bold">Fresh <br> Fruits <br> Banner</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="row g-4 justify-content-center">
                            <c:forEach var="item" items="${paginationProduct}">

                                <div class="col-md-6 col-lg-6 col-xl-4">
                                    <div class="rounded position-relative fruite-item">
                                        <div class="fruite-img">
                                            <img src="${pageContext.request.contextPath}/product/image/${item.productImg}" class="img-fluid w-100 rounded-top" alt="">
                                        </div>
                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                             style="top: 10px; left: 10px;">${item.cateName}</div>
                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                            <h4><a href="${pageContext.request.contextPath}/shop-detail/${item.productId}">${item.productName}</a></h4>
                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                <p class="text-dark fs-5 fw-bold mb-0">${item.productPrice} VND/KG</p><br>
                                                <a href="${pageContext.request.contextPath}/addCart/${item.productId}/1"
                                                   class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                        class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                                                    cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="col-12">
                                <div class="pagination d-flex justify-content-center mt-5">
                                    <c:forEach begin="1" end="${endPage}" var="index">
                                        <a href="${pageContext.request.contextPath}/shop/${index}">${index}</a>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {

        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/hot-products/3.html',
            success: function (data) {
                $('.result-hot').html(data);
            },
            error: function (XMLHttpResponse, textStatus, errorThrown) {
                XMLHttpResponse.toString();
            }
        });
    })


</script>
</body>

