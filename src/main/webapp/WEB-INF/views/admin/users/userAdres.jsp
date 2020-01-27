<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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

                <h1 class="my-3">User adres details</h1>

                <table class="table table-sm thead-light table-striped">
                    <thead>
                    </thead>
                    <tbody>

                    <tr>
                        <td>Street</td>
                        <td>${adres.street}</td>
                    </tr>
                    <tr>
                        <td>Building</td>
                        <td>${adres.houseNumber}</td>
                    </tr>
                    <tr>
                        <td>Flat</td>
                        <td>${adres.aptNumber}</td>
                    </tr>
                    <tr>
                        <td>Postal code</td>
                        <td>${adres.postalCode}</td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td>${adres.city}</td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<c:import url="/WEB-INF/views/parts/foot.jsp"/>

</body>
</html>

