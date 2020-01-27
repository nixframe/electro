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
                <div class="row my-3">
                    <a href="<c:url value="/admin/product/add"/>">
                        <button class="btn btn-sm btn-primary">add product</button>
                    </a>
                    <a href="<c:url value="/admin/product/manufacturer"/>">
                        <button class="btn btn-sm btn-primary">add manufacturer</button>
                    </a>
                </div>
                <h1 class="my-3">Product List</h1>

                <table class="table table-sm thead-light table-striped">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Manufacturer</th>
                        <th scope="col">Model</th>
                        <th scope="col">Price</th>
                        <th scope="col">In stock</th>
                        <th scope="col">Created</th>
                        <th scope="col">&#9881;</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${products}" var="product" varStatus="u">
                        <tr>
                            <td>${u.index + 1}</td>
                            <td>${product.manufacturer.name}</td>
                            <td>${product.name}</td>
                            <td>${product.price}</td>
                            <td>${product.quantity}</td>
                            <td>${product.created}</td>
                            <td>
                                <a href="<c:url value="/admin/product/edit?prodId=${product.id}"/>">
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

