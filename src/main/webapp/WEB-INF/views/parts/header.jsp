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
                        <a class="nav-link" href="<c:url value="/"/>">Homepage
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/login"/>">Log in</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/register"/>">Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/cart/"/>">Cart</a>
                    </li>
                </ul>
            </div>
        </sec:authorize>

        <sec:authorize access="isAuthenticated()">
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li>
                        <a class="nav-link">Welcome
                            <c:if test="${sessionScope.name != null}">
                                ${sessionScope.name}
                            </c:if>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="<c:url value="/"/>">Homepage
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/login"/>">User panel</a>
                    </li>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/admin"/>">Admin panel</a>
                        </li>
                    </sec:authorize>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/cart/"/>">Cart</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/logout"/>">Log out</a>
                    </li>
                </ul>
            </div>
        </sec:authorize>
    </div>
</nav>


<%--<header class="masthead mb-auto">--%>
<%--    <div class="inner">--%>
<%--        <a class="nav-link" href="<c:url value="/"/>">--%>
<%--            <h3 class="masthead-brand">Electro shop demo</h3>--%>
<%--        </a>--%>
<%--        <sec:authorize access="!isAuthenticated()">--%>
<%--            <nav class="nav nav-masthead justify-content-center">--%>
<%--                <a class="nav-link" href="<c:url value="/login"/>">--%>
<%--                    <button type="button" class="btn btn-secondary">Login</button>--%>
<%--                </a>--%>

<%--                <a class="nav-link" href="<c:url value="/register"/>">--%>
<%--                    <button type="button" class="btn btn-secondary">Register</button>--%>
<%--                </a>--%>

<%--                <a class="nav-link" href="<c:url value="/cart/"/>">--%>
<%--                    <button type="button" class="btn btn-secondary">Cart</button>--%>
<%--                </a>--%>
<%--            </nav>--%>
<%--        </sec:authorize>--%>

<%--        <sec:authorize access="isAuthenticated()">--%>
<%--            <nav class="nav nav-masthead justify-content-center">--%>
<%--                <a class="nav-link">Welcome--%>
<%--                    <c:if test="${sessionScope.name != null}">--%>
<%--                        ${sessionScope.name}--%>
<%--                    </c:if>--%>
<%--                </a>--%>

<%--                <a class="nav-link" href="<c:url value="/cart"/>">--%>
<%--                    <button type="button" class="btn btn-secondary">Cart</button>--%>
<%--                </a>--%>

<%--                <a class="nav-link" href="<c:url value="/user/panel"/>">--%>
<%--                    <button type="button" class="btn btn-secondary">User panel</button>--%>
<%--                </a>--%>

<%--                <sec:authorize access="hasRole('ROLE_ADMIN')">--%>
<%--                    <a class="nav-link" href="<c:url value="/admin"/>">--%>
<%--                        <button type="button" class="btn btn-secondary">Admin panel</button>--%>
<%--                    </a>--%>
<%--                </sec:authorize>--%>

<%--                <form:form action="/logout" method="post" cssClass="d-inline">--%>
<%--                    <button type="submit" class="btn btn-secondary">Logout</button>--%>
<%--                </form:form>--%>
<%--            </nav>--%>
<%--        </sec:authorize>--%>
<%--    </div>--%>
<%--</header>--%>
