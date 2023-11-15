<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="/css/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>

        <c:if test="${not empty sessionScope.cart.items}">
            <div class="container" style="padding: 10px;">
                <h1>Your cart!</h1>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Id</th>
                            <th>Name</th>
                            <th>-</th>
                            <th>Quantity</th>
                            <th>+</th>
                            <th>Price</th>
                            <th>Total</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="ca" items="${sessionScope.cart.items}">
                            <tr>
                                <td>
                                    <img width="80px" height="80px" src="${pageContext.request.contextPath}/${ca.product.image}">
                                </td>
                                <td>${ca.product.id}</td>
                                <td>${ca.product.name}</td>
                                <td><a style="color: gray;font-size: 20px;" href="ChangeQuantityCartItem?quantity=${ca.quantity-1}&pid=${ca.product.id}">-</a></td>
                                <td>${ca.quantity}</td>
                                <td><a style="color: gray;font-size: 20px;" href="ChangeQuantityCartItem?quantity=${ca.quantity+1}&pid=${ca.product.id}">+</a></td>
                                <td>${ca.product.price} $</td>
                                <td>${ca.product.price * ca.quantity} $</td>
                                <td><a href="DeleteCartItem?pid=${ca.product.id}" style="color: red;font-size: 20px;"><i class="fa fa-trash" aria-hidden="true"></i></a></td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <h2>Total: ${sessionScope.cart.getTotalMoney()}$</h2>
            </div>
        </c:if>
        <c:if test="${empty sessionScope.cart.items}">
            <div class="alert alert-danger" role="alert">
                Your Shopping Cart is null
            </div>
        </c:if>
    </body>
</html>

