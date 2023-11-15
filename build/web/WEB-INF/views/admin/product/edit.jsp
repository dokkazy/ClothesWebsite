<%-- 
    Document   : profile
    Created on : Aug 9, 2023, 11:09:49 AM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:admin_template title="Edit product">
    <jsp:attribute name="content">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Edit Product</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Home</a></li>
                            <li class="breadcrumb-item active">Edit-product</li>
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
                        <c:if test="${(requestScope.MESSAGE!=null)}">
                            <div class="alert alert-success" role="alert">
                                ${requestScope.MESSAGE}
                            </div>
                        </c:if>
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Edit Product</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form method="post" action="${pageContext.request.contextPath}/admin/product?action=edit" 
                                  enctype="multipart/form-data">
                                <c:set var="p" value="${requestScope.product}"/>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label>ID</label>
                                        <input name="txtId" value="${p.id}" type="text" class="form-control" readonly="">
                                    </div>
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input name="name" value="${p.name}" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Image</label>
                                        <input type="file" name="image" class="form-control">
                                        <input type="hidden" name="txtImage" value="${p.image}"/>
                                    </div>
                                    <p style="color: red">
                                        ${requestScope.INVALID.imageError}
                                    </p>
                                    <div class="form-group">
                                        <label>Quantity</label>
                                        <input name="quantity" value="${p.quantity}" type="number" class="form-control" required>
                                    </div>
                                    <p style="color: red">
                                        ${requestScope.INVALID.quantityError}
                                    </p>
                                    <div class="form-group">
                                        <label>Price</label>
                                        <input name="price" value="${p.price}" type="text" class="form-control" required>
                                    </div>
                                    <p style="color: red">
                                        ${requestScope.INVALID.priceError}
                                    </p>
                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea name="description" class="form-control" required>${p.description}</textarea>
                                    </div>

                                    <div class="form-group">
                                        <label>Category</label>
                                        <select name="category" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.clist}" var="c">
                                                <option value="${c.id}" ${p.cate.id == c.id ?"selected='selected'":"" }>${c.name}</option>
                                            </c:forEach>

                                        </select>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" name="status" ${p.status ? "checked='checked'" : ""} class="form-check-input" id="status">
                                        <label class="form-check-label" for="status">Status</label>
                                    </div>
                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer" style="text-align: center">
                                    <button style="width: 100%" type="submit" class="btn btn-primary">Edit</button>
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
