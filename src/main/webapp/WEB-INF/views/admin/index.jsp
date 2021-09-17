<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Dessert Farm</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path }/resources/admin/images/favicon.png">
    <link href="<c:url value="/resources/admin/vendor/pg-calendar/css/pignose.calendar.min.css"/>"" rel="stylesheet">
    <link href="<c:url value="/resources/admin/vendor/chartist/css/chartist.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/admin/css/style.css"/>" rel="stylesheet">

</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->


    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <a href="index2.html" class="brand-logo">
                <img class="logo-abbr" src="${path }/resources/admin/images/logo.png" alt="">
                <img class="logo-compact" src="${path }/resources/admin/images/logo-text.png" alt="">
                <img class="brand-title" src="${path }/resources/admin/images/logo-text.png" alt="">
            </a>

            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
                </div>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
        <div class="header">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
                        </div>
                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown notification_dropdown">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-bell"></i>
                                    <div class="pulse-css"></div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <ul class="list-unstyled">
                                        <li class="media dropdown-item">
                                            <span class="success"><i class="ti-user"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>전체공지</strong> 디저트팜 신규오픈 안내</p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item dropdown header-profile">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-account"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a href="./app-profile.html" class="dropdown-item">
                                        <i class="icon-user"></i>
                                        <span class="ml-2">Profile </span>
                                    </a>
                                    <a href="./page-login.html" class="dropdown-item">
                                        <i class="icon-key"></i>
                                        <span class="ml-2">Logout </span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="quixnav">
            <div class="quixnav-scroll">
                <ul class="metismenu" id="menu">
                    <li class="nav-label first">메인메뉴</li>
                    <li><a href="./admin22?c=1-1"><i
                                class="icon icon-app-store"></i><span class="nav-text">대쉬보드</span></a>
                    </li>
                    <li class="nav-label">상점</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-single-04"></i><span class="nav-text">상점설정</span></a>
                        <ul aria-expanded="false">
                            <li><a href="./admin22?c=2-1">기본정보설정</a></li>
                            <li><a href="./admin22?c=2-2">배송/반폼/교환 설정</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">주문</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-layout-25"></i><span class="nav-text">주문/배송/문의관리</span></a>
                        <ul aria-expanded="false">
                            <li><a href="./admin22?c=3-1">주문관리</a></li>
                            <li><a href="./admin22?c=3-2">배송관리</a></li>
                            <li><a href="./admin22?c=3-3">문의관리</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">상품</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-form"></i><span class="nav-text">상품관리</span></a>
                        <ul aria-expanded="false">
                            <li><a href="./admin22?c=4-1">메뉴등록 리스트</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
            	<c:choose>
            		<c:when test="${c eq '1-1'}">
            			<c:import url="./dashboard.jsp" charEncoding="UTF-8"></c:import>
            		</c:when>
            		<c:when test="${c eq '2-1'}">
            			<c:import url="./info.jsp" charEncoding="UTF-8"></c:import>
            		</c:when>
            		<c:when test="${c eq '2-2'}">
            			<c:import url="./setting.jsp" charEncoding="UTF-8"></c:import>
            		</c:when>
            		<c:when test="${c eq '3-1'}">
            			<c:import url="./orderlist.jsp" charEncoding="UTF-8"></c:import>
            		</c:when>
            		<c:when test="${c eq '3-2'}">
            			<c:import url="./deliverylist.jsp" charEncoding="UTF-8"></c:import>
            		</c:when>
            		<c:when test="${c eq '3-3'}">
            			<c:import url="./qnalist.jsp" charEncoding="UTF-8"></c:import>
            		</c:when>
            		<c:when test="${c eq '4-1'}">
            			<c:import url="./addMenu.jsp" charEncoding="UTF-8"></c:import>
            		</c:when>
            	</c:choose>
            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->


        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="#" target="_blank">DESSERTFARM</a> 2021</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->

        <!--**********************************
           Support ticket button start
        ***********************************-->

        <!--**********************************
           Support ticket button end
        ***********************************-->


    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="<c:url value="/resources/admin/vendor/global/global.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/js/quixnav-init.js"/>"></script>
    <script src="<c:url value="/resources/admin/js/custom.min.js"/>"></script>

    <script src="<c:url value="/resources/admin/vendor/chartist/js/chartist.min.js"/>"></script>

    <script src="<c:url value="/resources/admin/vendor/moment/moment.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/vendor/pg-calendar/js/pignose.calendar.min.js"/>"></script>

    <script src="<c:url value="/resources/admin/js/dashboard/dashboard-2.js"/>"></script>
    <!-- Circle progress -->

    <!-- Chart ChartJS plugin files -->
    <script src="<c:url value="/resources/admin/vendor/chart.js/Chart.bundle.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/js/plugins-init/chartjs-init.js"/>"></script>

</body>

</html>