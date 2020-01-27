<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <h1 class="my-3">User panel</h1>

                <div class="row">
                    <div class="col">
                        <table class="table table-sm">
                            <thead>Your details</thead>
                            <tbody>
                            <tr>
                                <td>Email</td>
                                <td>${user.email}</td>
                            </tr>
                            <tr>
                                <td>Name</td>
                                <td>${user.firstName}</td>
                            </tr>
                            <tr>
                                <td>Last name</td>
                                <td>${user.lastName}</td>
                            </tr>
                            </tbody>
                        </table>
                        <a href="<c:url value="/user/edit/data"/>">
                            <button class="btn btn-secondary">Edit</button>
                        </a>
                        <a href="<c:url value="/user/edit/password"/>">
                            <button class="btn btn-secondary">Change password</button>
                        </a>
                    </div>
                    <div class="col">
                        <table class="table">
                            <thead>Delivery address</thead>
                            <tbody>
                            <tr>
                                <td>Street</td>
                                <td>${user.adres.street}</td>
                            </tr>
                            <tr>
                                <td>Building</td>
                                <td>${user.adres.houseNumber}</td>
                            </tr>
                            <tr>
                                <td>Flat</td>
                                <td>${user.adres.aptNumber}</td>
                            </tr>
                            <tr>
                                <td>Postal code</td>
                                <td>${user.adres.postalCode}</td>
                            </tr>
                            <tr>
                                <td>City</td>
                                <td>${user.adres.city}</td>
                            </tr>
                            </tbody>
                        </table>
                        <a href="<c:url value="/user/edit/adres"/>">
                            <button class="btn btn-secondary">Edit</button>
                        </a>
                    </div>
                </div>
                <c:if test="${not empty user_orders}">
                    <div class="row">
                        <table class="table thead-light table-striped">
                            <thead>
                            <tr>
                                <th scope="col">Order number</th>
                                <th scope="col">Date</th>
                                <th scope="col">Price</th>
                                <th scope="col">Payment</th>
                                <th scope="col">Payment status</th>
                                <th scope="col">Completed</th>
                                <th scope="col">Details</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${user_orders}" var="order">
                                <tr>
                                    <!-- Order number -->
                                    <td>${order.id}</td>
                                    <!-- Date -->
                                    <td><fmt:formatDate value="${order.orderCreationTimeFormatted}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <!-- Price -->
                                    <td>${order.totalAmount}</td>
                                    <!-- Payment -->
                                    <c:if test="${not empty order.paymentType}">
                                        <td>${order.paymentType.name()}</td>
                                    </c:if>
                                    <c:if test="${empty order.paymentType}">
                                        <td>---</td>
                                    </c:if>
                                    <!-- Payment status -->
                                    <c:if test="${order.paymentReceived}">
                                        <td>Paid - ${order.paymentType.name()}</td>
                                    </c:if>
                                    <c:if test="${!order.paymentReceived}">
                                        <td>
                                            <a href="<c:url value="/order/pay?orderId=${order.id}"/>">
                                                <button class="btn btn-sm btn-primary">Pay</button>
                                            </a>
                                        </td>
                                    </c:if>
                                    <!-- Completed -->
                                    <td>${order.orderCompletion}</td>
                                    <!-- Details -->
                                    <td>
                                        <a href="<c:url value="/order/details?orderId=${order.id}"/>">
                                            <button class="btn btn-sm btn-primary">+</button>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <c:if test="${cartItems.size() > 0}">
                            <a href="<c:url value="/order/create"/>" class="btn btn-primary">
                                Order
                            </a>
                        </c:if>
                    </div>
                </c:if>
            </div>


        </div>
    </div>
</div>

<!-- Footer -->
<c:import url="/WEB-INF/views/parts/foot.jsp"/>

</body>
</html>

