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
                <h1 class="my-3">Admin panel</h1>

                <div class="list">
                    <a href="<c:url value="/admin/users"/>" class="list-group-item">
                        Products
                    </a>
                    <a href="<c:url value="/admin/products"/>" class="list-group-item">
                        Orders
                    </a>
                    <a href="<c:url value="/admin/orders"/>" class="list-group-item">
                        Users
                    </a>
                </div>

            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<c:import url="/WEB-INF/views/parts/foot.jsp"/>

</body>
</html>

