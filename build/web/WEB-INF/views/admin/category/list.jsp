<%-- 
    Document   : index
    Created on : Aug 7, 2023, 9:33:25 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<mt:admin_template title="Categories">
    <jsp:attribute name="content">

        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Categories</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Home</a></li>
                            <li class="breadcrumb-item active">Categories</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
<!--        <form class="form-inline" style="text-align: center; margin-bottom: 16px; padding-left: 7.5px ">
            <input class="form-control mr-sm-2" style="width: 25%" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" fdprocessedid="u14d1">Search</button>
        </form>-->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-12">

                        <div class="card">

                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="example2" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.categories}" var="cate">
                                            <tr>
                                                <td>${cate.id}</td>
                                                <td>${cate.name}</td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/admin/category?action=edit&cid=${cate.id}">
                                                        <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/admin/category?action=delete&cid=${cate.id}" onclick="return confirm('Confirm to remove')">
                                                        <i  class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                                    </a>
                                                </td>  
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->

    </jsp:attribute>
</mt:admin_template>

