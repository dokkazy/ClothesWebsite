<%-- 
    Document   : profile
    Created on : Aug 9, 2023, 11:09:49 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<mt:admin_template title="Profile">
    <jsp:attribute name="content">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Profile</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Home</a></li>
                            <li class="breadcrumb-item active">Profile</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-6">
                        <!-- general form elements -->
                        <c:if test="${(requestScope.ERROR!=null)}">
                            <div class="alert alert-danger" role="alert">
                                ${requestScope.ERROR}
                            </div>
                        </c:if>
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Edit Profile</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form method="post" action="${pageContext.request.contextPath}/admin/login?action=profile">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="username">Username</label>
                                        <input type="text" value="${requestScope.account.username}" class="form-control" id="username" name="username" readonly=""/>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" class="form-control" id="password" name="password">
                                    </div>
                                    <div class="form-group">
                                        <label for="re-password">Retype password</label>
                                        <input type="password" class="form-control" id="re-password" name="rePassword">
                                    </div>
                                    <!--                                    <div class="form-check">
                                                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                                                            <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                                                        </div>-->
                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /.card -->


                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </jsp:attribute>
</mt:admin_template>
