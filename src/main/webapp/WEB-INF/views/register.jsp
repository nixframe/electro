<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="/WEB-INF/views/parts/head.jsp"/>
</head>
<body>

<c:import url="/WEB-INF/views/parts/header.jsp"/>

<div class="container">
    <div class="card card-register mx-auto mt-5">
        <div class="card-header">Register user</div>
        <div class="card-body">
            <form:form action="/register" method="post" modelAttribute="user">
                <div class="form-group">
                    <div class="form-row">
                        <div class="col-md-6">
                            <form:errors path="firstName" cssStyle="color: red"/>
                            <div class="form-label-group">
                                <form:input path="firstName" type="text" id="name" class="form-control" placeholder="name"
                                            required="required" autofocus="autofocus"/>
                                <label for="name">Name</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <form:errors path="lastName" cssStyle="color: red"/>
                            <div class="form-label-group">
                                <form:input path="lastName" type="text" id="surname" cssClass="form-control"
                                            placeholder="surname" required="required"/>
                                <label for="surname">Surname</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <form:errors path="email" cssStyle="color: red"/>
                    <div class="form-label-group">
                        <form:input path="email" type="email" id="mail" cssClass="form-control" placeholder="mail"
                                    required="required"/>
                        <label for="mail">Email</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-row">
                        <div class="col-md-6">
                            <form:errors path="password" cssStyle="color: red"/>
                            <div class="form-label-group">
                                <form:password path="password" id="password1" class="form-control"
                                               placeholder="password" required="required"/>
                                <label for="password1">password</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-label-group">
                                <input name="password2" type="password" id="password2" class="form-control"
                                       placeholder="repeat password" required="required">
                                <label for="password2">repeat password</label>
                            </div>
                        </div>
                    </div>
                </div>
                <input class="btn btn-primary btn-block" type="submit" value="Register">
            </form:form>
            <div class="text-center">
                <a class="d-block small mt-3" href="<c:url value="/login"/>">Already registered?</a>
            </div>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/views/parts/foot.jsp"/>
</body>
</html>
