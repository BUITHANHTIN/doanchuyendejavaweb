<%@ taglib prefix="forn" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<c:url var="buildingListURL" value='/admin/building-list'/>
<c:url var="buildingUpadteURL" value='/admin/building-edit'/>
<c:url var="deleteBuildingURL" value='/api/building'/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách tòa nhà</title>
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

            <div class="row">
                <div class="widget-box">
                    <div class="widget-header">
                        <h4 class="widget-title">Tim Kiem</h4>

                        <div class="widget-toolbar">
                            <a href="#" data-action="collapse">
                                <i class="ace-icon fa fa-chevron-up"></i>
                            </a>


                        </div>
                    </div>


                    <div class="widget-body">

                        <div class="widget-main">
                            <%-- <form name="modelSearch" id="listForm" action="${buildingListURL}" method="GET">--%>
                            <form:form modelAttribute="modelSearch" action="${buildingListURL}"
                                       id="listForm" method="GET">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <div class="row">

                                            <!-- PAGE CONTENT BEGINS -->
                                            <div class="col-xs-12">
                                                <div class="col-sm-6">
                                                    <input name="searchValue" value="searchValue" type="hidden"
                                                           class="form-control"/>
                                                    <label for="name">Ten toa nha nhe</label>

                                                        <%--<input name="name" type="text" id="name" placeholder="" class="form-control"/>--%>
                                                        <%--    <forn:input path="name" cssClass="form-control"/>--%>
                                                    <input value="${modelSearch.name}" name="name" type="text" id="name"
                                                           class="form-control"/>
                                                </div>

                                                <div class="col-sm-6">
                                                    <label>Dien tich san</label>

                                                    <input value="${modelSearch.floorArea}" name="floorArea"
                                                           type="number"
                                                           placeholder=""
                                                           class="form-control"/>
                                                </div>
                                                <!-- PAGE CONTENT ENDS -->
                                            </div><!-- /.col -->

                                            <!-- PAGE CONTENT BEGINS -->
                                            <div class="col-xs-12">
                                                <div class="col-sm-3">
                                                    <label for="district">Quan hien co</label>

                                                    <form:select path="district">
                                                        <form:option value="" label="--Chon quan"/>
                                                        <form:options items="${districtList}"/>
                                                    </form:select>

                                                </div>

                                                <div class="col-sm-3">
                                                    <label>Phuong</label>

                                                    <input name="ward" value="${modelSearch.ward}" type="text"
                                                           placeholder="" class="form-control"/>
                                                </div>
                                                <div class="col-sm-3">
                                                    <label>Duong</label>

                                                    <input value="${modelSearch.street}" name="street" type="text"
                                                           placeholder=""
                                                           class="form-control"/>
                                                </div>
                                                <!-- PAGE CONTENT ENDS -->
                                            </div><!-- /.col -->
                                            <!-- PAGE CONTENT BEGINS -->
                                            <div class="col-xs-12">
                                                <div class="col-sm-3">
                                                    <label for="basement">So tang ham</label>
                                                    <input value="${modelSearch.numberOfBasement}"
                                                           name="numberOfBasement" type="number" id="basement"
                                                           placeholder=""
                                                           class="form-control"/>
                                                </div>

                                                <div class="col-sm-3">
                                                    <label for="direction">Huong</label>

                                                    <input value="${modelSearch.direction}" name="direction" type="text"
                                                           id="direction" placeholder=""
                                                           class="form-control"/>
                                                </div>
                                                <div class="col-sm-3">
                                                    <label for="level">Hang</label>

                                                    <input value="${modelSearch.level}" name="level"
                                                           type="text" id="level" placeholder=""
                                                           class="form-control"/>
                                                </div>
                                                <!-- PAGE CONTENT ENDS -->
                                            </div><!-- /.col -->
                                            <!-- PAGE CONTENT BEGINS -->
                                            <div class="col-xs-12">
                                                <div class="col-sm-3">
                                                    <label>Dien tich tu</label>
                                                    <input value="${modelSearch.areaFrom}" name="areaFrom" type="number"
                                                           placeholder=""
                                                           class="form-control"/>
                                                </div>

                                                <div class="col-sm-3">
                                                    <label>Dien tich den</label>

                                                    <input value="${modelSearch.areaTo}" name="areaTo" type="number"
                                                           placeholder=""
                                                           class="form-control"/>
                                                </div>

                                                <div class="col-sm-3">
                                                    <label>Gia thue tu</label>

                                                    <input value="${modelSearch.priceFrom}" name="priceFrom"
                                                           type="number"
                                                           placeholder=""
                                                           class="form-control"/>
                                                </div>
                                                <div class="col-sm-3">
                                                    <label>Gia thue den</label>

                                                    <input value="${modelSearch.priceTo}" name="priceTo"
                                                           type="number" placeholder=""
                                                           class="form-control"/>
                                                </div>
                                                <!-- PAGE CONTENT ENDS -->
                                            </div><!-- /.col -->
                                            <!-- PAGE CONTENT BEGINS -->
                                            <div class="col-xs-12">
                                                <div class="col-sm-3">
                                                    <label for="nameManage">Ten quan li</label>
                                                    <input value="${modelSearch.manageName}" name="manageName"
                                                           type="text" id="nameManage" placeholder=""
                                                           class="form-control"/>
                                                </div>

                                                <div class="col-sm-3">
                                                    <label for="phoneManage">Dien thoai quan li</label>

                                                    <input value="${modelSearch.manageOfPhone}" name="manageOfPhone"
                                                           type="number" id="phoneManage"
                                                           placeholder=""
                                                           class="form-control"/>
                                                </div>
                                                <%--chi co manager moi hien thi--%>
                                                <security:authorize access="hasRole('MANAGER')">
                                                    <div class="col-sm-3">
                                                        <label >Chon nhan vien phu trach</label>
                                                        <form:select path="staffInCharge">
                                                            <form:option value="" label="--Chon nhan vien"/>
                                                            <form:options  items="${userList}"/>
                                                        </form:select>
                                                    </div>
                                                </security:authorize>

                                                <!-- PAGE CONTENT ENDS -->
                                            </div><!-- /.col -->
                                            <div class="col-xs-12">
                                                <div class="col-sm-3">
                                                    <form:checkboxes  element="br" path="buildingTypes" items="${typeList}"/>
                                                        <%--<c:forEach var="item" items="${typeList}">--%>
                                                        <%--<div class="form-check form-check-inline">--%>
                                                        <%--<input ${item.selected} name="buildingTypes"--%>
                                                        <%--class="form-check-input"--%>
                                                        <%--type="checkbox"--%>
                                                        <%--id="inlineCheckbox1"--%>
                                                        <%--value="${item.code}">--%>
                                                        <%--<label class="form-check-label"--%>
                                                        <%--for="inlineCheckbox1">${item.name}</label>--%>
                                                        <%--</div>--%>
                                                        <%--</c:forEach>--%>

                                                    <div>
                                                        <button id="btnSearch" type="button" class="btn btn-success">Tim
                                                            kiem
                                                        </button>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>

                                        <!-- PAGE CONTENT ENDS -->
                                    </div><!-- /.col -->
                                </div>
                            </form:form>

                            <%--  </form>--%>

                        </div>
                    </div>


                </div><!-- /.row -->

                <div class="widget-main">
                    <p style="float: right;">
                        <button id="btnAddBuilding" class="btn btn-white btn-info btn-bold" data-toggle="tooltip"
                                title="Them toa nha"><i
                                class="fa fa-plus-square" aria-hidden="true"></i></button>
                        <button id="btnDeleteBuilding" class="btn btn-white btn-info btn-bold" data-toggle="tooltip"
                                title="Xoa toa nha"><i
                                class="fa fa-trash-o" aria-hidden="true"></i></button>

                    <div class="row">
                        <div class="col-xs-12">
                            <div class="table-responsive">
                                <display:table name="modelSearch.listResult" cellspacing="0" cellpadding="0"
                                               requestURI="${buildingListURL}" partialList="true" sort="external"
                                               size="${modelSearch.totalItems}" defaultsort="2" defaultorder="ascending"
                                               id="tableList"
                                               pagesize="${modelSearch.maxPageItems}"
                                               export="false"
                                               class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                               style="margin: 3em 0 1.5em;">
                                    <display:column title="<fieldset class='form-group'>
												        <input type='checkbox'  id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                                    headerClass="center select-cell">
                                        <fieldset>
                                            <input type="hidden" id="id" class="id" value="${tableList.id }"/>
                                            <input type="checkbox" name="checkList" value="${tableList.id}"
                                                   id="checkbox_${tableList.id}" class="check-box-element"/>
                                        </fieldset>
                                    </display:column>
                                    <display:column headerClass="text-left" property="name" title="Name"/>
                                    <display:column headerClass="text-left" property="address" title="Address"/>
                                    <display:column headerClass="text-left" property="floorArea" title="FloorArea"/>
                                    <display:column headerClass="text-left" property="rentPriceDescription"
                                                    title="Rent Price Description"/>
                                    <display:column headerClass="text-left" property="rentPrice" title="Rent Price"/>
                                    <display:column headerClass="text-left" property="type" title="Types"/>
                                    <display:column headerClass="text-left" property="numberOfBasement"
                                                    title="Number Of Basement"/>
                                    <display:column headerClass="text-left" property="rentArea" title="Rental Area"/>


                                    <display:column headerClass="col-actions" title="Thao tác">
                                        <button onclick="assingmentBuilding(${tableList.id})"
                                                class="btn btn-xs btn-success">
                                            <i class="ace-icon fa fa-bars bigger-120"></i>
                                        </button>
                                        <a href='<c:url value="${buildingUpadteURL}?buildingId=${tableList.id}"/>'><i
                                                class="fa fa-pencil-square bigger-120" aria-hidden="true"></i></a>
                                        <%-- <c:if test="${tableList.roleCode != 'MANAGER'}">
                                             <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                                title="Cập nhật người dùng"
                                                href='<c:url value="/admin/user-edit-${tableList.id}"/>'>
                                                 <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                             </a>
                                         </c:if>
                                         <c:if test="${tableList.roleCode == 'STAFF'}">
                                             <p>Không đươc thao tác</p>
                                         </c:if>--%>
                                    </display:column>
                                </display:table>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" id="buildingId" value="">

                </div><!-- /.page-content -->

            </div><!-- /.page-content -->

        </div>
    </div>
</div><!-- /.main-content -->
<div class="modal" id="assingmentBuildingModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Danh sach nhan vien</h5>
            </div>
            <div class="modal-body">
                <table id="assignmentBuilding-table" class="table">
                    <thead>
                    <tr>
                        <th class="text-center" scope="col"></th>
                        <th class="text-center" scope="col">Full Name</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button id="assingmentBuildingToUser" type="button" class="btn btn-primary">Giao toa nhan</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script>


    function assingmentBuilding(buildingId) {
        $('#buildingId').val(buildingId);
        openModalAssingmentBuilding();
        loadStaff(buildingId);
    }

    function loadStaff(buildingId) {
        $.ajax({
            url: '/api/building/' + buildingId + '/staff',
            type: 'GET',
            dataType: "json",
            success: function (response) {
                var row = '';
                $.each(response, function (index, item) {
                    row += '<tr>';
                    row += '<td class="text-center" ><input  type="checkbox"  value=' + item.id + ' id="checkbox_' + item.id + '"class="check-box-element" ' + item.checked + '/></td>';
                    row += '<td class="text-center">' + item.fullName + '</td>';
                    row += '</tr>';
                });
                $('#assingmentBuildingModal tbody').html(row);


            }
        });
    }

    function openModalAssingmentBuilding() {
        $("#assingmentBuildingModal").modal();
    }

    $("#btnSearch").click(function (e) {
        e.preventDefault();
        $("#listForm").submit();

    });
    $("#btnAddBuilding").click(function (e) {
        e.preventDefault();
        window.location = '/admin/building-edit';
    });
    $("#btnDeleteBuilding").click(function (e) {
        e.preventDefault();

        $("#tableList > tbody input:checked").each(function () {
            var id = $(this).val();
            var data = [];
            data.push(id);
            var self = $(this);
            $.ajax({
                url: '${deleteBuildingURL}',
                type: 'DELETE',
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function (value) {
                    self.closest("tr").remove();

                }
            });
        })

    });
    $("#assingmentBuildingToUser").click(function (e) {
        e.preventDefault();

        var staffId = $("#assignmentBuilding-table").find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();

        var buildingId = $('#buildingId').val();
        var re = {};

        re['staffId'] = staffId;
        re['buildingId'] = buildingId;
        $.ajax({
            url: '/api/assignment/building',
            type: 'PUT',
            contentType: "application/json",
            data: JSON.stringify(re),
            success: function (value) {
                $('#assingmentBuildingModal').modal('hide');
            }
        });


    });

</script>
</body>
</html>