<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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

            <div class="col">

                <h1 class="my-3">User list</h1>

                <table class="table table-sm thead-light table-striped">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">User Id</th>
                        <th scope="col">Email</th>
                        <th scope="col">First name</th>
                        <th scope="col">Last name</th>
                        <th scope="col">Status</th>
                        <th scope="col">Delivery adres</th>
                        <sec:authorize access="hasRole('ROLE_SUPER')">
                            <th scope="col">Roles</th>
                            <th scope="col">&#9881;</th>
                        </sec:authorize>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${userList}" var="user" varStatus="u">
                        <tr>
                            <td>${u.index + 1}</td>
                            <td>${user.id}</td>
                            <td>${user.email}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>
                                <c:if test="${user.enabled == true}">
                                    active
                                </c:if>
                                <c:if test="${user.enabled == false}">
                                    not active
                                </c:if>
                            </td>
                            <td>
                                <a href="<c:url value="/admin/user/adres?id=${user.id}"/>">
                                    <button class="btn btn-sm btn-primary">show</button>
                                </a>
                            </td>
                            <sec:authorize access="hasRole('ROLE_SUPER')">
                                <td>
                                    <a href="<c:url value="/admin/user/role?userId=${user.id}"/>">
                                        <button class="btn btn-sm btn-primary">show</button>
                                    </a>
                                </td>
                                <td scope="row">
                                    <a href="<c:url value="/admin/user/delete?userId=${user.id}"/>">
                                        <button class="btn btn-sm btn-primary">delete</button>
                                    </a>
                                    <c:if test="${user.enabled == true}">
                                        <a href="<c:url value="/admin/user/deactivate?userId=${user.id}"/>">
                                            <button class="btn btn-sm btn-primary">deactivate</button>
                                        </a>
                                    </c:if>
                                    <c:if test="${user.enabled == false}">
                                        <a href="<c:url value="/admin/user/activate?id=${user.id}"/>">
                                            <button class="btn btn-sm btn-primary">activate</button>
                                        </a>
                                    </c:if>
                                </td>
                            </sec:authorize>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<c:import url="/WEB-INF/views/parts/foot.jsp"/>

</body>
</html>

