<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/4/2024
  Time: 8:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <title>Bài viết</title>

<body>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="<c:url value="/resource/user/img/breadcrumb.jpg"/> ">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Bài viết</h2>
                    <div class="breadcrumb__option">
                        <a href="<c:url value="/home"/> ">Trang chủ</a>
                        <span>Bài viết</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- Blog Section Begin -->
<section class="blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-5">
                <div class="blog__sidebar">
                    <div class="blog__sidebar__search">
                        <form action="#">
                            <input type="text" placeholder="Search...">
                            <button type="submit"><span class="icon_search"></span></button>
                        </form>
                    </div>
                    <div class="blog__sidebar__item">
                        <h4>Danh mục</h4>
                        <ul>
                            <li><a href="<c:url value="/blog"/> ">Tất cả</a></li>
                            <c:forEach  var="tag" items="${blogtag}">
                                <li><a href="<c:url value="blog/${tag.tagid}"/> ">${tag.tagName}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="blog__sidebar__item">
                        <h4>Tin tức gần đây</h4>
                        <div class="blog__sidebar__recent">
                            <c:forEach var="recent" items="${recentnews}">
                            <a href="#" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="<c:url value="/resource/user/img/blog/${recent.image}"/> " alt="" width="100" height="100">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <h6>${recent.title}</h6>
                                    <span>${recent.createDate}</span>
                                </div>
                            </a>
                            </c:forEach>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-lg-8 col-md-7">
                <div class="row">
                    <c:forEach var="blog" items="${blogdetail}">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="<c:url value="/resource/user/img/blog/${blog.image}"/> " alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> ${blog.createDate}</li>
                                </ul>
                                <h5><a href="<c:url value="/blogdetail/${blog.blogid}"/> ">${blog.title}</a></h5>
                                <p>${blog.description} </p>
                                <a href="#" class="blog__btn">ĐỌC THÊM<span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <div class="col-lg-12">
                        <div class="product__pagination blog__pagination">
                            <a href="#">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>

