<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <c:import url="/WEB-INF/views/parts/head.jsp"/>
</head>
<body>

<!-- Header -->
<c:import url="/WEB-INF/views/parts/header.jsp"/>

<!-- Page Content -->
<div class="container">
    <div class="login-form card-login row">
        <div class="card-body row justify-content-md-center">
            <form:form action="/login" method="post">
                <h2 class="text-center">Log in</h2>
                <p class="hint-text">
                    For your convenience here are some provided users: <br/>
                    user@user - asdasd<br/>
                    admin@admin - asdasd
                </p>
                <c:if test="${not empty error}">
                    <div class="form-group" style="color: red;">${error}</div>
                </c:if>

                <div class="form-group">
                    <input name="username" type="text" class="form-control" placeholder="Email" required="required">
                </div>
                <div class="form-group">
                    <input name="password" type="password" class="form-control" placeholder="Password" required="required">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Log in</button>
                </div>
                <div class="clearfix">
                    <label class="pull-left checkbox-inline"><input type="checkbox"> Remember me</label>
                    <br/>
                    <a href="" class="pull-right">Forgot Password?</a>
                </div>

                <p class="text-center"><a href="<c:url value="/register"/>">Create an Account</a></p>
            </form:form>

        </div>
    </div>
</div>


<!-- Footer -->
<c:import url="/WEB-INF/views/parts/foot.jsp"/>

</body>
</html>
