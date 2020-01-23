<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <c:import url="/WEB-INF/views/parts/head.jsp"/>
</head>
<body>
<div class="wrapper fadeInDown">
    <div id="formContent">

        <div class="fadeIn first">
            <img src="/images/login.jpg" id="icon" alt="User Icon"/>
        </div>

        <c:if test="${not empty error}">
            <div class="form-group" style="color: red;">${error}</div>
        </c:if>

        <form:form action="/login" method="post">
            <input type="email" id="login" class="fadeIn second" name="username" placeholder="login" required="required">
            <label for="login">Email</label>
            <input type="password" id="password" class="fadeIn third" name="password" placeholder="password"
                   required="required">
            <label for="password">Password</label>
            <input type="submit" class="fadeIn fourth" value="Log In">
        </form:form>

        <div id="formFooter">
            <a class="underlineHover" href="<c:url value="/register"/>">Register</a>
        </div>

    </div>
</div>

<c:import url="/WEB-INF/views/parts/foot.jsp"/>

</body>
</html>
