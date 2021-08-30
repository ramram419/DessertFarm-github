<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />




<div class="row page-titles mx-0">
	<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0">
	    <ol class="breadcrumb">
	        <li class="breadcrumb-item"><a href="javascript:void(0)">상점설정</a></li>
	        <li class="breadcrumb-item active"><a href="javascript:void(0)">배송/반품/교환 설정</a></li>
	    </ol>
	</div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">기본정보</h4>
            </div>
            <div class="card-body">
                <div class="form-validation">
                    <form class="form-valide" action="#" method="post">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="val-email">배송 안내<span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-6">
                                        <textarea class="form-control" id="val-suggestions" name="val-suggestions" rows="5" placeholder="배송 안내를 입력해주세요."></textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="val-email">반품/교환 안내<span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-6">
                                        <textarea class="form-control" id="val-suggestions" name="val-suggestions" rows="5" placeholder="반품/교환 안내를 입력해주세요."></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>