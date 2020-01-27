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

                <h1 class="my-3">Create new product</h1>

                <div class="mt-4">
                    <form:form method="post" modelAttribute="manufacturer">
                        <div class="form-group card-body">
                            <div class="form-label-group">
                                <form:errors path="name" cssStyle="color: red"/>
                                <label for="name">Manufacturers name </label>
                                <form:input path="name" class="form-control" id="name"/>
                            </div>
                        </div>
                        <input class="btn btn-sm btn-primary" type="submit" value="Add">
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

