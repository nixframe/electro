<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

                <h1 class="my-4">Cart inventory</h1>

                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Manufacturer</th>
                        <th scope="col">Name</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Price per item</th>
                        <th scope="col">Price</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${cartItems}" var="cartItem" varStatus="c">
                        <tr>
                            <td scope="row">${c.index + 1}</td>
                            <td>${cartItem.product.manufacturer.name}</td>
                            <td>${cartItem.product.name}</td>
                            <td>${cartItem.productQuantity}</td>
                            <td>${cartItem.product.price}</td>
                            <td>${cartItem.product.price * cartItem.productQuantity}</td>
                            <td>
                                <a href="<c:url value="/cart/add?id=${cartItem.product.id}"/>">
                                    <button class="btn btn-primary">+</button>
                                </a>
                            </td>
                            <td>
                                <a href="<c:url value="/cart/subtract?id=${cartItem.product.id}"/>">
                                    <button class="btn btn-primary">-</button>
                                </a>
                            </td>
                            <td>
                                <a href="<c:url value="/cart/remove?id=${cartItem.product.id}"/>">
                                    <button class="btn btn-small btn-primary">Remove this products</button>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${cartItems.size() >= 0}">
                        <tr>
                            <th scope="row"></th>
                            <th scope="col">Total price:</th>
                            <th scope="col"><c:out value="${totalPrice}"/></th>
                        </tr>
                    </c:if>
                    </tbody>
                </table>

                <c:if test="${cartItems.size() > 0}">
                    <a href="<c:url value="/order/create"/>" class="btn btn-primary">
                        Order
                    </a>
                </c:if>
            </div>
        </div>
    </main>

    <c:import url="/WEB-INF/views/parts/foot.jsp"/>

</div>
</body>
</html>

