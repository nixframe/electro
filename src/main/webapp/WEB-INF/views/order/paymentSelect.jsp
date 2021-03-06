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
                    Choose payment
                </h1>
                <div class="row">
                    <div class="col">
                        <form:form method="post" action="/order/pay">
                            <input type="hidden" name="orderId" value="${orderId}">
                            <button class="btn btn-sm btn-primary" type="submit" name="payment" value="wire">
                                Pay with card
                            </button>
                            <button class="btn btn-sm btn-primary" type="submit" name="payment" value="cod">
                                Pay upon delivery
                            </button>
                        </form:form>
                    </div>
                    <div class="col">
                        <form:form method="post" action="/order/resign">
                            <input type="hidden" name="orderId" value="${orderId}">
                            <button class="btn btn-sm btn-primary" type="submit" name="action">Give up</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<c:import url="/WEB-INF/views/parts/foot.jsp"/>

</body>
</html>