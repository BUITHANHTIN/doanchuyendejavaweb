<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Them khach hang</title>
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
                                        <input type="text" value="" name="fullName"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                    >Email</label>
                                    <div class="col-sm-9">
                                        <input name="email" value="" type="text"
                                               class="form-control"/>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                    >Phone</label>
                                    <div class="col-sm-9">
                                        <input name="phone" value="" type="number"
                                               class="form-control"/>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                    >Company</label>
                                    <div class="col-sm-9">
                                        <input name="company" value="" type="text"
                                               class="form-control"/>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                    >Demand</label>
                                    <div class="col-sm-9">
                                        <input name="demand" value="" type="text"
                                               class="form-control"/>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                    >Note</label>
                                    <div class="col-sm-9">
                                        <input name="note" value="" type="text"
                                               class="form-control"/>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"></label>
                                    <div class="col-sm-9">
                                        <button id="btnAddCustomer" type="button" class="btn btn-primary">Add
                                        </button>
                                        <button id="btnCloseCustomer" type="button" class="btn btn-primary">
                                            Close
                                        </button>
                                    </div>
                                </div>

                                <!-- PAGE CONTENT ENDS -->
                            </div><!-- /.col -->


                        </div>

                        <!-- PAGE CONTENT ENDS -->
                    </div>
                    <!-- /.col -->
                    </form:form>
                </div><!-- /.row -->

                <%-- <c:forEach items="${transaction}" var="item">
                     <div class="form-group">

                         <label class="col-sm-3 control-label no-padding-right">${item.nameTransaction}
                             <button onclick="btnOpenModal('${item.codeTransaction}')"><i
                                     class="fa fa-plus-square bigger-120" aria-hidden="true"></i></button>
                         </label></div>
                     <div>
                         <table class="table table-dark"
                                id="transaction_table_${item.codeTransaction}">
                             <tr>
                                 <th>Ngay tao</th>
                                 <th>Ghi chu</th>
                             </tr>
                             <c:forEach var="i" items="${item.object}">
                                 <tr>
                                     <td>${i.createdDate}</td>
                                     <td>${i.note}</td>
                                 </tr>
                             </c:forEach>
                         </table>

                     </div>
                 </c:forEach>

 --%>
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
</div><!-- /.main-content -->
<%--<div class="modal" id="transactionModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Note </label>

                    <div class="col-sm-9">
                        <textarea id="note" rows="4" cols="50"></textarea>
                        &lt;%&ndash;<input id="note" type="text" value=""/>&ndash;%&gt;
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="btnAddNote" type="button" class="btn btn-primary">Luu</button>
            </div>
        </div>
    </div>
</div>--%>
<%--<input type="hidden" id="code_transaction" value="">--%>
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
        e.preventDefault();
        window.location = '/admin/customer-list';
    });

    /* function btnOpenModal(code) {
         $("#transactionModal").modal();
         $('#code_transaction').val(code);
     };
     $("#btnAddNote").click(function (e) {
         e.preventDefault();
         var re = {};
         var note = $('#note').val();
         var customerId = $('#customerId').val();
         re['code'] = $('#code_transaction').val();
         re['note'] = note;
         re['customerId'] = customerId;
         $.ajax({
             url: '/api/transaction',
             type: 'POST',
             contentType: "application/json",
             data: JSON.stringify(re),
             dataType: 'json',
             success: function (response) {

                 var table = document.getElementById("transaction_table_" + response.code);
                 var row = table.insertRow(-1);
                 var cell1 = row.insertCell(0);
                 var cell2 = row.insertCell(1);
                 cell1.innerHTML = "<td>" + response.createdDate + "</td>";
                 cell2.innerHTML = "<td>" + response.note + "</td>";
                 console.log(response);
                 $("#transactionModal").modal('hide');
                 $("#note").val("");
             }
         });

     });*/


</script>
</body>
</html>