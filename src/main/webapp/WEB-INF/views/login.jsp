<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
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
    <title>Đăng nhập</title>
</head>

<body>


<section class="vh-100">
    <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-9 col-lg-6 col-xl-5">
                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                     class="img-fluid" alt="Sample image">
            </div>
            <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1 text-center" style="padding-top: 100px">
                <div>
                    <c:if test="${param.incorrectAccount != null}">
                        <div class="alert alert-danger">
                            Username or Password incorrect
                        </div>
                    </c:if>
                    <c:if test="${param.accessDenied != null}">
                        <div class="alert alert-danger">
                            You Not Authorize
                        </div>
                    </c:if>
                    <c:if test="${param.sessionTimeout != null}">
                        <div class="alert alert-danger">
                            Session Timeout
                        </div>
                    </c:if>
                </div>
                <form action="j_spring_security_check" id="formLogin" method="post" style="">
                    <!-- Email input -->
                    <div class="form-floating mb-2">
                        <input type="text" id="form3Example3" class="form-control form-control-lg" name="j_username"
                               placeholder="Username" autocomplete="off" required/>
                        <label class="form-label" for="form3Example3">Username</label>
                    </div>

                    <!-- Password input -->
                    <div class="form-floating mb-2">
                        <input type="password" id="form3Example4" class="form-control form-control-lg" name="j_password"
                               placeholder="Mật khẩu" autocomplete="off" required/>
                        <label class="form-label" for="form3Example4">Password</label>
                    </div>

                    <div class="d-flex justify-content-between align-items-center">
                        <!-- Checkbox -->
                        <a href="#!" class="text-body">Forgot password?</a>
                    </div>

                    <div class="text-center text-lg-start mt-4 pt-2">
                        <button type="submit" class="btn btn-primary btn-lg"
                                style="padding-left: 2.5rem; padding-right: 2.5rem; margin: auto">Đăng nhập
                        </button>
                        <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a
                                href="<c:url value='/register'/>"
                                class="link-danger">Đăng
                            Ký</a></p>
                    </div>

                </form>

            </div>
        </div>
    </div>
</section>
</body>
</html>