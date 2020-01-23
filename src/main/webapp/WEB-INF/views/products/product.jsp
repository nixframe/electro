<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <c:import url="/WEB-INF/views/parts/head.jsp"/>
</head>
<body>
<div class="wrapper fadeInDown">
    <div id="formContent">
        <c:import url="/WEB-INF/views/parts/nav.jsp"/>
        <div class="col-lg-10">

            <div class="card mt-4">
                <img class="card-img-top img-fluid" src="${product.image}" alt="">
                <div class="row">
                    <div class="card-body col-8">
                        <h3 class="card-title"><c:out value="${product.fullName}"/></h3>
                        <h4><c:out value="${product.price}"/> zł</h4>
                        <p class="card-text"><c:out value="${product.description}"/></p>

                        <span class="text-warning"><c:choose>
                            <c:when test="${product.rating < 1}">&#9734; &#9734; &#9734; &#9734; &#9734;</c:when>
                            <c:when test="${product.rating < 2}">&#9733; &#9734; &#9734; &#9734; &#9734;</c:when>
                            <c:when test="${product.rating < 3}">&#9733; &#9733; &#9734; &#9734; &#9734;</c:when>
                            <c:when test="${product.rating < 4}">&#9733; &#9733; &#9733; &#9734; &#9734;</c:when>
                            <c:when test="${product.rating < 5}">&#9733; &#9733; &#9733; &#9733; &#9734;</c:when>
                            <c:otherwise>&#9733; &#9733; &#9733; &#9733; &#9733;</c:otherwise>
                        </c:choose></span>
                    </div>
                    <div class="card-body col-4">
                        <p class="card-text">Dostępność: <c:out value="${product.quantity}"/> szt.</p>
                        <a href="<c:url value="/cart/add?id=${product.id}"/>" class="btn btn-primary btn-lg active"
                           role="button" aria-pressed="true">Dodaj do koszyka</a>
                    </div>
                </div>
            </div>

            <div class="card card-outline-secondary my-4">
                <div class="card-header">
                    Recenzje użytkowników
                </div>
                <div class="card-body">
                    <c:forEach items="${product.reviews}" var="review">
                        <p><c:out value="${review.content}"/></p>
                        <small class="text-muted">Dodano przez: <c:out value="${review.author}"/>, dnia: <c:out
                                value="${review.created.toLocalDate()}"/></small>
                        <hr>
                    </c:forEach>
                    <a href="<c:url value="/product/review/add?productId=${product.id}"/>" class="btn btn-success">Dodaj
                        recenzję</a>
                </div>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/parts/foot.jsp"/>

</body>
</html>