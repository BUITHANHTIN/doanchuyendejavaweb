<%@ taglib prefix="forn" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<c:url var="customerListURL" value='/admin/customer-list'/>
<c:url var="customerUpadteURL" value='/admin/customer-edit'/>
<c:url var="deleteCustomerURL" value='/api/customer'/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách khách hàng</title>
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
                        <h4 class="widget-title">Tìm Kiếm</h4>

                        <div class="widget-toolbar">
                            <a href="#" data-action="collapse">
                                <i class="ace-icon fa fa-chevron-up"></i>
                            </a>


                        </div>
                    </div>


                    <div class="widget-body">

                        <div class="widget-main">
                            <form:form modelAttribute="modelSearch" action="${customerListURL}"
                                       id="listForm" method="GET">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <div class="row">

                                            <!-- PAGE CONTENT BEGINS -->
                                            <div class="col-xs-12">
                                                <div class="col-sm-4">
                                                    <input name="searchValue" value="searchValue" type="hidden"
                                                           class="form-control"/>
                                                    <label for="fullName">Tên khách hàng</label>

                                                    <forn:input path="fullName" cssClass="form-control"/>
                                                </div>

                                                <div class="col-sm-4">
                                                    <label>Số điện thoại</label>

                                                    <forn:input path="phone" cssClass="form-control"/>
                                                </div>
                                                <div class="col-sm-4">
                                                    <label>Email</label>

                                                    <forn:input path="email" cssClass="form-control"/>
                                                </div>
                                                <!-- PAGE CONTENT ENDS -->
                                            </div>
                                            <!-- /.col -->
                                            <br>

                                            <div class="col-xs-12">
                                                <div class="col-sm-3">
                                                    <label>Nhân viên quản lý</label>
                                                    <form:select path="staffId">
                                                        <form:option value="" label="--Nhân viên--"/>
                                                        <form:options items="${userList}"/>
                                                    </form:select>


                                                </div>
                                                <div class="col-sm-9">
                                                    <button id="btnSearch" type="button" class="btn btn-success">Tìm Kiếm
                                                    </button>
                                                </div>

                                                <!-- PAGE CONTENT ENDS -->
                                            </div><!-- /.col -->
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
                        <button id="btnAddCustomer" class="btn btn-white btn-info btn-bold" data-toggle="tooltip"
                                title="Thêm khách hàng"><i
                                class="fa fa-plus-square" aria-hidden="true"></i></button>
                        <security:authorize access="hasRole('MANAGER')">
                        <button id="btnDeleteCustomer" class="btn btn-white btn-info btn-bold" data-toggle="tooltip"
                                title="Xóa khách hàng"><i
                                class="fa fa-trash-o" aria-hidden="true"></i></button>
                        </security:authorize>


                    <div class="row">
                        <div class="col-xs-12">
                            <div class="table-responsive">
                                <display:table name="modelSearch.listResult" cellspacing="0" cellpadding="0"
                                               requestURI="${customerListURL}" partialList="true" sort="external"
                                               size="${modelSearch.totalItems}" defaultsort="2"
                                               defaultorder="ascending"
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
                                    <display:column headerClass="text-left" property="fullName" title="Tên"/>
                                    <display:column headerClass="text-left" property="createdBy"
                                                    title="Nhân viên quản lý"/>
                                    <display:column headerClass="text-left" property="phone" title="Phone"/>
                                    <display:column headerClass="text-left" property="email" title="Email"/>
                                    <display:column headerClass="text-left" property="demand" title="Demand"/>
                                    <display:column headerClass="text-left" property="createdBy"
                                                    title="Người nhập"/>
                                    <display:column headerClass="text-left" property="createdDate"
                                                    title="Ngày nhập"/>
                                    <display:column headerClass="text-left" property="status" title="Tình trạng"/>

                                    <display:column headerClass="col-actions" title="Thao tác">

                                        <security:authorize access="hasRole('MANAGER')">
                                            <button onclick="assingmentCustomer(${tableList.id})"
                                                    class="btn btn-xs btn-success">
                                                <i class="ace-icon fa fa-bars bigger-120"></i>
                                            </button>
                                        </security:authorize>

                                        <a href='<c:url value="${customerUpadteURL}?id=${tableList.id}"/>'><i
                                                class="fa fa-pencil-square bigger-120" aria-hidden="true"></i></a>
                                        <%--<c:if test="${tableList.roleCode == 'STAFF'}">
                        <p>Không đươc thao tác</p>
                        </c:if>--%>
                                    </display:column>
                                </display:table>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" id="customerId" value="">

                </div><!-- /.page-content -->

            </div><!-- /.page-content -->

        </div>
    </div>
</div><!-- /.main-content -->
<div class="modal" id="assingmentCustomerModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Danh sách khách hàng</h5>
            </div>
            <div class="modal-body">
                <table id="assignmentCustomer-table" class="table">
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
                <button id="assingmentCustomerToUser" type="button" class="btn btn-primary">Giao khach hang</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script>


    function assingmentCustomer(customerId) {
        $('#customerId').val(customerId);
        openModalAssingmentCustomer();
        loadStaff(customerId);
    }

    function loadStaff(customerId) {
        $.ajax({
            url: '/api/customer/' + customerId + '/staff',
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
                $('#assingmentCustomerModal tbody').html(row);


            }
        });
    }

    function openModalAssingmentCustomer() {
        $("#assingmentCustomerModal").modal();
    }

    $("#btnSearch").click(function (e) {
        e.preventDefault();
        $("#listForm").submit();

    });
    $("#btnAddCustomer").click(function (e) {
        e.preventDefault();
        window.location = '/admin/customer-add';
    });
    $("#btnDeleteCustomer").click(function (e) {
        e.preventDefault();

        $("#tableList > tbody input:checked").each(function () {
            var id = $(this).val();
            var data = [];
            data.push(id);
            var self = $(this);
            $.ajax({
                url: '${deleteCustomerURL}',
                type: 'DELETE',
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function (value) {
                    self.closest("tr").remove();

                }
            });
        })

    });
    $("#assingmentCustomerToUser").click(function (e) {
        e.preventDefault();

        var staffId = $("#assignmentCustomer-table").find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();

        var customerId = $('#customerId').val();
        var re = {};

        re['staffId'] = staffId;
        re['customerId'] = customerId;
        $.ajax({
            url: '/api/assignment/customer',
            type: 'PUT',
            contentType: "application/json",
            data: JSON.stringify(re),
            success: function (value) {
                $('#assingmentCustomerModal').modal('hide');
            }
        });


    });

</script>
</body>
</html>