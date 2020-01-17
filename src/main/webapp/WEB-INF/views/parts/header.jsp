<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="masthead mb-auto">
    <div class="inner">
        <a class="nav-link" href="<c:url value="/"/>">
            <h3 class="masthead-brand">Electro shop demo</h3>
        </a>
        <sec:authorize access="!isAuthenticated()">
            <nav class="nav nav-masthead justify-content-center">
                <a class="nav-link" href="<c:url value="/login"/>">
                    <button type="button" class="btn btn-secondary">Login</button>
                </a>

                <a class="nav-link" href="<c:url value="/register"/>">
                    <button type="button" class="btn btn-secondary">Register</button>
                </a>

                <a class="nav-link" href="<c:url value="/cart"/>">
                    <button type="button" class="btn btn-secondary">Cart</button>
                </a>
            </nav>
        </sec:authorize>

        <sec:authorize access="isAuthenticated()">
            <nav class="nav nav-masthead justify-content-center">
                <a class="nav-link">Welcome
                    <c:if test="${sessionScope.name != null}">
                        ${sessionScope.name}
                    </c:if>
                </a>

                <a class="nav-link" href="<c:url value="/cart"/>">
                    <button type="button" class="btn btn-secondary">Cart</button>
                </a>

                <a class="nav-link" href="<c:url value="/user/panel"/>">
                    <button type="button" class="btn btn-secondary">User panel</button>
                </a>

                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <a class="nav-link" href="<c:url value="/admin"/>">
                        <button type="button" class="btn btn-secondary">Admin panel</button>
                    </a>
                </sec:authorize>

                <form:form action="/logout" method="post" cssClass="d-inline">
                    <button type="submit" class="btn btn-secondary">Logout</button>
                </form:form>
            </nav>
        </sec:authorize>
    </div>
</header>
