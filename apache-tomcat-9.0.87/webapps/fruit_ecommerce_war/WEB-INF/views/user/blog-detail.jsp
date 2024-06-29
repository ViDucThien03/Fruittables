<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/1/2024
  Time: 10:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<body>
<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">Blog</h1>
    <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Pages</a></li>
        <li class="breadcrumb-item active text-white">Blog</li>
    </ol>
</div>
<!-- Single Page Header End -->

<!-- Blog Details Section Begin -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <section class="blog-details spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-5 order-md-1 order-2">
                        <div class="blog__sidebar">
                            <div class="blog__sidebar__search">
                                <form action="#">
                                    <input type="text" placeholder="Search...">
                                    <button type="submit"><span class="icon_search"></span></button>
                                </form>
                            </div>
                            <div class="blog__sidebar__item">
                                <h4>Categories</h4>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/blog/1">All</a></li>
                                    <c:forEach var="categoryBlog" items="${blogTypes}">
                                        <li><a href="${pageContext.request.contextPath}/blog-type/${categoryBlog.id}/1">${ categoryBlog.typeName }</a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="blog__sidebar__item">
                                <h4>Recent News</h4>
                                <div class="blog__sidebar__recent">
                                    <c:forEach var="itemBoxNew" items="${blogdetailsnew}">
                                        <a href="${pageContext.request.contextPath}/blog-detail/${itemBoxNew.id}" class="blog__sidebar__recent__item">
                                            <div class="blog__sidebar__recent__item__pic">
                                                <img style="height: 70px; width: 70px" src="<c:url value="/resource/user/img/blog/${itemBoxNew.blogImg}"/>" alt="">
                                            </div>
                                            <div class="blog__sidebar__recent__item__text">
                                                <h6>${itemBoxNew.title}</h6>
                                                <span>${itemBoxNew.createdAt}</span>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-7 order-md-1 order-1">
                        <c:forEach var="itemBlogDetails" items="${blogByID}">
                        <div class="blog__details__text">
                            <h3>${itemBlogDetails.title}</h3>
                            <img src="<c:url value="/resource/user/img/blog/${itemBlogDetails.blogImg}"/>"  alt="">
                            <p>${itemBlogDetails.content}</p>
                        </div>
                        </c:forEach>
                        <div class="blog__details__content">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="blog__details__author">
                                        <div class="blog__details__author__pic">
                                            <img src="<c:url value="/resource/user/img/avatar.jpg" />" alt="">
                                        </div>
                                        <div class="blog__details__author__text">
                                            <h6>Michael Scofield</h6>
                                            <span>Admin</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="blog__details__widget">
                                        <ul>
                                            <c:forEach var="categoryBlogType" items="${blogTypesByID}">
                                                <li><span>Categories:</span>${categoryBlogType.typeName}</li>
                                            </c:forEach>
<%--                                            <li><span>Tags:</span> All, Trending, Cooking, Healthy Food, Life Style</li>--%>
                                        </ul>
<%--                                        <div class="blog__details__social">--%>
<%--                                            <a href="#"><i class="fa fa-facebook"></i></a>--%>
<%--                                            <a href="#"><i class="fa fa-twitter"></i></a>--%>
<%--                                            <a href="#"><i class="fa fa-google-plus"></i></a>--%>
<%--                                            <a href="#"><i class="fa fa-linkedin"></i></a>--%>
<%--                                            <a href="#"><i class="fa fa-envelope"></i></a>--%>
<%--                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<!-- Blog Details Section End -->

<!-- Related Blog Section Begin -->
<section class="related-blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title related-blog-title">
                    <h2>Post You May Like</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <c:forEach var="item" items="${blogDetailsByBlogTypeID}">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="<c:url value="/resource/user/img/blog/${item.blogImg}"/>" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i>${item.createdAt}</li>
                            </ul>
                            <h5><a href="${pageContext.request.contextPath}/blog-detail/${item.id}">${item.title}</a></h5>
                            <p>${item.description}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- Related Blog Section End -->
</body>
