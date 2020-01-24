<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                <h1 class="my-3">
                    Edit your password
                </h1>
                <c:if test="${not empty error}">
                    <div class="form-group" style="color: red;">${error}</div>
                </c:if>
                <form:form method="post">
                    Present password: <input name="presentPassword" type="password"/>
                    <br/>
                    New password: <input name="newPassword0" type="password"/>
                    <br/>
                    Repeat: <input name="newPassword1" type="password"/>
                    <br/>
                    <input class="btn btn-sm btn-primary" type="submit" value="Save changes">
                </form:form>

            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<c:import url="/WEB-INF/views/parts/foot.jsp"/>

</body>
</html>

