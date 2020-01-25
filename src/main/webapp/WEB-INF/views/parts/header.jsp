<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="<c:url value="/"/>">SpringBoot demo project</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <sec:authorize access="!isAuthenticated()">
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="<c:url value="/"/>">
                            <button type="button" class="btn btn-sm btn-outline-light">Home page</button>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/login"/>">
                            <button type="button" class="btn btn-sm btn-outline-light">Log in</button>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/register"/>">
                            <button type="button" class="btn btn-sm btn-outline-light">Register</button>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/cart/"/>">
                            <button type="button" class="btn btn-sm btn-outline-light">Cart</button>
                        </a>
                    </li>
                </ul>
            </div>
        </sec:authorize>

        <sec:authorize access="isAuthenticated()">
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link">Welcome
                            <c:if test="${sessionScope.name != null}">
                                ${sessionScope.name}
                            </c:if>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/"/>">
                            <button type="button" class="btn btn-sm btn-outline-light">Home page</button>
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/user/"/>">
                            <button type="button" class="btn btn-sm btn-outline-light">User panel</button>
                        </a>
                    </li>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/admin/"/>">
                                <button type="button" class="btn btn-sm btn-outline-light">Admin panel</button>
                            </a>
                        </li>
                    </sec:authorize>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/cart/"/>">
                            <button type="button" class="btn btn-sm btn-outline-light">Cart</button>
                        </a>
                    </li>
                    <li class="nav-item">
                        <form:form id="logoutForm" action="/logout" method="post">
                            <a class="nav-link">
                                <button type="submit" class="btn btn-sm btn-outline-light">Log out</button>
                            </a>
                        </form:form>
                    </li>
                </ul>
            </div>
        </sec:authorize>
    </div>
</nav>
