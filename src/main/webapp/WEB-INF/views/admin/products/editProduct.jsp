<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

                <h1 class="my-3">Edit product details</h1>

                <div class="mt-4">
                    <form:form method="post" modelAttribute="product" enctype="multipart/form-data">
                        <div class="form-group">
                            <div class="form-label-group">
                                <form:errors path="name" cssStyle="color: red"/>
                                <label for="name">Name</label>
                                <form:input path="name" class="form-control" id="name"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-label-group">
                                <form:errors path="description" cssStyle="color: red"/>
                                <label for="desc">Description</label>
                                <form:textarea rows="3" path="description" class="form-control" id="desc"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-label-group">
                                <form:errors path="price" cssStyle="color: red"/>
                                <label for="price">Price</label>
                                <form:input path="price" class="form-control" id="price"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-label-group">
                                <label for="manufacturer">Manufacturer</label>
                                <form:select path="manufacturer.id" items="${manufacturers}" itemLabel="name" itemValue="id" class="form-control" id="manufacturer"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-label-group">
                                <form:errors path="quantity" cssStyle="color: red"/>
                                <label for="stock">Stock</label>
                                <form:input path="quantity" class="form-control" id="stock"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-label-group">
                                <form:errors path="rating" cssStyle="color: red"/>
                                <label for="rating">Rating</label>
                                <form:input path="rating" class="form-control" id="rating"/>
                            </div>
                        </div>
                        <a href="<c:url value="/admin/product/picture?prodId=${product.id}"/>">
                            <button class="btn btn-primary" disabled>add picture</button>
                        </a>
                        <br/>
                        <input class="btn btn-sm btn-primary" type="submit" value="Save">
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<c:import url="/WEB-INF/views/parts/foot.jsp"/>

</body>
</html>

