<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
        <ul class="list-group category_block">
            <c:forEach items="${requestScope.clist}" var="c">
                <li class="list-group-item text-white ${requestScope.tag == c.id ? "active":""}"><a href="CategoryController?cid=${c.id}">${c.name}</a></li>
                </c:forEach>

        </ul>
    </div>
    <div class="card bg-light mb-3">
        <div class="card-header bg-success text-white text-uppercase">New product</div>
        <div class="card-body">
            <c:set var="p" value="${requestScope.lastP}"/>
            <img class="img-fluid" src="${p.image}" />
            <h5 class="card-title">${p.name}</h5>
            <p class="card-text">${p.description}</p>
            <p class="bloc_left_price">
                <c:set var="price" value="${p.price}"/>
                <fmt:setLocale value="en_US"/>
                <fmt:formatNumber value="${price}" type="currency"/>
            </p>
        </div>
    </div>
</div>
