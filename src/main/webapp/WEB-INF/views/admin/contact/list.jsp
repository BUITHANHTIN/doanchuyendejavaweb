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

            <div class="row">
                <c:forEach var="item" items="${contacts}">

                <div class="properties">
                    <p>Name: ${item.name}</p>
                    <p>${item.messenger}</p>
                    <br>

                </div>

            </div>
            </c:forEach>
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