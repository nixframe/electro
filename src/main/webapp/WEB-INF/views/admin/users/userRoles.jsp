<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
                <h1 class="my-3">User roles</h1>

                <div class="list-group">
                    <c:forEach items="${user.roles}" var="role">
                        <label class="list-group-item">
                            <c:out value="${role.name}"/>
                            <a href="<c:url value="/admin/user/role/remove?userId=${user.id}&roleId=${role.id}"/>">
                                <button class="btn btn-primary">delete</button>
                            </a>
                        </label>
                    </c:forEach>
                    <label class="list-group-item">
                        <a href="<c:url value="/admin/user/role/add?userId=${user.id}"/>">
                            <button class="btn btn-primary">add</button>
                        </a>
                    </label>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<c:import url="/WEB-INF/views/parts/foot.jsp"/>

</body>
</html>

