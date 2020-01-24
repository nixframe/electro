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

            <%--MAIN DIV--%>
            <div class="col-lg-5">
                <a href="<c:url value="/"/>">
                    <div class="card mt-4">
                        <h3> Error 403 - Access denied</h3>
                    </div>
                </a>
            </div>
    </div>
</div>

<c:import url="/WEB-INF/views/parts/foot.jsp"/>

</body>
</html>

