<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.laptrinhjavaweb.security.utils.SecurityUtils" %>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="<c:url value='/trang-chu'/>">Royal<span>estate</span></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a href="<c:url value='/trang-chu'/>" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="<c:url value='/property'/>" class="nav-link">Property</a></li>
                <li class="nav-item"><a href="<c:url value='/agents'/>" class="nav-link">Agents</a></li>
                <li class="nav-item"><a href="<c:url value='/about'/>" class="nav-link">About</a></li>
                <li class="nav-item"><a href="<c:url value='/blog'/>" class="nav-link">Blog</a></li>
                <li class="nav-item"><a href="<c:url value='/contact'/>" class="nav-link">Contact</a></li>
                <li class="nav-item"><a href="<c:url value='/card'/>" class="nav-link">Card</a></li>

                <security:authorize access="isAnonymous()">
                    <li class="nav-item cta"><a href="<c:url value='/login'/>" class="nav-link ml-lg-2"><span
                            class="icon-user"></span> Sign-In</a></li>
                    <li class="nav-item cta cta-colored"><a href="<c:url value='/register'/>" class="nav-link"><span
                            class="icon-pencil"></span> Sign-Up</a></li>
                </security:authorize>
                <security:authorize access="isAuthenticated()">
                    <li class="nav-item cta"><a class="nav-link"
                                                href="#">Wellcome <%=SecurityUtils.getPrincipal().getFullName()%>
                    </a></li>
                    <li class="nav-item cta"><a class="nav-link" href="<c:url value='/logout'/>">Thoát</a></li>
                </security:authorize>

            </ul>
        </div>
    </div>
</nav>

