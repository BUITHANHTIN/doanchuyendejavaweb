<%@ taglib prefix="forn" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="propertyURL" value='/property'/>
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


                </div>

                <div class="row">

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
                                    <form:select items="${districtList}" multiple="false" path="district"
                                                 class="form-control"/>

                                </div>
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
                                <button id="btnSearch" class="form-control btn btn-primary">SEARCH</button>
                            </div>
                        </div>
                    </div>

                    </form:form>
                </div>
            </div>
        </div>
    </div>
</section>


</div>
<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <c:forEach var="item" items="${modelSearch.listResult}">
                <div class="col-md-4 ftco-animate">
                    <div class="properties">
                        <a href="<c:url value="/property-single?id=${item.id}" />"
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
                                    <h3><a href="<c:url value="/property-single?id=${item.id}" />">${item.address}</a></h3>
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
<%--                <display:table name="modelSearch.listResult"></display:table>--%>
            </c:forEach>

<%--            <div class="col text-center">--%>
<%--                <div class="block-27">--%>
<%--                    <ul>--%>
<%--                        <c:forEach var="page" items="${modelSearch.totalItems}">--%>
<%--                            <li class="active"><span>${page}</span></li>--%>
<%--                        </c:forEach>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>

            <%--            <div class="table-responsive">--%>
            <%--                <display:table name="modelSearch.listResult" cellspacing="0" cellpadding="0"--%>
            <%--                               requestURI="${propertyURL}" partialList="true" sort="external"--%>
            <%--                               size="${modelSearch.totalItems}" defaultsort="2" defaultorder="ascending"--%>
            <%--                               id="tableList"--%>
            <%--                               pagesize="${modelSearch.maxPageItems}"--%>
            <%--                               export="false"--%>
            <%--                               class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"--%>
            <%--                               style="margin: 3em 0 1.5em;">--%>
            <%--                    <display:column title="<fieldset class='form-group'>--%>
            <%--												        <input type='checkbox'  id='checkAll' class='check-box-element'>--%>
            <%--												        </fieldset>" class="center select-cell"--%>
            <%--                                    headerClass="center select-cell">--%>
            <%--                        <fieldset>--%>
            <%--                            <input type="hidden" id="id" class="id" value="${tableList.id }"/>--%>
            <%--                            <input type="checkbox" name="checkList" value="${tableList.id}"--%>
            <%--                                   id="checkbox_${tableList.id}" class="check-box-element"/>--%>
            <%--                        </fieldset>--%>
            <%--                    </display:column>--%>
            <%--                    <display:column headerClass="text-left" property="name" title="Name"/>--%>
            <%--                    <display:column headerClass="text-left" property="address" title="Address"/>--%>
            <%--                    <display:column headerClass="text-left" property="floorArea" title="FloorArea"/>--%>
            <%--                    <display:column headerClass="text-left" property="rentPriceDescription"--%>
            <%--                                    title="Rent Price Description"/>--%>
            <%--                    <display:column headerClass="text-left" property="rentPrice" title="Rent Price"/>--%>
            <%--                    <display:column headerClass="text-left" property="type" title="Types"/>--%>
            <%--                    <display:column headerClass="text-left" property="numberOfBasement"--%>
            <%--                                    title="Number Of Basement"/>--%>
            <%--                    <display:column headerClass="text-left" property="rentArea" title="Rental Area"/>--%>


            <%--                    <display:column headerClass="col-actions" title="Thao tác">--%>
            <%--                        <button onclick="assingmentBuilding(${tableList.id})"--%>
            <%--                                class="btn btn-xs btn-success">--%>
            <%--                            <i class="ace-icon fa fa-bars bigger-120"></i>--%>
            <%--                        </button>--%>
            <%--                        <a href='<c:url value="${buildingUpadteURL}?buildingId=${tableList.id}"/>'><i--%>
            <%--                                class="fa fa-pencil-square bigger-120" aria-hidden="true"></i></a>--%>
            <%--                        &lt;%&ndash; <c:if test="${tableList.roleCode != 'MANAGER'}">--%>
            <%--                             <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"--%>
            <%--                                title="Cập nhật người dùng"--%>
            <%--                                href='<c:url value="/admin/user-edit-${tableList.id}"/>'>--%>
            <%--                                 <i class="fa fa-pencil-square-o" aria-hidden="true"></i>--%>
            <%--                             </a>--%>
            <%--                         </c:if>--%>
            <%--                         <c:if test="${tableList.roleCode == 'STAFF'}">--%>
            <%--                             <p>Không đươc thao tác</p>--%>
            <%--                         </c:if>&ndash;%&gt;--%>
            <%--                    </display:column>--%>
            <%--                </display:table>--%>
            <%--            </div>--%>


        </div>

    </div>
</section>
</body>
<script>
    $("#btnSearch").click(function (e) {
        e.preventDefault();
        $("#listForm").submit();

    });
</script>
</html>
