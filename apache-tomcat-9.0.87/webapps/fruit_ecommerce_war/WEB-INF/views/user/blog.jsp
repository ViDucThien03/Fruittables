<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/2/2024
  Time: 9:06 PM
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

<!-- Blog Section Begin -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <section class="blog spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-5">
                        <div class="blog__sidebar ">
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
                    <div class="col-lg-8 col-md-7">
                        <div class="row">
                            <c:forEach var="itemBox" items="${paginationBlog}">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="blog__item">
                                    <div class="blog__item__pic">
                                        <img src="<c:url value="/resource/user/img/blog/${itemBox.blogImg}"/>" alt="">
                                    </div>
                                    <div class="blog__item__text">
                                        <ul>
                                            <li><i class="fa fa-calendar-o"></i> ${itemBox.createdAt}</li>
<%--                                            <li><i class="fa fa-comment-o"></i> 5</li>--%>
                                        </ul>

                                        <h5><a href="${pageContext.request.contextPath}/blog-detail/${itemBox.id}">${itemBox.title}</a></h5>
                                        <p>${itemBox.description}</p>

                                    </div>
                                </div>
                            </div>

                            </c:forEach>

                            <div class="col-lg-12">
                                <div class="product__pagination blog__pagination">
                                    <c:forEach begin="1" end="${endPage}" var="index">

                                        <a href="${pageContext.request.contextPath}/blog/${index}">${index}</a>

                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<!-- Blog Section End -->

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

</body>

