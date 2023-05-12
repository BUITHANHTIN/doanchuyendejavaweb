<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chỉnh sửa tòa nhà</title>
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
                                    <label class="col-sm-3 control-label no-padding-right">Name </label>

                                    <div class="col-sm-9">
                                        <input type="text" value="${building.name}" name="name"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                           for="district">District</label>

                                    <div class="col-sm-9">
                                        <select name="district" class="form-control" id="district">
                                            <option value="">---Select district---</option>
                                            <c:forEach var="item" items="${districtList}">
                                                <option
                                                        <c:if test="${building.district==item.name()}">selected</c:if>
                                                        value="${item.name()}">${item.districValue}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="ward">Ward</label>

                                    <div class="col-sm-9">
                                        <input name="ward" value="${building.ward}" type="text" id="ward"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                           for="street">Street</label>

                                    <div class="col-sm-9">
                                        <input name="street" value="${building.street}" type="text" id="street"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="structure">Structure
                                    </label>

                                    <div class="col-sm-9">
                                        <input name="structure" value="${building.structure}" type="text"
                                               id="structure"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="numberOfBasement">Number
                                        Of Basement</label>

                                    <div class="col-sm-9">
                                        <input name="numberOfBasement" value="${building.numberOfBasement}"
                                               type="number" id="numberofbasement" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="floorArea">Floor
                                        Area</label>

                                    <div class="col-sm-9">
                                        <input name="floorArea" value="${building.floorArea}" type="number"
                                               id="floorArea" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="rentArea">Rental
                                        Area</label>

                                    <div class="col-sm-9">
                                        <input name="rentArea" value="${building.rentArea}" type="text"
                                               id="rentArea"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="rentArea">Bedroom
                                    </label>

                                    <div class="col-sm-9">
                                        <input name="bedroom" value="${building.bedroom}" type="number"
                                               id="bedroom"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="rentArea">Bathroom
                                    </label>

                                    <div class="col-sm-9">
                                        <input name="bathroom" value="${building.bathroom}" type="number"
                                               id="bathroom"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="rentArea">Description
                                    </label>

                                    <div class="col-sm-9">
                                        <input name="description" value="${building.description}" type="text"
                                               id="description"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="rentPrice">
                                        Rent Price</label>

                                    <div class="col-sm-9">
                                        <input name="rentPrice" value="${building.rentPrice}" type="number"
                                               id="rentPrice" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                           for="direction">Direction</label>

                                    <div class="col-sm-9">
                                        <input name="direction" value="${building.direction}" type="text"
                                               id="direction"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="level">Level</label>

                                    <div class="col-sm-9">
                                        <input name="level" value="${building.level}" type="text" id="level"
                                               class="form-control"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                           for="rentPriceDescription">Rent Price Description</label>

                                    <div class="col-sm-9">
                                        <input name="rentPriceDescription" value="${building.rentPriceDescription}"
                                               type="text" id="rentPriceDescription" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                           for="serviceFee">Service Fee</label>

                                    <div class="col-sm-9">
                                        <input name="serviceFee" value="${building.serviceFee}"
                                               type="text" id="serviceFee" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                           for="carFee">Car Fee</label>

                                    <div class="col-sm-9">
                                        <input name="carFee" value="${building.carFee}"
                                               type="text" id="carFee" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                           for="motoFee">Moto Fee</label>

                                    <div class="col-sm-9">
                                        <input name="motoFee" value="${building.serviceFee}"
                                               type="text" id="motoFee" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                           for="overtimeFee">Overtime Fee</label>

                                    <div class="col-sm-9">
                                        <input name="overtimeFee" value="${building.overtimeFee}"
                                               type="text" id="overtimeFee" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                           for="waterFee">Water Fee</label>

                                    <div class="col-sm-9">
                                        <input name="waterFee" value="${building.waterFee}"
                                               type="text" id="waterFee" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                           for="electricityFee">Electricity Fee</label>

                                    <div class="col-sm-9">
                                        <input name="electricityFee" value="${building.electricityFee}"
                                               type="text" id="electricityFee" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                           for="deposit">Deposit</label>

                                    <div class="col-sm-9">
                                        <input name="deposit"
                                               value="${building.deposit}"
                                               type="text" id="deposit" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                           for="payment">Payment</label>

                                    <div class="col-sm-9">
                                        <input name="payment" type="text" id="payment"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                           for="rentTime">RentTime</label>

                                    <div class="col-sm-9">
                                        <input name="rentTime" type="text" id="rentTime"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="decorationTime">Decoration
                                        Time</label>

                                    <div class="col-sm-9">
                                        <input name="decorationTime" type="text" id="decorationTime"
                                               class="form-control"/>
                                    </div>
                                </div>


                                    <%-- <div class="form-group">
                                         <label class="col-sm-3 control-label no-padding-right"
                                                for="staffId">Nhan vien phu trach</label>

                                         <div class="col-sm-9">
                                             <select name="staffInCharge" class="form-control" id="staffId">

                                                 <option value="">---Nhan vien phu trach---</option>
                                                 <c:forEach var="item" items="${userList}">
                                                     <option value="${item.id}">${item.fullName}</option>
                                                 </c:forEach>


                                             </select>
                                         </div>
                                     </div>--%>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"> Type</label>

                                    <div class="col-sm-9">
                                        <c:if test="${empty building.id}">
                                            <c:forEach var="item" items="${typeList}">
                                                <div class="form-check form-check-inline">
                                                    <input
                                                            name="buildingTypes"
                                                            class="form-check-input"
                                                            type="checkbox"
                                                            value="${item.code}">
                                                    <label class="form-check-label"
                                                    >${item.name}</label>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${not empty building.id}">
                                            <c:forEach var="item" items="${typeList}">
                                                <div class="form-check form-check-inline">
                                                    <input
                                                        ${item.selected}
                                                            name="buildingTypes"
                                                            class="form-check-input"
                                                            type="checkbox"
                                                            value="${item.code}">
                                                    <label class="form-check-label"
                                                    >${item.name}</label>
                                                </div>
                                            </c:forEach>
                                        </c:if>


                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="note">Note
                                    </label>

                                    <div class="col-sm-9">
                                        <input name="note" type="text" id="note"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="map">Map
                                    </label>

                                    <div class="col-sm-9">
                                        <input name="map" type="text" id="map"
                                               class="form-control"/>
                                    </div>
                                </div>

                                    <%-- <div class="form-group">
                                          <label class="col-sm-3 control-label no-padding-right" for="avatar">Avatar
                                          </label>

                                          <div class="col-sm-9">
                                              <input name="avatar" type="text" id="avatar"
                                                     class="form-control"/>
                                          </div>
                                      </div>--%>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Avatar</label>
                                    <input class="col-sm-3 no-padding-right" type="file" id="uploadImage"/>
                                    <div class="col-sm-9">
                                        <c:if test="${not empty building.avatar}">
                                            <c:set var="imagePath" value="/repository${building.avatar}"/>
                                            <img src="${imagePath}" id="viewImage" width="300px" height="300px"
                                                 style="margin-top: 50px">
                                        </c:if>
                                        <c:if test="${empty building.avatar}">
                                            <img src="/admin/image/default.png" id="viewImage" width="300px"
                                                 height="300px">
                                        </c:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                           for="floorArea"></label>

                                    <div class="col-sm-9">
                                        <button id="btnAddBuilding" type="button" class="btn btn-primary">Update
                                        </button>
                                        <button id="btnCloseBuilding" type="button" class="btn btn-primary">
                                            Close
                                        </button>
                                    </div>
                                </div>

                                <input type="hidden" id="buildingId" value="${building.id}">

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


                <div class="modal" id="assingmentBuildingModal" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Danh sach nhan vien</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Modal body text goes here.</p>
                            </div>
                            <div class="modal-footer">
                                <button id="" type="button" class="btn btn-primary">Giao toa nhan</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
</div><!-- /.main-content -->
<script>
    var imageBase64 = '';
    var imageName = '';
    $('#btnAddBuilding').click(function () {
        var data = {};
        var buildingTypes = [];
        var formData = $('#formEdit').serializeArray();
        $.each(formData, function (index, item) {
            if (item.name == "buildingTypes") {
                buildingTypes.push(item.value);
            } else {
                data["" + item.name + ""] = item.value;
            }
            if ('' !== imageBase64) {
                data['imageBase64'] = imageBase64;
                data['imageName'] = imageName;
            }
        });
        data['buildingTypes'] = buildingTypes;
        var type = 'POST'
        var buildingId = $('#buildingId').val();
        if (buildingId === "") {

        } else {
            data['id'] = $('#buildingId').val();
            type = "PUT";
        }
        $.ajax({
            type: type,
            url: "/api/building",
            contentType: "application/json",
            data: JSON.stringify(data),
            dataType: 'json',

            success: function (data) {
                window.location = '/admin/building-list';
            },
            error: function (e) {
                window.location = '/admin/building-edit';
                console.log(e);
            }
        });
    });
    $("#btnCloseBuilding").click(function (e) {
        // e.preventDefault();
        window.location = '/admin/building-list';
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