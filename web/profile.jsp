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
        <link href="css/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container" style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                <h1 style="text-align: center">Profile</h1>

                <div class="row">

                    <form style="width: 400px;" method="post" action="Profile">
                        <input type="hidden" name="id" value="${c.id}" >
                    <label>Name: </label>
                    <input type="text" name="name" maxlength="50" value="${c.name}" class="form-control"/>
                    <label>Address: </label>
                    <input type="text" name="address" maxlength="200" value="${c.address}" class="form-control"/>
                    <label>Phone: </label>
                    <input type="text" name="phone" maxlength="10" value="${c.phone}" class="form-control"/>
                    <label>Email: </label>
                    <input type="text" name="email" maxlength="50" value="${c.email}" class="form-control"/>
                    <label>Date of birth: </label>
                    <input type="date" name="dob" value="${c.dob}" class="form-control"/>
                    <input type="hidden" name="username" value="${c.username}" />
                    <button class="btn btn-primary" style="margin-top: 8px;">Save</button>
                </form>
            </div>
        </div>


        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>

