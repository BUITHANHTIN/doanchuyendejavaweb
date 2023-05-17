<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<%--
  Created by IntelliJ IDEA.
  User: AN515-43
  Date: 3/28/2023
  Time: 3:08 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Property-Single</title>
</head>
<body>

<div class="hero-wrap" style="background-image: url(${model.avatar});">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span
                        class="mr-2"><a href="<c:url value='/trang-chu'/>">Home</a></span> <span class="mr-2"></span>
                    <span>Property Single</span></p>
                <h1 class="mb-3 bread">Property Single</h1>
            </div>
        </div>
    </div>
</div>


<section class="ftco-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="row">
                    <div class="col-md-12 ftco-animate">
                        <div class="single-slider owl-carousel">
                            <div class="item">
                                <div class="properties-img" style="background-image: url(${model.avatar});"></div>
                            </div>
                            <div class="item">
                                <div class="properties-img"
                                     style="background-image: url(${model.avatar});"></div>
                            </div>
                            <div class="item">
                                <div class="properties-img"
                                     style="background-image: url(${model.avatar});"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 Properties-single mt-4 mb-5 ftco-animate">
                        <h2>${model.name}</h2>
                        <p class="rate mb-4">
                            <span class="loc"><a href="#"><i class="icon-map"></i> ${model.address}</a></span>
                        </p>
                        <p>When she reached the first hills of the Italic Mountains, she had a last view back on the
                            skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of
                            her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she
                            continued her way.</p>

                        <p>When she reached the first hills of the Italic Mountains, she had a last view back on the
                            skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of
                            her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she
                            continued her way.</p>
                    </div>
                    <div class="col-md-12 properties-single ftco-animate mb-5 mt-4">
                        <h3 class="mb-4">Take A Tour</h3>
                        <div class="block-16">
                            <figure>
                                <img src="img/images/properties-6.jpg" alt="Image placeholder" class="img-fluid">
                                <a href="https://vimeo.com/45830194" class="play-button popup-vimeo"><span
                                        class="icon-play"></span></a>
                            </figure>
                        </div>
                    </div>

                    <div class="col-md-12 properties-single ftco-animate mb-5 mt-4">
                        <h4 class="mb-4">Review &amp; Ratings</h4>
                        <div class="row">
                            <div class="col-md-6">
                                <form method="post" class="star-rating">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">
                                            <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i
                                                    class="icon-star"></i><i class="icon-star"></i><i
                                                    class="icon-star"></i> 100 Ratings</span></p>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">
                                            <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i
                                                    class="icon-star"></i><i class="icon-star"></i><i
                                                    class="icon-star-o"></i> 30 Ratings</span></p>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">
                                            <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i
                                                    class="icon-star"></i><i class="icon-star-o"></i><i
                                                    class="icon-star-o"></i> 5 Ratings</span></p>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">
                                            <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i
                                                    class="icon-star-o"></i><i class="icon-star-o"></i><i
                                                    class="icon-star-o"></i> 0 Ratings</span></p>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">
                                            <p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i
                                                    class="icon-star-o"></i><i class="icon-star-o"></i><i
                                                    class="icon-star-o"></i> 0 Ratings</span></p>
                                        </label>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>


                </div>
            </div> <!-- .col-md-8 -->
            <div class="col-lg-4 sidebar ftco-animate">

                <div class="d-md-flex mt-5 mb-5">
                    <ul>
                        <li><span>Lot Area: </span> ${model.floorArea}</li>
                        <li><span>Bed Rooms: </span> ${model.bedroom}</li>
                        <li><span>Bath Rooms: </span> ${model.bathroom}</li>
                    </ul>
                    <ul class="ml-md-5">
                        <li><span>Floor Area: </span> ${model.floorArea}</li>
                        <li><span>Rent Price: </span>${model.rentPrice}</li>
                        <li><span>Stories: </span> 1</li>
                        <li><span>Roofing: </span> New</li>
                    </ul>
                </div>


                <div class="sidebar-box ftco-animate">
                    <div class="categories">
                        <h3>Categories</h3>
                        <li><a href="#">Properties <span>(${property.size()})</span></a></li>
                        <li><a href="#">Nội Thất <span>(${typeNOITHAT.size()})</span></a></li>
                        <li><a href="#">Nguyên Căn <span>(${typeNGUYENCAN.size()})</span></a></li>
                        <li><a href="#">Tầng Trệt <span>(${typeTANGTRET.size()})</span></a></li>
                    </div>

                    <form action="" id="formTuVan" style="margin-top: 50px">
                        <h2 style="background-color: #23ad42; text-align: center; border-radius: 5px">ĐĂNG KÝ TƯ
                            VẤN</h2>

                        <div class="form-floating mb-2">
                            <input type="text" id="form3Example3" class="form-control form-control-lg"
                                   name="fullName"
                                   placeholder="Họ và tên"/>
                            <label for="form3Example3">Họ và tên</label>
                        </div>

                        <div class="form-floating mb-2">

                            <input type="email" id="form3Example4" class="form-control form-control-lg"
                                   id="email" name="email"
                                   placeholder="Email"/>
                            <label class="form-label" for="form3Example4">Email</label>
                        </div>
                        <div class="form-floating mb-2">

                            <input type="hidden" class="form-control form-control-lg"
                                   name="note" value="Tư vấn cho khách về building có id là ${model.id}"
                            />
                        </div>
                        <div class="form-floating">

                            <input type="text" id="form3Example5" class="form-control form-control-lg"
                                   id="sodienthoai" name="phone"
                                   placeholder="Số điện thoại"/>
                            <label class="form-label" for="form3Example5">Số điện thoại</label>
                        </div>
                        <div class="text-center text-lg-start mt-4 pt-2">
                            <label style="color: red" class="form-label" id="notification"></label>
                            <button type="button" id="btnTuVan" class="btn btn-primary btn-lg"
                                    style="padding-left: 2.5rem; padding-right: 2.5rem;">NHẬN TƯ VẤN
                            </button>
                        </div>

                    </form>

                </div>

                <div class="sidebar-box ftco-animate">
                    <h3>Recent Blog</h3>
                    <div class="block-21 mb-4 d-flex">
                        <a class="blog-img mr-4" style="background-image: url(img/images/image_1.jpg);"></a>
                        <div class="text">
                            <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the
                                blind texts</a></h3>
                            <div class="meta">
                                <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div>
                                <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="block-21 mb-4 d-flex">
                        <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a>
                        <div class="text">
                            <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the
                                blind texts</a></h3>
                            <div class="meta">
                                <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div>
                                <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="block-21 mb-4 d-flex">
                        <a class="blog-img mr-4" style="background-image: url(images/image_3.jpg);"></a>
                        <div class="text">
                            <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the
                                blind texts</a></h3>
                            <div class="meta">
                                <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div>
                                <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="sidebar-box ftco-animate">
                    <h3>Tag Cloud</h3>
                    <div class="tagcloud">
                        <a href="#" class="tag-cloud-link">dish</a>
                        <a href="#" class="tag-cloud-link">menu</a>
                        <a href="#" class="tag-cloud-link">food</a>
                        <a href="#" class="tag-cloud-link">sweet</a>
                        <a href="#" class="tag-cloud-link">tasty</a>
                        <a href="#" class="tag-cloud-link">delicious</a>
                        <a href="#" class="tag-cloud-link">desserts</a>
                        <a href="#" class="tag-cloud-link">drinks</a>
                    </div>
                </div>

                <div class="sidebar-box ftco-animate">
                    <h3>Paragraph</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus
                        voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur
                        similique, inventore eos fugit cupiditate numquam!</p>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="ftco-section bg-light">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <%--                <span class="subheading">Ưu Đãi Đặc Biệt</span>--%>
                <h2 class="mb-4">Related Properties</h2>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">

            <c:forEach var="item" items="${mostRecommendedBuilding}">
                <div class="col-sm col-md-6 col-lg ftco-animate">
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
                                    <h3><a href="<c:url value="/property-single?id=${item.id}"/>">${item.address}</a>
                                    </h3>
                                    <p>${item.type}</p>
                                </div>
                                <div class="two">
                                    <span class="price">$${item.rentPrice}</span>
                                </div>
                            </div>
                            <p>Far far away, behind the word mountains, far from the countries</p>
                            <hr>
                            <p class="bottom-area d-flex">
                                <span><i class="flaticon-selection"></i> ${item.floorArea}</span>
                                <span class="ml-auto"><i class="flaticon-bathtub"></i> ${item.bathroom}</span>
                                <span><i class="flaticon-bed"></i> ${item.bedroom}</span>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</section>
<script src="web/js/jquery-3.2.1.min.js"></script>

<script>
    $('#btnTuVan').click(function () {
        $('.notifyjs-corner').empty();
        var notification = document.getElementById("notification");
        var data = {};
        var formData = $('#formTuVan').serializeArray();
        $.each(formData, function (index, item) {
            data["" + item.name + ""] = item.value;
        });
        var hasNullValue = false;

        for (var i = 0; i < formData.length; i++) {
            if (formData[i].value === null || formData[i].value.trim() === '') {
                hasNullValue = true;
                break;
            }
        }

        if (hasNullValue) {
            notification.innerHTML = "Vui long dien day du thong tin";
        } else {
            $.ajax({
                type: 'POST',
                url: "/api/customer",
                contentType: "application/json",
                data: JSON.stringify(data),
                dataType: 'json',
                success: function (data) {
                    notification.innerHTML = "Vui long chờ trong it phut nhan vien se gọi cho ban";
                },
                error: function (e) {

                }
            });
        }

    });
</script>

</body>
</html>
