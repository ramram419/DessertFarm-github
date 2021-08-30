<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />




<div class="row page-titles mx-0">
    <div class=" p-md-2">
        <div class="welcome-text">
            <h4><strong>안녕하세요. 디저트팜입니다.</strong></h4>
            <p class="mb-0">디저트팜 웹사이트 신규 오픈! 다양한 서비스를 이용해보세요.</p>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-3 col-sm-6">
        <div class="card">
            <div class="stat-widget-one card-body">
                <div class="stat-icon d-inline-block">
                    <i class="ti-money text-success border-success"></i>
                </div>
                <div class="stat-content d-inline-block">
                    <div class="stat-text">판매중인 상품 수</div>
                    <div class="stat-digit">86</div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-sm-6">
        <div class="card">
            <div class="stat-widget-one card-body">
                <div class="stat-icon d-inline-block">
                    <i class="ti-user text-primary border-primary"></i>
                </div>
                <div class="stat-content d-inline-block">
                    <div class="stat-text">오늘주문건 수</div>
                    <div class="stat-digit">12</div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-sm-6">
        <div class="card">
            <div class="stat-widget-one card-body">
                <div class="stat-icon d-inline-block">
                    <i class="ti-layout-grid2 text-pink border-pink"></i>
                </div>
                <div class="stat-content d-inline-block">
                    <div class="stat-text">누적주문건 수</div>
                    <div class="stat-digit">770</div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-sm-6">
        <div class="card">
            <div class="stat-widget-one card-body">
                <div class="stat-icon d-inline-block">
                    <i class="ti-link text-danger border-danger"></i>
                </div>
                <div class="stat-content d-inline-block">
                    <div class="stat-text">일일 문의건 수</div>
                    <div class="stat-digit">6</div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-12">
        <div class="row">
            <div class="col-lg-6 col-sm-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">주간 주문건수</h4>
                    </div>
                    <div class="card-body">
                        <canvas id="barChart_1"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-sm-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">월간 주문건수</h4>
                    </div>
                    <div class="card-body">
                        <canvas id="barChart_2"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>