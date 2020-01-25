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
                    Order summary
                </h1>
                <table class="table thead-light table-striped">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Product</th>
                        <th scope="col">Manufacturer</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Price</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${order.orderItemList}" var="orderItem" varStatus="c">
                        <tr>
                            <td>${c.index + 1}</td>
                            <td>${orderItem.product.displayName}</td>
                            <td>${orderItem.product.manufacturer.name}</td>
                            <td>${orderItem.productQuantity}</td>
                            <td>${orderItem.productQuantity*orderItem.product.price}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <th scope="row"></th>
                        <th scope="col">Total price:</th>
                        <th scope="col"><c:out value="${order.totalAmount}"/></th>
                    </tr>
                    </tbody>

                    <c:if test="${order.paymentReceived == false}">
                        <div class="row">
                            <div class="col">
                                <form:form method="post" action="/order/pay">
                                    <input type="hidden" name="orderId" value="${order.id}">
                                    <button class="btn btn-sm btn-primary" type="submit" name="action">Create order</button>
                                </form:form>
                            </div>
                            <div class="col">
                                <form:form method="post" action="/order/resign">
                                    <input type="hidden" name="orderId" value="${order.id}">
                                    <button class="btn btn-sm btn-primary" type="submit" name="action">Give up</button>
                                </form:form>
                            </div>
                        </div>
                    </c:if>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<c:import url="/WEB-INF/views/parts/foot.jsp"/>

</body>
</html>