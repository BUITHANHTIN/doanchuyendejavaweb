<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListURL" value='/property'/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Property</title>
    <meta charset="utf-8">
</head>
<body>


<div class="hero-wrap" style="background-image: url('img/images/bg_1.jpg');">
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
            <div class="">
                <form action="<c:url value="/property"/>" method="get" class="search-property">


                    <div class="row">
                        <div class="col-md align-items-end">
                            <div class="form-group">
                                <label
                                >Tên </label>
                                <div class="form-field">
                                    <div class="icon"><span class="icon-my_location"></span></div>
                                    <input name="name" value="" type="text" class="form-control"
                                           placeholder="Keyword">

                                </div>
                            </div>
                        </div>
                        <div class="col-md align-items-end">
                            <div class="form-group">
                                <label>Ten duong</label>
                                <div class="form-field">
                                    <div class="icon"><span class="icon-my_location"></span></div>
                                    <input name="street" type="text" class="form-control"
                                           placeholder="City/Locality Name">
                                </div>
                            </div>
                        </div>
                        <div class="col-md align-items-end">
                            <div class="form-group">
                                <label>Quận</label>
                                <div class="form-field">
                                    <div class="select-wrap">
                                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                        <select name="district" class="form-control">
                                            <option style="color: black" value="">Chọn Quận</option>
                                            <c:forEach items="${districtList}" var="item">
                                                <option style="color: black" value="${item.key}">${item.value}</option>
                                            </c:forEach>


                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md align-items-end">
                            <div class="form-group">
                                <label>Min Beds</label>
                                <div class="form-field">
                                    <div class="select-wrap">
                                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                        <select name="bedroom" id="" class="form-control">
                                            <option style="color: #0b0b0b" value="">1</option>
                                            <option style="color: #0b0b0b" value="">2</option>
                                            <option style="color: #0b0b0b" value="">3</option>
                                            <option style="color: #0b0b0b" value="">4</option>
                                            <option style="color: #0b0b0b" value="">5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md align-items-end">
                            <div class="form-group">
                                <label>Min Bathrooms</label>
                                <div class="form-field">
                                    <div class="select-wrap">
                                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                        <select name="bathroom" class="form-control">
                                            <option style="color: #0b0b0b" value="">1</option>
                                            <option style="color: #0b0b0b" value="">2</option>
                                            <option style="color: #0b0b0b" value="">3</option>
                                            <option style="color: #0b0b0b" value="">4</option>
                                            <option style="color: #0b0b0b" value="">5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="row">
                        <div class="col-md align-items-end">
                            <div class="form-group">
                                <label for="">Min Price</label>
                                <div class="form-field">
                                    <div class="icon"><span class=""></span></div>
                                    <input name="priceFrom" type="text" class="form-control" placeholder="Min Price">
                                </div>
                            </div>
                        </div>
                        <div class="col-md align-items-end">
                            <div class="form-group">
                                <label for="">Max Price</label>
                                <div class="form-field">
                                    <div class="icon"><span class=""></span></div>
                                    <input name="priceTo" type="text" class="form-control" placeholder="Max Price">
                                </div>
                            </div>
                        </div>


                        <div class="col-md align-items-end">
                            <div class="form-group">
                                <label>Diện tích nhỏ nhất <span>(m²)</span></label>
                                <div class="form-field">
                                    <div class="icon"><span class="icon-my_location"></span></div>
                                    <input name="areaFrom" type="text" class="form-control" placeholder="Min Area">
                                </div>
                            </div>
                        </div>
                        <div class="col-md align-items-end">
                            <div class="form-group">
                                <label>Diện tích lớn nhất <span>(m²)</span></label>
                                <div class="form-field">
                                    <div class="icon"><span class="icon-my_location"></span></div>
                                    <input name="areaTo" type="text" class="form-control" placeholder="Max Area">
                                </div>
                            </div>
                        </div>
                        <div class="col-md align-self-end">
                            <div class="form-group">
                                <div class="form-field">
                                    <%--                                    <input type="submit" value="Search" class="form-control btn btn-primary">--%>
                                    <button type="submit" value="Search" class="form-control btn btn-primary">Search
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>


<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <c:forEach var="item" items="${model}">
                <div class="col-md-4 ftco-animate">
                    <div class="properties">
                        <a href="<c:url value="/property-single?id=${item.id}"/>"
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
                                    <h3><a href="<c:url value="/property-single?id=${item.id}"/>">${item.name}</a></h3>
                                    <p>${item.street}</p>
                                </div>
                                <div class="two">
                                    <span class="price">${item.rentPriceDescription}</span>
                                </div>
                            </div>
                            <p>Far far away, behind the word mountains, far from the countries</p>
                            <hr>
                            <p class="bottom-area d-flex">
                                <span><i class="flaticon-selection"></i>200m²</span>
                                <span class="ml-auto"><i class="flaticon-bathtub"></i> ${item.bathroom}</span>
                                <span><i class="flaticon-bed"></i> ${item.bedroom}</span>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>

        <c:if test="${totalPages!=0}">
            <div class="row mt-5">
                <ul class="pagination justify-content-center">
                    <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                        <a class="page-link" href="/other-page?page=${currentPage - 1}">
                            Previous
                        </a>
                    </li>
                    <c:forEach begin="0" end="${totalPages-1}" varStatus="loop">
                        <li class="page-item ${currentPage == loop.index ? 'active' : ''}">
                            <a class="page-link" href="/other-page?page=${loop.index}">
                                    ${loop.index+1}
                            </a>
                        </li>
                    </c:forEach>

                    <li class="page-item ${currentPage == totalPages-1 ? 'disabled' : ''}">
                        <a class="page-link" href="/other-page?page=${currentPage + 1}">
                            Next
                        </a>
                    </li>
                </ul>

            </div>
        </c:if>
        <c:if test="${totalPages==0}"> Không tìm thấy sản phẩm </c:if>
    </div>
</section>

</body>
</html>