<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="HomeController">Home</a></li>
                            <li class="breadcrumb-item"><a href="HomeController ">Category</a></li>
                            <li class="breadcrumb-item active" aria-current="#">Sub-category</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <jsp:include page="leftnav.jsp"/>

                <div class="col-sm-9">
                    <div class="row">
                        <c:forEach items="${requestScope.plist}" var="p">
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <div>
                                        <a href="DetailController?pid=${p.id}" title="View Product"> 
                                            <img class="card-img-top" src="${p.image}" width="280px" height="280px" alt="Card image cap"></a>
                                    </div>
                                    <div class="card-body">

                                        <h4 class="card-title show_txt"><a href="DetailController?pid=${p.id}" title="View Product" style="font-size: 16px">${p.name}</a></h4>
                                        <p class="card-text show_txt"></p>
                                        <div class="column">
                                            <div class="col">
                                                <p class="btn btn-danger btn-block">
                                                    <c:set var="price" value="${p.price}"/>
                                                    <fmt:setLocale value="en_US"/>
                                                    <fmt:formatNumber value="${price}" type="currency"/>
                                               
                                                </p>
                                            </div>
                                            <div class="col">
                                                <a href="add-cart?quantity=1&pid=${p.id}" class="btn btn-success btn-block">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>

