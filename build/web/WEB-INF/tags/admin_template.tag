<%-- 
    Document   : admin_template
    Created on : Aug 7, 2023, 9:22:45 AM
    Author     : HP
--%>

<%@tag language="java" pageEncoding="UTF-8" isELIgnored="false"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="title" required="true" type="java.lang.String"%>
<%@attribute name="content" fragment="true"%>

<%-- any content can be specified here e.g.: --%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${title}</title>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/plugins/fontawesome-free/css/all.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Tempusdominus Bootstrap 4 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
        <!-- JQVMap -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/plugins/jqvmap/jqvmap.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/dist/css/adminlte.min.css">
        <!-- overlayScrollbars -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
        <!-- Daterange picker -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/plugins/daterangepicker/daterangepicker.css">
        <!-- summernote -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/plugins/summernote/summernote-bs4.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">

    </head>
    <body class="hold-transition sidebar-mini layout-fixed">
        <div class="wrapper">

            <!-- Preloader -->
            <div class="preloader flex-column justify-content-center align-items-center">
                <img class="animation__shake" src="${pageContext.request.contextPath}/assets/admin/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
            </div>

            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-link">Home</a>
                    </li>
                    <!-- Navbar Search -->
<!--                    <li class="nav-item">
                        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                            <i class="fas fa-search"></i>
                        </a>
                        <div class="navbar-search-block">
                            <form class="form-inline">
                                <div class="input-group input-group-sm">
                                    <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
                                    <div class="input-group-append">
                                        <button class="btn btn-navbar" type="submit">
                                            <i class="fas fa-search"></i>
                                        </button>
                                        <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>-->
                </ul>
            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="brand-link">
                    <img src="${pageContext.request.contextPath}/assets/admin/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
                    <span class="brand-text font-weight-light">AdminLTE 3</span>
                </a>

                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="image">
                            <img src="${pageContext.request.contextPath}/assets/admin/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
                        </div>
                        <div class="info">
                            <a href="${pageContext.request.contextPath}/admin/login?action=profile" class="d-block">${sessionScope.username_admin}</a>
                            <br/>
                            <a href="${pageContext.request.contextPath}/admin/login?action=logout" class="d-block">Log out</a>
                        </div>
                    </div>

                    <!-- SidebarSearch Form -->
<!--                    <div class="form-inline">
                        <div class="input-group" data-widget="sidebar-search">
                            <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                            <div class="input-group-append">
                                <button class="btn btn-sidebar">
                                    <i class="fas fa-search fa-fw"></i>
                                </button>
                            </div>
                        </div>
                    </div>-->

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <!-- Add icons to the links using the .nav-icon class
                                 with font-awesome or any other icon font library -->
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-edit"></i>
                                    <p>
                                        Category
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="${pageContext.request.contextPath}/admin/category?action=add" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Add</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="${pageContext.request.contextPath}/admin/category" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>List</p>
                                        </a>
                                    </li>

                                </ul>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-edit"></i>
                                    <p>
                                        Product
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="${pageContext.request.contextPath}/admin/product?action=add" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Add</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="${pageContext.request.contextPath}/admin/product" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>List</p>
                                        </a>
                                    </li>

                                </ul>
                            </li>

                        </ul>
                    </nav>


                    <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">

                <jsp:invoke fragment="content"></jsp:invoke>

                </div>
                <!-- /.content-wrapper -->
                <footer class="main-footer">
                    <strong>Copyright &copy; 2023 <a href="${pageContext.request.contextPath}/admin/dashboard">AdminLTE.io</a>.</strong>
                    All rights reserved.
                    <div class="float-right d-none d-sm-inline-block">
                        <b>Version</b> 3.2.0
                    </div>
                </footer>

                <!-- Control Sidebar -->
                <aside class="control-sidebar control-sidebar-dark">
                    <!-- Control sidebar content goes here -->
                </aside>
                <!-- /.control-sidebar -->
            </div>
            <!-- ./wrapper -->

            <!-- jQuery -->
            <script src="${pageContext.request.contextPath}/assets/admin/plugins/jquery/jquery.min.js"></script>
        <!-- jQuery UI 1.11.4 -->
        <script src="${pageContext.request.contextPath}/assets/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
        <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
        <script>
            $.widget.bridge('uibutton', $.ui.button)
        </script>
        <!-- Bootstrap 4 -->
        <script src="${pageContext.request.contextPath}/assets/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- ChartJS -->
        <script src="${pageContext.request.contextPath}/assets/admin/plugins/chart.js/Chart.min.js"></script>
        <!-- Sparkline -->
        <script src="${pageContext.request.contextPath}/assets/admin/plugins/sparklines/sparkline.js"></script>
        <!-- JQVMap -->
        <script src="${pageContext.request.contextPath}/assets/admin/plugins/jqvmap/jquery.vmap.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/admin/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
        <!-- jQuery Knob Chart -->
        <script src="${pageContext.request.contextPath}/assets/admin/plugins/jquery-knob/jquery.knob.min.js"></script>
        <!-- daterangepicker -->
        <script src="${pageContext.request.contextPath}/assets/admin/plugins/moment/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/admin/plugins/daterangepicker/daterangepicker.js"></script>
        <!-- Tempusdominus Bootstrap 4 -->
        <script src="${pageContext.request.contextPath}/assets/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
        <!-- Summernote -->
        <script src="${pageContext.request.contextPath}/assets/admin/plugins/summernote/summernote-bs4.min.js"></script>
        <!-- overlayScrollbars -->
        <script src="${pageContext.request.contextPath}/assets/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath}/assets/admin/dist/js/adminlte.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="${pageContext.request.contextPath}/assets/admin/${pageContext.request.contextPath}/assets/admin/dist/js/demo.js"></script>
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="${pageContext.request.contextPath}/assets/admin/dist/js/pages/dashboard.js"></script>
        <script src="${pageContext.request.contextPath}/assets/admin/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
        <script>
            $(function () {
                $('#example2').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "searching": true,
                    "ordering": true,
                    "info": true,
                    "autoWidth": false,
                    "responsive": true,
                });
            });
        </script>
    </body>
</html>
