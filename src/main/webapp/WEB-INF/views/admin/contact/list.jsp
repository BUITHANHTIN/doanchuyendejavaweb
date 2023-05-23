<%@ taglib prefix="forn" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<c:url var="contactListURL" value='/admin/contact-list'/>
<%--<c:url var="buildingUpadteURL" value='/admin/building-edit'/>--%>
<%--<c:url var="deleteBuildingURL" value='/api/building'/>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách tin nhắn</title>
    <!-- <title>Trang chủ</title> -->
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Messenger</a>
                </li>
                <li class="active">Dashboard</li>
            </ul><!-- /.breadcrumb -->


        </div>

        <div class="page-content">


            <div class="page-header">
                <h1>
                    Dashboard
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->

            <c:forEach var="item" items="${contacts}">
                <div class="row border-1">
                    <div class="properties " style="padding-left: 50px;padding-right: 50px">
                        <a href="mailto:${item.email}"
                           class="img img-2 d-flex justify-content-center align-items-center">
                            <div class="icon d-flex justify-content-center align-items-center">
                                <span class="icon-search2"></span>
                            </div>
                        </a>
                        <div class="text p-3">
                            <div class="d-flex">
                                <div class="one">
                                    <p style="font-size: 18px">Tên: ${item.name}</p>
                                    <h5><a href="mailto:${item.email}">${item.email}</a></h5>
                                </div>
                            </div>
                            <span>Chủ đề: ${item.subject}</span>
                            <p style="font-size:20px">Nội dung: ${item.messenger}</p>
                            <hr>
                        </div>
                    </div>
                </div>
            </c:forEach>


        </div><!-- /.page-content -->

    </div>
</div>
</body>

</html>