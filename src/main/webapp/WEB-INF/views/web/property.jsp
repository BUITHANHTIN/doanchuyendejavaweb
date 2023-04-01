<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: AN515-43
  Date: 3/28/2023
  Time: 3:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Property</title>
</head>
<body>
<div class="hero-wrap" style="background-image: url('img/images/bg_2.jpg');">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="<c:url value='/trang-chu'/>">Home</a></span> <span>Property</span>
                </p>
                <h1 class="mb-3 bread">Property</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-search">
    <div class="container">
        <div class="row">
            <div class="col-md-12 search-wrap">
                <h2 class="heading h5 d-flex align-items-center pr-4"><span class="ion-ios-search mr-3"></span> Search
                    Property</h2>
                <form:form modelAttribute="modelSearch" action="${buildingListURL}" class="search-property"
                           id="listForm" method="GET">
                <div class="row">

                    <div class="col-md align-items-end">
                        <div class="form-group">
                            <label>Name</label>
                            <div class="form-field">
                                <div class="icon"><span class="icon-my_location"></span></div>
                                <input value="${modelSearch.name}" name="name" type="text" id="name"
                                       class="form-control"/>
                                    <%--                                    <input type="text" class="form-control" placeholder="City/Locality Name" name="">--%>
                            </div>
                        </div>
                    </div>
                    <div class="col-md align-items-end">
                        <div class="form-group">
                            <label>Street</label>
                            <div class="form-field">
                                <div class="icon"><span class="icon-my_location"></span></div>
                                <input value="${modelSearch.street}" name="street" type="text" id="location"
                                       class="form-control"/>
                                    <%--                                    <input type="text" class="form-control" placeholder="City/Locality Name" name="">--%>
                            </div>
                        </div>
                    </div>
                    <div class="col-md align-items-end">
                        <div class="form-group">
                            <label>Min Bedroom</label>
                            <div class="form-field">
                                <div class="icon"><span class="icon-my_location"></span></div>
                                <input value="${modelSearch.bedroom}" name="bedroom" type="text" id="name"
                                       class="form-control"/>
                                    <%--                                    <input type="text" class="form-control" placeholder="City/Locality Name" name="">--%>
                            </div>
                        </div>
                    </div>
                    <div class="col-md align-items-end">
                        <div class="form-group">
                            <label>Min Bathroom</label>
                            <div class="form-field">
                                <div class="icon"><span class="icon-my_location"></span></div>
                                <input value="${modelSearch.bathroom}" name="bathroom" type="text" id="name"
                                       class="form-control"/>
                                    <%--                                    <input type="text" class="form-control" placeholder="City/Locality Name" name="">--%>
                            </div>
                        </div>
                    </div>

                    <div class="col-md align-items-end">
                        <div class="form-group">
                            <label>Quận</label>
                            <div class="form-field">
                                <div class="select-wrap">
                                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                    <%--<form:select path="district" class="form-control">
                                        <form:option value="" label="--Chon quan--"/>
                                        <form:options items="${districtList}"/>

                                    </form:select>--%>
                                    <form:select items="${districtList}" multiple="false" path="district" class="form-control" />

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md align-items-end">
                        <div class="form-group">
                            <label>Location</label>
                            <div class="form-field">
                                <div class="icon"><span class="icon-my_location"></span></div>
                                <input value="${modelSearch.name}" name="name" type="text" id="name"
                                       class="form-control"/>
                                    <%--                                    <input type="text" class="form-control" placeholder="City/Locality Name" name="">--%>
                            </div>
                        </div>
                    </div>

                    <div class="col-md align-items-end">
                        <div class="form-group">
                            <label>Location</label>
                            <div class="form-field">
                                <div class="icon"><span class="icon-my_location"></span></div>
                                <input value="${modelSearch.name}" name="name" type="text" id="name"
                                       class="form-control"/>
                                    <%--                                    <input type="text" class="form-control" placeholder="City/Locality Name" name="">--%>
                            </div>
                        </div>
                    </div>

                    <div class="col-md align-items-end">
                        <div class="form-group">
                            <label>Min Area</label>
                            <div class="form-field">
                                <div class="icon"><span class="icon-my_location"></span></div>
                                <input value="${modelSearch.areaFrom}" name="areaFrom" type="text" id="name"
                                       class="form-control"/>
                                    <%--                                    <input type="text" class="form-control" placeholder="City/Locality Name" name="">--%>
                            </div>
                        </div>
                    </div>
                    <div class="col-md align-items-end">
                        <div class="form-group">
                            <label>Max Area</label>
                            <div class="form-field">
                                <div class="icon"><span class="icon-my_location"></span></div>
                                <input value="${modelSearch.areaTo}" name="areaTo" type="text"
                                       class="form-control"/>
                                    <%--                                    <input type="text" class="form-control" placeholder="City/Locality Name" name="">--%>
                            </div>
                        </div>
                    </div>

                    <div class="col-md align-self-end">
                        <div class="form-group">
                            <div class="form-field">
                                <input type="submit" value="Search" class="form-control btn btn-primary">
                            </div>
                        </div>
                    </div>

                    </form:form>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <c:forEach var="item" items="${showAllBuilding}">
                <div class="col-md-4 ftco-animate">
                    <div class="properties">
                        <a href="property-single.html"
                           class="img img-2 d-flex justify-content-center align-items-center"
                           style="background-image: url(${item.avatar});">
                            <div class="icon d-flex justify-content-center align-items-center">
                                <span class="icon-search2"></span>
                            </div>
                        </a>
                        <div class="text p-3">
                            <span class="status sale">Sale</span>
                            <div class="d-flex">
                                <div class="one">
                                    <h3><a href="property-single.html">${item.address}</a></h3>
                                    <p>${item.type}</p>
                                </div>
                                <div class="two">
                                    <span class="price">$${item.rentPrice}</span>
                                </div>
                            </div>
                            <p>${item.description}</p>
                            <hr>
                            <p class="bottom-area d-flex">
                                <span><i class="flaticon-selection"></i>${item.floorArea} m²</span>
                                <span class="ml-auto"><i class="flaticon-bathtub"></i> ${item.bathroom}</span>
                                <span><i class="flaticon-bed"></i> ${item.bedroom}</span>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="row mt-5">
            <div class="col text-center">
                <div class="block-27">
                    <ul>
                        <li><a href="#">&lt;</a></li>
                        <li class="active"><span>1</span></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&gt;</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
