<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="/WEB-INF/views/parts/head.jsp"/>
</head>
<body>

<c:import url="/WEB-INF/views/parts/header.jsp"/>

<div class="signup-form card-signup row justify-content-md-center">
    <form:form action="/register" method="post" modelAttribute="user">
        <h2>Register</h2>
        <p class="hint-text">
            For your convenience here are some provided users: <br/>
            user@user - asdasd<br/>
            admin@admin - asdasd<br/>
            <a href="<c:url value="/login"/>">Use them!</a>
        </p>
        <div class="form-group">

            <form:errors path="firstName" cssStyle="color: red"/>
            <div class="col-xs-6"><form:input path="firstName" type="text" id="name" class="form-control"
                                              placeholder="name"
                                              required="required" autofocus="autofocus"/></div>
            <br/>
            <form:errors path="lastName" cssStyle="color: red"/>
            <div class="col-xs-6"><form:input path="lastName" type="text" id="surname" cssClass="form-control"
                                              placeholder="surname" required="required"/></div>

        </div>
        <form:errors path="email" cssStyle="color: red"/>
        <div class="form-group">
            <form:input path="email" type="email" id="mail" cssClass="form-control" placeholder="mail"
                        required="required"/>
        </div>
        <form:errors path="password" cssStyle="color: red"/>
        <div class="form-group">
            <form:password path="password" id="password1" class="form-control"
                           placeholder="password" required="required"/>
        </div>
        <div class="form-group">
            <input name="password2" type="password" id="password2" class="form-control"
                   placeholder="repeat password" required="required">
        </div>
        <div class="form-group">
            <label class="checkbox-inline"><input type="checkbox" required="required"> I accept the Terms of Use &amp;
                Privacy Policy</label>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg btn-block">Register Now</button>
        </div>
        <div class="text-center">Already have an account? <a href="<c:url value="/login"/>">Log in</a></div>
    </form:form>

</div>

<c:import url="/WEB-INF/views/parts/foot.jsp"/>
</body>
</html>
