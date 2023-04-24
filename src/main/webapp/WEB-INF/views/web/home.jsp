<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
</head>
<body>

<!-- Page Content -->

<section class="home-slider owl-carousel">
    <c:forEach var="item" items="${list3Building}">
        <div class="slider-item" style="background-image:url(${item.avatar})">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text align-items-md-end align-items-center justify-content-end">
                    <div class="col-md-6 text p-4 ftco-animate">
                        <h1 class="mb-3">${item.name}</h1>
                        <span class="location d-block mb-3"><i class="icon-my_location"></i> ${item.address}</span>
                        <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.
                            It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                        <span class="price">$${item.rentPrice}</span>
                        <a href="<c:url value="/property-single?id=${item.id}" />" class="btn-custom p-3 px-4 bg-primary">View Details <span
                                class="icon-plus ml-1"></span></a>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</section>

<span class="flaticon-pin"> </span>
<section class="ftco-section bg-light">
    <div class="container">
        <div class="row d-flex">
            <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services py-4 d-block text-center">
                    <div class="d-flex justify-content-center">
                        <div class="icon"><span class="flaticon-pin"></span></div>
                        <div class="icon"><span class="flaticon-pin"></span></div>
                    </div>
                    <div class="media-body p-2 mt-2">
                        <h3 class="heading mb-3">Find Places Anywhere In The World</h3>
                        <p>A small river named Duden flows by their place and supplies.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services py-4 d-block text-center">
                    <div class="d-flex justify-content-center">
                        <div class="icon"><span class="flaticon-detective"></span></div>
                    </div>
                    <div class="media-body p-2 mt-2">
                        <h3 class="heading mb-3">We Have Agents With Experience</h3>
                        <p>A small river named Duden flows by their place and supplies.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 d-flex align-sel Searchf-stretch ftco-animate">
                <div class="media block-6 services py-4 d-block text-center">
                    <div class="d-flex justify-content-center">
                        <div class="icon"><span class="flaticon-house"></span></div>
                    </div>
                    <div class="media-body p-2 mt-2">
                        <h3 class="heading mb-3">Buy &amp; Rent Modern Properties</h3>
                        <p>A small river named Duden flows by their place and supplies.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services py-4 d-block text-center">
                    <div class="d-flex justify-content-center">
                        <div class="icon"><span class="flaticon-purse"></span></div>
                    </div>
                    <div class="media-body p-2 mt-2">
                        <h3 class="heading mb-3">Making Money</h3>
                        <p>A small river named Duden flows by their place and supplies.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section ftco-properties">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <span class="subheading">Bài Đăng Gần Đây</span>
                    <h2 class="mb-4">Recent Properties</h2>
            </div>
        </div>

        <div class="row">

            <div class="col-md-12">

                <div class="properties-slider owl-carousel ftco-animate">
                    <c:forEach var="item" items="${recentsBuilding}">
                        <div class="item">
                            <div class="properties">
                                <a href="<c:url value="/property-single?id=${item.id}" />" class="img d-flex justify-content-center align-items-center"
                                   style="background-image: url(${item.avatar});">
                                    <div class="icon d-flex justify-content-center align-items-center">
                                        <span class="icon-search2"></span>
                                    </div>
                                </a>
                                <div class="text p-3">
                                    <span class="status sale">Sale</span>
                                    <div class="d-flex">
                                        <div class="one">
                                            <h3><a href="<c:url value="/property-single?id=${item.id}"/>">${item.address}</a></h3>
                                            <p>${item.type}</p>
                                        </div>
                                        <div class="two">
                                            <span class="price">$${item.rentPrice}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <span class="subheading">Ưu Đãi Đặc Biệt</span>
                <h2 class="mb-4">Most Recommended Properties</h2>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">

            <c:forEach var="item" items="${mostRecommendedBuilding}">
            <div class="col-sm col-md-6 col-lg ftco-animate">
                <div class="properties">
                    <a href="<c:url value="/property-single?id=${item.id}" />" class="img img-2 d-flex justify-content-center align-items-center"
                       style="background-image: url(${item.avatar});">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <span class="icon-search2"></span>
                        </div>
                    </a>
                    <div class="text p-3">
                        <span class="status sale">Sale</span>
                        <div class="d-flex">
                            <div class="one">
                                <h3><a href="<c:url value="/property-single?id=${item.id}"/>">${item.address}</a></h3>
                                <p>${item.type}</p>
                            </div>
                            <div class="two">
                                <span class="price">$${item.rentPrice}</span>
                            </div>
                        </div>
                        <p>Far far away, behind the word mountains, far from the countries</p>
                        <hr>
                        <p class="bottom-area d-flex">
                            <span><i class="flaticon-selection"></i> 250sqft</span>
                            <span class="ml-auto"><i class="flaticon-bathtub"></i> 3</span>
                            <span><i class="flaticon-bed"></i> 4</span>
                        </p>
                    </div>
                </div>
            </div>
            </c:forEach>

        </div>
    </div>
</section>

<section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(img/images/bg_1.jpg);">
    <div class="container" >
        <div class="row justify-content-center mb-3 pb-3">
            <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
                <h2 class="mb-4">Some fun facts</h2>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                        <div class="block-18 text-center">
                            <div class="text">
                                <strong class="number" data-number="${countCustomer}">0</strong>
                                <span>Happy Customers</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                        <div class="block-18 text-center">
                            <div class="text">
                                <strong class="number" data-number="${countBuilding}">0</strong>
                                <span>Properties</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                        <div class="block-18 text-center">
                            <div class="text">
                                <strong class="number" data-number="1000">0</strong>
                                <span>Agents</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                        <div class="block-18 text-center">
                            <div class="text">
                                <strong class="number" data-number="100">0</strong>
                                <span>Awards</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="ftco-section testimony-section bg-light">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 ftco-animate">
                <div class="row ftco-animate">
                    <div class="col-md-12">
                        <div class="carousel-testimony owl-carousel ftco-owl">
                            <div class="item">
                                <div class="testimony-wrap py-4 pb-5">
                                    <div class="user-img mb-4" style="background-image: url(img/images/person_1.jpg)">
		                    <span class="quote d-flex align-items-center justify-content-center">
		                      <i class="icon-quote-left"></i>
		                    </span>
                                    </div>
                                    <div class="text text-center">
                                        <p class="mb-4">A small river named Duden flows by their place and supplies it
                                            with the necessary regelialia. It is a paradisematic country, in which
                                            roasted parts of sentences fly into your mouth.</p>
                                        <p class="name">Roger Scott</p>
                                        <span class="position">Clients</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap py-4 pb-5">
                                    <div class="user-img mb-4" style="background-image: url(img/images/person_2.jpg)">
		                    <span class="quote d-flex align-items-center justify-content-center">
		                      <i class="icon-quote-left"></i>
		                    </span>
                                    </div>
                                    <div class="text text-center">
                                        <p class="mb-4">A small river named Duden flows by their place and supplies it
                                            with the necessary regelialia. It is a paradisematic country, in which
                                            roasted parts of sentences fly into your mouth.</p>
                                        <p class="name">Roger Scott</p>
                                        <span class="position">Agent</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap py-4 pb-5">
                                    <div class="user-img mb-4" style="background-image: url(img/images/person_3.jpg)">
		                    <span class="quote d-flex align-items-center justify-content-center">
		                      <i class="icon-quote-left"></i>
		                    </span>
                                    </div>
                                    <div class="text text-center">
                                        <p class="mb-4">A small river named Duden flows by their place and supplies it
                                            with the necessary regelialia. It is a paradisematic country, in which
                                            roasted parts of sentences fly into your mouth.</p>
                                        <p class="name">Roger Scott</p>
                                        <span class="position">Client</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap py-4 pb-5">
                                    <div class="user-img mb-4" style="background-image: url(img/images/person_1.jpg)">
		                    <span class="quote d-flex align-items-center justify-content-center">
		                      <i class="icon-quote-left"></i>
		                    </span>
                                    </div>
                                    <div class="text text-center">
                                        <p class="mb-4">A small river named Duden flows by their place and supplies it
                                            with the necessary regelialia. It is a paradisematic country, in which
                                            roasted parts of sentences fly into your mouth.</p>
                                        <p class="name">Roger Scott</p>
                                        <span class="position">Client</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap py-4 pb-5">
                                    <div class="user-img mb-4" style="background-image: url(img/images/person_1.jpg)">
		                    <span class="quote d-flex align-items-center justify-content-center">
		                      <i class="icon-quote-left"></i>
		                    </span>
                                    </div>
                                    <div class="text text-center">
                                        <p class="mb-4">A small river named Duden flows by their place and supplies it
                                            with the necessary regelialia. It is a paradisematic country, in which
                                            roasted parts of sentences fly into your mouth.</p>
                                        <p class="name">Roger Scott</p>
                                        <span class="position">Client</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <span class="subheading">Read Articles</span>
                <h2>Recent Blog</h2>
            </div>
        </div>
        <div class="row d-flex">
            <div class="col-md-3 d-flex ftco-animate">
                <div class="blog-entry align-self-stretch">
                    <a href="blog-single.html" class="block-20" style="background-image: url('img/images/image_1.jpg');">
                    </a>
                    <div class="text mt-3 d-block">
                        <h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the
                            blind texts</a></h3>
                        <div class="meta mb-3">
                            <div><a href="#">Dec 6, 2018</a></div>
                            <div><a href="#">Admin</a></div>
                            <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 d-flex ftco-animate">
                <div class="blog-entry align-self-stretch">
                    <a href="blog-single.html" class="block-20" style="background-image: url('img/images/image_2.jpg');">
                    </a>
                    <div class="text mt-3">
                        <h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the
                            blind texts</a></h3>
                        <div class="meta mb-3">
                            <div><a href="#">Dec 6, 2018</a></div>
                            <div><a href="#">Admin</a></div>
                            <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 d-flex ftco-animate">
                <div class="blog-entry align-self-stretch">
                    <a href="blog-single.html" class="block-20" style="background-image: url('img/images/image_3.jpg');">
                    </a>
                    <div class="text mt-3">
                        <h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the
                            blind texts</a></h3>
                        <div class="meta mb-3">
                            <div><a href="#">Dec 6, 2018</a></div>
                            <div><a href="#">Admin</a></div>
                            <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 d-flex ftco-animate">
                <div class="blog-entry align-self-stretch">
                    <a href="blog-single.html" class="block-20"
                       style="background-image: url('img/images/image_4.jpg');">
                    </a>
                    <div class="text mt-3">
                        <h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the
                            blind texts</a></h3>
                        <div class="meta mb-3">
                            <div><a href="#">Dec 6, 2018</a></div>
                            <div><a href="#">Admin</a></div>
                            <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


</body>

</html>