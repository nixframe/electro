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

                <h1 class="my-3">${title} orders</h1>

                <table class="table table-sm thead-light table-striped">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">User</th>
                        <th scope="col">Created</th>
                        <th scope="col">Adres</th>
                        <th scope="col">Total</th>
                        <th scope="col">Payment type</th>
                        <th scope="col">Paid</th>
                        <th scope="col">Completed</th>
                        <th scope="col">&#9881;</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${orders}" var="order" varStatus="o">
                        <tr>
                            <td>${o.index + 1}</td>
                            <td>${order.user.email}</td>
                            <td>${order.orderCreation}</td>
                            <td> <a href="<c:url value="/admin/user/adres?id=${order.user.id}"/>">
                                <button class="btn btn-sm btn-primary">show</button>
                            </a></td>
                            <td>${order.totalAmount}</td>
                            <td>${order.paymentType}</td>
                            <td>${order.paymentReceived}</td>
                            <td>${order.orderCompletion}</td>
                            <td>
                                <c:if test="${action == 'send'}"><a
                                        href="<c:url value="/admin/orders/complete?id=${order.id}"/>">
                                    <button class="btn btn-sm btn-primary">send</button>
                                </a></c:if>
                                <c:if test="${action == 'del'}">
                                    <a href="<c:url value="/admin/orders/del?id=${order.id}"/>">
                                        <button class="btn btn-sm btn-primary">delete</button>
                                    </a>
                                </c:if>
                                <a href="<c:url value="/order/details?orderId=${order.id}"/>">
                                    <button class="btn btn-sm btn-primary">show</button>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
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

