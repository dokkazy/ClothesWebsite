
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/plugins/fontawesome-free/css/all.min.css">
        <!-- icheck bootstrap -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/dist/css/adminlte.min.css">
    </head>
    <body class="hold-transition login-page">
        <div class="login-box">
            <!-- /.login-logo -->
            <div class="card card-outline card-primary">
                <div class="card-header text-center">
                    <a href="login.jsp" class="h1">Login</a>
                </div>
                <div class="card-body">

                    <c:if test="${(requestScope.ERROR!=null)}">
                        <div class="alert alert-danger" role="alert">
                            ${requestScope.ERROR}
                        </div>
                    </c:if>
                    <c:if test="${(requestScope.SUCCESS!=null)}">
                        <div class="alert alert-success" role="alert">
                            ${requestScope.SUCCESS}
                        </div>
                    </c:if>
                    <c:set var="cookie" value="${pageContext.request.cookies}"/>
                    <form action="${pageContext.request.contextPath}/LoginController?action=login" method="post">
                        <div class="input-group mb-3">
                            <c:if test="${(requestScope.ERROR == null)}">
                                <input type="text" name="user" value="${cookie.cUser.value}" class="form-control" placeholder="Username" required="">
                            </c:if>
                            <c:if test="${(requestScope.ERROR != null)}">
                                <input type="text" name="user" value="${requestScope.user}" class="form-control" placeholder="Username" required="">
                            </c:if>

                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <c:if test="${(requestScope.ERROR == null)}">
                                <input type="password" name="pass" value="${cookie.cPass.value}" class="form-control" placeholder="Username" required="">
                            </c:if>
                            <c:if test="${(requestScope.ERROR != null)}">
                                <input type="password" name="pass" value="${requestScope.pass}" class="form-control" placeholder="Password" required="">
                            </c:if>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="icheck-primary">
                                    <input ${(cookie.cRem!=null?'checked':'')} name="remember" value="ON" type="checkbox" id="remember">
                                    <label for="remember">
                                        Remember Me
                                    </label>
                                </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-4">
                                <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>

                    <p class="mb-0">
                        <a href="register.jsp" class="text-center">Register a new membership</a>
                    </p>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
        <!-- /.login-box -->

        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/assets/admin/plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="${pageContext.request.contextPath}/assets/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath}/assets/admin/dist/js/adminlte.min.js"></script>
    </body>
</html>
