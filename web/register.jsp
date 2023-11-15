<%-- 
    Document   : register.jsp
    Created on : Aug 20, 2023, 11:25:29 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
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
    <body class="hold-transition register-page">
        <div class="register-box">
            <div class="card card-outline card-primary">
                <div class="card-header text-center">
                    <a href="register.jsp" class="h1">Register</a>
                </div>
                <div class="card-body">
                    <c:if test="${(requestScope.ERROR!=null)}">
                        <div class="alert alert-danger" role="alert">
                            ${requestScope.ERROR}
                        </div>
                    </c:if>

                    <form action="RegisterController" method="post">
                        <div class="input-group mb-3">
                            <input name="user" value=""  type="text" class="form-control" placeholder="Username" required="">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                        <!--                        <div class="input-group mb-3">
                                                    <input type="email" class="form-control" placeholder="Email">
                                                    <div class="input-group-append">
                                                        <div class="input-group-text">
                                                            <span class="fas fa-envelope"></span>
                                                        </div>
                                                    </div>
                                                </div>-->
                        <div class="input-group mb-3">
                            <input name="pass" type="password" class="form-control" placeholder="Password" required="">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input name="repass" type="password" class="form-control" placeholder="Retype password" required="">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <!--                            <div class="col-8">
                                                            <div class="icheck-primary">
                                                                <input type="checkbox" id="agreeTerms" name="terms" value="agree">
                                                                <label for="agreeTerms">
                                                                    I agree to the <a href="#">terms</a>
                                                                </label>
                                                            </div>
                                                        </div>-->
                            <!-- /.col -->
                            <div class="col-4">
                                <button type="submit" class="btn btn-primary btn-block">Register</button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>



                    <a href="login.jsp" class="text-center">I already have a membership</a>
                </div>
                <!-- /.form-box -->
            </div><!-- /.card -->
        </div>
        <!-- /.register-box -->

        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/assets/admin/plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="${pageContext.request.contextPath}/assets/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath}/assets/admin/dist/js/adminlte.min.js"></script>
    </body>
</html>
