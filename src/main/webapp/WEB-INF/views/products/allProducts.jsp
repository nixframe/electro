<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <c:import url="/WEB-INF/views/parts/head.jsp"/>
</head>

<body>

<!-- Header -->
<c:import url="/WEB-INF/views/parts/header.jsp"/>

<!-- Page Content -->
<div class="container">

    <div class="row">
        <!-- Navigation Bar -->
        <c:import url="/WEB-INF/views/parts/nav.jsp"/>

        <div class="col-lg-9">
            <div class="row">
                <c:forEach items="${products}" var="product">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card h-100">
                            <a href="<c:url value="/prod/${product.id}"/>">
                                <img class="card-img-top"
                                     src="${product.picture}"
                                     alt="${product.displayName}">
                            </a>
                            <div class="card-body">
                                <h4 class="card-title">
                                    <a href="<c:url value="/prod/${product.id}"/>">
                                        <c:out value="${product.displayName}"/>
                                    </a>
                                </h4>
                                <div class="row">
                                    <div class="col">
                                        <h5>
                                            <c:out value="${product.price}"/>
                                        </h5>
                                        <p class="card-text">
                                            In stock <c:out value="${product.quantity}"/>
                                        </p>
                                    </div>
                                    <div class="col">
                                        <a href="<c:url value="/cart/add?id=${product.id}"/>"
                                           class="btn btn-primary btn-sm" role="button">
                                            Add to cart
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <small class="text-muted">
                                    <c:choose>
                                        <c:when test="${product.rating < 1}">
                                            &#9734; &#9734; &#9734; &#9734; &#9734;
                                        </c:when>
                                        <c:when test="${product.rating < 2}">
                                            &#9733; &#9734; &#9734; &#9734; &#9734;
                                        </c:when>
                                        <c:when test="${product.rating < 3}">
                                            &#9733; &#9733; &#9734; &#9734; &#9734;
                                        </c:when>
                                        <c:when test="${product.rating < 4}">
                                            &#9733; &#9733; &#9733; &#9734; &#9734;
                                        </c:when>
                                        <c:when test="${product.rating < 5}">
                                            &#9733; &#9733; &#9733; &#9733; &#9734;
                                        </c:when>

                                        <c:otherwise>
                                            &#9733; &#9733; &#9733; &#9733; &#9733;
                                        </c:otherwise>
                                    </c:choose>
                                </small>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<c:import url="/WEB-INF/views/parts/foot.jsp"/>

</body>
</html>

