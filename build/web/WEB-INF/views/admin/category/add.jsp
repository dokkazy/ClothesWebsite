<%-- 
    Document   : profile
    Created on : Aug 9, 2023, 11:09:49 AM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:admin_template title="Add category">
    <jsp:attribute name="content">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Add Category</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Home</a></li>
                            <li class="breadcrumb-item active">Add-category</li>
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
                    <div class="col-md">
                        <!-- general form elements -->
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
                        
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Add Category</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form method="post" action="${pageContext.request.contextPath}/admin/category?action=add">
                                <div class="card-body">
                                    <!--                                    <div class="form-group">
                                                                            <label for="cid">ID</label>
                                                                            <input type="number" class="form-control" name="cid" required=""/>
                                                                        </div>-->
                                    <div class="form-group">
                                        <label for="cname">Name</label>
                                        <input type="text" class="form-control" name="cname" required=""/>
                                    </div>
                                    <!--                                    <div class="form-check">
                                                                            <input type="checkbox" name="status" class="form-check-input" id="status">
                                                                            <label class="form-check-label" for="status">Check me out</label>
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
