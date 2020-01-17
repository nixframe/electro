<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <c:import url="/WEB-INF/views/parts/head.jsp"/>
</head>

<body class="text-center">
<div class="d-flex w-100 h-100 p-3 mx-auto flex-column">

    <c:import url="/WEB-INF/views/parts/header.jsp"/>

    <main role="main" class="inner cover">
        <div class="row">
            <c:import url="/WEB-INF/views/parts/nav.jsp"/>
            <%--MAIN DIV--%>
            <div class="col-lg-5">
                <a href="<c:url value="/"/>">
                    <div class="card mt-4">
                        <h3>Access denied</h3>
                    </div>
                </a>
            </div>
        </div>
</div>
</main>

<c:import url="/WEB-INF/views/parts/foot.jsp"/>

</div>
</body>
</html>

