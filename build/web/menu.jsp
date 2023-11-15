<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="HomeController">Clothes</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">

                <c:if test="${(sessionScope.acc != null) && (sessionScope.username_admin == null)}">

                    <li class="nav-item">
                        <a class="nav-link" href="Profile">Hello ${sessionScope.acc.username}</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutController">Logout</a>
                    </li>
                </c:if>
                <c:if test="${(sessionScope.acc != null) && (sessionScope.username_admin != null)}">

                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">Hello ${sessionScope.acc.username}</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutController">Logout</a>
                    </li>
                </c:if>

                <c:if test="${(sessionScope.acc == null)}">
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                </c:if>
            </ul>

            <form action="search" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input name="txt" type="text" value="${requestScope.txtSearch}" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>

                <c:if test="${(sessionScope.acc != null)}">
                    <a class="btn btn-success btn-sm ml-3" href="ViewCart">
                        <i class="fa fa-shopping-cart"></i> Cart
                        <span class="badge badge-light"></span>
                    </a>
                </c:if>
            </form>

        </div>
    </div>
</nav>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">Siêu thị áo chất lượng cao</h1>
        <p class="lead text-muted mb-0">Uy tín tạo nên thương hiệu với hơn 10 năm cung cấp các sản phầm áo nhập từ Việt Nam</p>
    </div>
</section>
<!--end of menu-->