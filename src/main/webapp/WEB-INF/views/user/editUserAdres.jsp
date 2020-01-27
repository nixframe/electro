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
                    Edit your delivery adres
                </h1>
                <form:form method="post" modelAttribute="address">
                    Street: <form:input path="street"/>
                    <form:errors path="street"/>
                    <br/>
                    Building: <form:input path="houseNumber"/>
                    <form:errors path="houseNumber"/>
                    <br/>
                    Flat: <form:input path="aptNumber"/>
                    <form:errors path="aptNumber"/>
                    <br/>
                    Postal code: <form:input path="postalCode"/>
                    <form:errors path="postalCode"/>
                    <br/>
                    City: <form:input path="city"/>
                    <form:errors path="city"/>
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

