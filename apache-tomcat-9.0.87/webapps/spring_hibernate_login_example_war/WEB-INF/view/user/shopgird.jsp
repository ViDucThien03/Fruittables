<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/1/2024
  Time: 10:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <title>Cửa hàng</title>

  <body>
  <section class="breadcrumb-section set-bg" data-setbg="<c:url value="/resource/user/img/breadcrumb.jpg"/> ">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="breadcrumb__text">
            <h2>OGANI SHOP</h2>
            <div class="breadcrumb__option">
              <a href="./index.html">Trang chủ</a>
              <span>Cửa hàng</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Product Section Begin -->
  <section class="product spad">
    <div class="container">
      <div class="row">
        <div class="col-lg-3 col-md-5">
          <div class="sidebar">
            <div class="sidebar__item">
              <div class="latest-product__text">
                <h4>Sản phẩm mới</h4>
                <div class="latest-product__slider owl-carousel">
                  <c:forEach var="lastestproduct" items="${lastestproduct}" varStatus="loopStatus">
                    <c:if test="${loopStatus.index % 3 == 0}">
                      <div class="latest-prdouct__slider__item">
                    </c:if>

                    <a href="<c:url value="/shop-detail/${lastestproduct.productid}"/>" class="latest-product__item">
                      <div class="latest-product__item__pic">
                        <img src="<c:url value='/resource/user/img/product/${lastestproduct.image}'/>" alt="">
                      </div>
                      <div class="latest-product__item__text">
                        <h6>${lastestproduct.productName}</h6>
                        <span>$${lastestproduct.price}</span>
                      </div>
                    </a>

                    <c:if test="${loopStatus.index % 3 == 2 or loopStatus.last}">
                      </div>
                    </c:if>
                  </c:forEach>
                </div>
              </div>
            </div>
          </div>

        </div>
        <div class="col-lg-9 col-md-7">
          <div class="product__discount">
            <div class="section-title product__discount__title">
              <h2>Giảm giá</h2>
            </div>
            <div class="row">
              <div class="product__discount__slider owl-carousel">
                <c:forEach var="sale" items="${saleproduct}" varStatus="status">
                <div class="col-lg-4">
                  <div class="product__discount__item">
                    <div class="product__discount__item__pic set-bg"
                         data-setbg="<c:url value="/resource/user/img/product/${sale.image}"/> ">
                      <div class="product__discount__percent">-${sale.sale}%</div>
                      <ul class="product__item__pic__hover">
                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                      </ul>
                    </div>
                    <div class="product__discount__item__text">
                      <span>Dried Fruit</span>
                      <h5><a href="<c:url value="/shop-detail/${sale.productid}"/>">${sale.productName}</a></h5>
                      <div class="product__item__price">$30.00 <span>$${sale.price}</span></div>
                    </div>
                  </div>
                </div>
                </c:forEach>
              </div>
            </div>
          </div>
          <div class="section-title from-blog__title">
            <h2>Tất cả sản phẩm</h2>
          </div>
          <div class="row">
            <c:forEach var="all" items="${allproduct}">
            <div class="col-lg-4 col-md-6 col-sm-6">
              <div class="product__item">
                <div class="product__item__pic set-bg" data-setbg="<c:url value="/resource/user/img/product/${all.image}"/>">
                  <ul class="product__item__pic__hover">
                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                  </ul>
                </div>
                <div class="product__item__text">
                  <h6><a href="<c:url value="/shop-detail/${all.productid}"/>">${all.productName}</a></h6>
                  <h5>$${all.price}</h5>
                </div>
              </div>
            </div>
            </c:forEach>

          </div>
          <div class="product__pagination">
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#"><i class="fa fa-long-arrow-right"></i></a>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Product Section End -->

  </body>

