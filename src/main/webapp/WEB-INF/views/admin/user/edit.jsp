<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thêm nhân viên</title>
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
                    <a href="#">Home</a>
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


            <div class="widget-body">

                <div class="widget-main">
                    <div class="form-horizontal">
                        <form:form action="" id="formEdit" method="GET">
                        <div class="row">

                            <!-- PAGE CONTENT BEGINS -->
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Full Name </label>

                                    <div class="col-sm-9">
                                        <input type="text" value="${user.fullName}" name="fullName"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Email </label>

                                    <div class="col-sm-9">
                                        <input type="text" value="${user.userName}" name="userName"
                                               class="form-control"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Phone</label>

                                    <div class="col-sm-9">
                                        <input name="phone" value="${user.phone}" type="text" id="company"
                                               class="form-control"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">
                                    </label>
                                    <div class="col-sm-9">

                                        <c:if test="${user!=null}">
                                            <button id="btnEditUser" type="button" class="btn btn-primary">Edit User
                                            </button>
                                        </c:if>
                                        <c:if test="${user==null}">
                                            <button id="btnAddUser" type="button" class="btn btn-primary">Add User
                                            </button>
                                        </c:if>
                                        <button id="btnCloseUser" type="button" class="btn btn-primary">
                                            Close
                                        </button>
                                    </div>
                                </div>

                                <input type="hidden" id="userId" name="id" value="${user.id}">

                                <!-- PAGE CONTENT ENDS -->
                            </div><!-- /.col -->


                        </div>

                        <!-- PAGE CONTENT ENDS -->
                    </div>
                    <!-- /.col -->
                    </form:form>
                    <div class="form-group">

                    </div>


                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
</div><!-- /.main-content -->
<script>
    $('#btnAddUser').click(function () {
        var data = {};
        var formData = $('#formEdit').serializeArray();
        $.each(formData, function (index, item) {
            data["" + item.name + ""] = item.value;
        });
        $.ajax({
            type: 'POST',
            url: "/api/user",
            contentType: "application/json",
            data: JSON.stringify(data),
            dataType: 'json',

            success: function (data) {
                window.location = '/admin/user-list';
            },
            error: function (e) {
                window.location = '/admin/user-add';
                console.log(e);
            }
        });
    });
    $('#btnEditUser').click(function () {
        var data = {};
        var id = $('#userId').val();
        var formData = $('#formEdit').serializeArray();
        $.each(formData, function (index, item) {
            data["" + item.name + ""] = item.value;
        });
        $.ajax({
            type: 'PUT',
            url: "/api/user/" + id,
            contentType: "application/json",
            data: JSON.stringify(data),
            dataType: 'json',

            success: function (data) {
                window.location = '/admin/user-list';
            },
            error: function (e) {
                window.location = '/admin/user-add';
                console.log(e);
            }
        });
    });


</script>
</body>
</html>