<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="signUpURL" value='/register'/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style>
        .divider:after,
        .divider:before {
            content: "";
            flex: 1;
            height: 1px;
            background: #eee;
        }

        .h-custom {
            height: calc(100% - 73px);
        }

        @media (max-width: 450px) {
            .h-custom {
                height: 100%;
            }
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đăng kí</title>
</head>

<body>

<%-- Hiển thị thông báo lỗi nếu có --%>


<section class="vh-100">
    <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-9 col-lg-6 col-xl-5">
                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                     class="img-fluid" alt="Sample image">
            </div>
            <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                    <% if (request.getParameter("error") != null) { %>
                    <p style="color: red;">Tên đăng nhập đã tồn tại. Vui lòng chọn tên đăng nhập khác.</p>
                    <% } %>
                    <%-- Hiển thị thông báo thành công nếu có --%>
                    <% if (request.getParameter("success") != null) { %>
                    <p style="color: green;">Đăng kí thành công.</p>
                    <% } %>  <%-- Form đăng kí --%>
                <form method="post" action="<c:url value="/register"/>">
                    <!-- Username input -->
                    <div class="form-floating mb-2" style="margin-top: 100px">

                        <input type="text" id="form3Example3" class="form-control form-control-lg"
                                name="fullName" placeholder="Username" required >
                        <label class="form-label" for="form3Example3">Tên đăng nhập</label>
                    </div>

                    <!-- Email input -->
                    <div class="form-floating mb-2">

                        <input type="email" id="username" class="form-control form-control-lg"
                               name="userName" placeholder="Username" required>
                        <label class="form-label" for="username">Email</label>
                    </div>


                    <div class="form-floating mb-2 ">

                        <input type="password" id="password" class="form-control form-control-lg"
                               name="password" placeholder="Password" required>
                        <label class="form-label" for="password">Mật khẩu</label>
                    </div>


                    <div class="text-center text-lg-start mt-4 pt-2">
                        <input class="btn btn-primary btn-lg"
                               type="submit" value="Đăng kí" style="padding-left: 2.5rem; padding-right: 2.5rem;">
                        <p class="small fw-bold mt-2 pt-1 mb-0">Đã có tài khoản? <a href="<c:url value='/login'/>"
                                                                                          class="link-danger">Đăng Nhập</a></p>
                    </div>

                </form>

            </div>
        </div>
    </div>
</section>
</body>
</html>