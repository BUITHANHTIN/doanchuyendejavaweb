<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thêm khách hàng</title>
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
                                        <input type="text" value="" name="fullName"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Phone </label>

                                    <div class="col-sm-9">
                                        <input type="number" value="" name="phone"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                    >Email</label>

                                    <div class="col-sm-9">
                                        <input name="email" value="" type="text" id="email"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Tên công ty</label>

                                    <div class="col-sm-9">
                                        <input name="company" value="" type="text" id="company"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                    >Nhu cầu</label>

                                    <div class="col-sm-9">
                                        <input name="demand" value="" type="text" id="demand"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Ghi chú
                                    </label>

                                    <div class="col-sm-9">
                                        <input name="note" value="" type="text"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">
                                    </label>
                                    <div class="col-sm-9">
                                        <button id="btnAddCustomer" type="button" class="btn btn-primary">Add Customer
                                        </button>
                                        <button id="btnCloseCustomer" type="button" class="btn btn-primary">
                                            Close
                                        </button>
                                    </div>
                                </div>

                                <input type="hidden" id="buildingId" value="">

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
    $('#btnAddCustomer').click(function () {
        var data = {};
        var formData = $('#formEdit').serializeArray();
        $.each(formData, function (index, item) {
            data["" + item.name + ""] = item.value;
        });
        $.ajax({
            type: 'POST',
            url: "/api/customer",
            contentType: "application/json",
            data: JSON.stringify(data),
            dataType: 'json',

            success: function (data) {
                window.location = '/admin/customer-list';
            },
            error: function (e) {
                window.location = '/admin/customer-add';
                console.log(e);
            }
        });
    });
    $("#btnCloseCustomer").click(function (e) {
        // e.preventDefault();
        window.location = '/admin/customer-list';
    });
    $('#uploadImage').change(function (event) {
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function (e) {
            imageBase64 = e.target.result;
            imageName = file.name; // ten hinh khong dau, khoang cach. vd: a-b-c
        };
        reader.readAsDataURL(file);
        openImage(this, "viewImage");
    });

    function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' + imageView).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</body>
</html>