<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: AN515-43
  Date: 3/28/2023
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contact</title>
</head>
<body>
<div class="hero-wrap" style="background-image: url('img/images/bg_2.jpg');">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="<c:url value='/trang-chu'/>">Home</a></span> <span>Contact</span>
                </p>
                <h1 class="mb-3 bread">Contact Us</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section contact-section bg-light">
    <div class="container">
        <div class="row d-flex mb-5 contact-info">
            <div class="col-md-12 mb-4">
                <h2 class="h3">Contact Information</h2>
            </div>
            <div class="w-100"></div>
            <div class="col-md-3 d-flex">
                <div class="info bg-white p-4">
                    <p><span>Address:</span> Khu phố 6, Linh Trung, Thủ Đức, thành phố Hồ Chí Minh</p>
                </div>
            </div>
            <div class="col-md-3 d-flex">
                <div class="info bg-white p-4">
                    <p><span>Phone:</span> <a href="tel://0356056080">+84 035 6056 080</a></p>
                </div>
            </div>
            <div class="col-md-3 d-flex">
                <div class="info bg-white p-4">
                    <p><span>Email:</span> <a href="doanchuyendeweb@gmail.com">doanchuyendeweb@gmail.com</a></p>
                </div>
            </div>
            <div class="col-md-3 d-flex">
                <div class="info bg-white p-4">
                    <p><span>Website</span> <a href="<c:url value='/trang-chu'/>">doanchuyendeweb</a></p>
                </div>
            </div>
        </div>
        <div class="row block-9">
            <div class="col-md-6 order-md-last d-flex">
                <form method="post" action="<c:url value="/contact"/>" class="bg-white p-5 contact-form">
                    <div class="form-group">
                        <input name="name" type="text" class="form-control" placeholder="Your Name">
                    </div>
                    <div class="form-group">
                        <input name="email" type="email" class="form-control" placeholder="Your Email" required>
                    </div>
                    <div class="form-group">
                        <input name="subject" type="text" class="form-control" placeholder="Subject">
                    </div>
                    <div class="form-group">
                        <textarea  name="messenger" id="" cols="30" rows="7" class="form-control" placeholder="Message"
                                  required></textarea>
                    </div>
                    <div class="form-group">
                        <%--                        <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">--%>
                        <button type="submit" class="btn btn-primary py-3 px-5">Send Message</button>
                    </div>
                </form>

            </div>

            <div class="col-md-6 d-flex">
                <div id="map" class="bg-white"></div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
