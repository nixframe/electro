<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="col-lg-3">

    <h1 class="my-4">Electro shop</h1>
    <div class="list-group">
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark">

            <li class="nav-item active">
                <a class="nav-link" href="<c:url value="/prod/all"/>">
                    <span>All products</span>
                </a>
            </li>

            <li class="nav-item">
                <hr class="sidebar-divider">
            </li>

            <li class="nav-item">
                <div class="sidebar-heading">
                    <span><h6>Filter products</h6></span>
                </div>
            </li>

            <li class="nav-item">
                <form:form method="get" action="/prod/search">
                    <div>
                        <div class="py-2">
                            Manufacturer:<br/><br/>
                            <ul>
                                <c:forEach items="${sessionScope.manufacturers}" var="manufacturer">
                                    <label>
                                        <input type="checkbox" name="manufacturers"
                                               value="${manufacturer.id}">${manufacturer.name}
                                    </label>
                                    <br/>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                    <div>
                        <div class="py-2">
                            Price:
                            <ul>
                                <div class="form-group row">
                                    <label for="min" class="col-sm-2 col-form-label">From</label>
                                    <div class="col-sm-10">
                                        <input name="minPrice" type="number" class="form-control" id="min" value="0">
                                    </div>
                                </div>
                            </ul>
                            <ul>
                                <div class="form-group row">
                                    <label for="max" class="col-sm-2 col-form-label">To</label>
                                    <div class="col-sm-10">
                                        <input name="maxPrice" type="number" class="form-control" id="max"
                                               value="1699">
                                    </div>
                                </div>
                            </ul>
                        </div>
                    </div>

                    <%--                    // TODO category search--%>
                    <%--                    <div>--%>
                    <%--                        <div class="py-2">--%>
                    <%--                            <h6>Category:</h6>--%>
                    <%--                            <div class="form-group row">--%>
                    <%--                                <label for="min" class="col-sm-2 col-form-label">From</label>--%>
                    <%--                                <div class="col-sm-10">--%>
                    <%--                                    <input name="minPrice" type="number" class="form-control" id="min" value="0">--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="form-group row">--%>
                    <%--                                <label for="max" class="col-sm-2 col-form-label">To</label>--%>
                    <%--                                <div class="col-sm-10">--%>
                    <%--                                    <input name="maxPrice" type="number" class="form-control" id="max" value="${highPrice}">--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>

                    <%--                        </div>--%>
                    <%--                    </div>--%>

                    <input class="btn btn-sm btn-primary" type="submit" value="Search">
                </form:form>
                <hr class="sidebar-divider">
            </li>
        </ul>
    </div>

</div>
