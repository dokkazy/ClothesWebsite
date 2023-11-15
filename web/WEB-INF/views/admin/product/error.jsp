<%-- 
    Document   : profile
    Created on : Aug 9, 2023, 11:09:49 AM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:admin_template title="Error page">
    <jsp:attribute name="content">
        <div class="main" style="display: flex; align-items: center; justify-content: center">
            <section class="col-main" style="min-height: 665px">
                <h1 style="font-size: 35px;">ERROR PAGE</h1>
                <h2>
                    <p color="red" style="font-size: 35px;">
                    ${requestScope.ERROR}
                    </p>
                </h2>
                <a href="${pageContext.request.contextPath}/admin/login?action=logout">Back to Login Page</a>
        </div>
    </jsp:attribute>
</mt:admin_template>