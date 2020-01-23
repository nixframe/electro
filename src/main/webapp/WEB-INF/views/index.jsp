<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <c:import url="/WEB-INF/views/parts/head.jsp"/>
</head>

<body class="text-center">
<div class="d-flex w-100 h-100 p-3 mx-auto flex-column">

    <c:import url="/WEB-INF/views/parts/header.jsp"/>

    <main role="main" class="inner cover">
        <div class="row">
            <c:import url="/WEB-INF/views/parts/nav.jsp"/>
            <%--MAIN DIV--%>
            <div class="col-lg-5">
                <c:forEach items="${sampleProducts}" var="product">

                    <div class="col-md-5">
                        <div class="card h-50">
                            <a href="<c:url value="/product/${product.id}"/>" class="thumbnail">
                                <img class="card-img-top thumbnail" src="${product.picture}" alt="${product.displayName}">
                            </a>
                            <div class="card-body">
                                <h4 class="card-title">
                                    <a href="<c:url value="/product/${product.id}"/>">
                                        <c:out value="${product.displayName}"/>
                                    </a>
                                </h4>
                                <div class="row">
                                    <div class="col-6"><h5><c:out value="${product.price}"/></h5></div>
                                    <div class="col-6">
                                        <a href="<c:url value="/cart/add?id=${product.id}"/>" class="btn btn-primary btn-sm" role="button">
                                            Add to cart
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <small class="text-muted"><c:choose>
                                    <c:when test="${product.rating < 1}">&#9734; &#9734; &#9734; &#9734; &#9734;</c:when>
                                    <c:when test="${product.rating < 2}">&#9733; &#9734; &#9734; &#9734; &#9734;</c:when>
                                    <c:when test="${product.rating < 3}">&#9733; &#9733; &#9734; &#9734; &#9734;</c:when>
                                    <c:when test="${product.rating < 4}">&#9733; &#9733; &#9733; &#9734; &#9734;</c:when>
                                    <c:when test="${product.rating < 5}">&#9733; &#9733; &#9733; &#9733; &#9734;</c:when>
                                    <c:otherwise>&#9733; &#9733; &#9733; &#9733; &#9733;</c:otherwise>
                                </c:choose></small>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </main>

    <c:import url="/WEB-INF/views/parts/foot.jsp"/>

</div>
</body>
</html>

