<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="col-lg-2">
    <div class="list-group my-4">
        <ul class="navbar-nav bg-gradient-primary sidebar">

            <li class="nav-item active">
                <a class="nav-link" href="/">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>All products</span></a>
            </li>

            <li class="nav-item">
                <hr class="sidebar-divider">
            </li>

            <li class="nav-item">
                <form:form method="get" action="/products/search">
                    <a class="nav-link collapsed" href="/" data-toggle="collapse" data-target="#collapseOne"
                       aria-expanded="false" aria-controls="collapseOne">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Manufacturer</span>
                    </a>
                    <div id="collapseOne" class="collapse multi-collapse">
                        <div class="py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Manufacturers</h6>
                            <c:forEach items="${sessionScope.manufacturers}" var="manufacturer">
                                <label class="collapse-item">
                                    <input type="checkbox" name="manufacturers"
                                           value="${manufacturer.id}">${manufacturer.name}
                                </label>
                                <br/>
                            </c:forEach>
                        </div>
                    </div>


                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="false" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>Price</span>
                    </a>
                    <div id="collapseTwo" class="collapse multi-collapse">
                        <div class="py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Price range:</h6>
                            <div class="form-group row">
                                <label for="min" class="col-sm-2 col-form-label">From</label>
                                <div class="col-sm-10">
                                    <input name="minPrice" type="number" class="form-control" id="min" value="0">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="max" class="col-sm-2 col-form-label">To</label>
                                <div class="col-sm-10">
                                    <input name="maxPrice" type="number" class="form-control" id="max" value="9999">
                                    // change to max from product repo
                                </div>
                            </div>

                        </div>
                    </div>
                    <input class="btn btn-sm btn-primary" type="submit" value="Search">
                </form:form>
                <hr class="sidebar-divider">
            </li>
        </ul>
    </div>

</div>