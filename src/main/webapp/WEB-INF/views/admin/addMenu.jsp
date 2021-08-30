<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<div class="row">
  <div class="col-xl-12 col-xxl-12">
      <div class="card">
          <div class="card-header">
              <h4 class="card-title">메뉴 등록</h4> 
          </div>
          <div class="card-body">
	          <div>
	              <section>
	                  <div>
	                      <div class="input-group col-lg-7 mb-4">
	                          <div class="input-group-prepend">
	                              <span class="input-group-text">대표이미지</span>
	                          </div>
	                          <div class="custom-file">
	                              <input type="file" class="custom-file-input">
	                              <label class="custom-file-label"></label>
	                          </div>
	                      </div>
	                      <div class="input-group col-lg-7 mb-4">
	                          <div class="input-group-prepend">
	                              <span class="input-group-text">추가이미지</span>
	                          </div>
	                          <div class="custom-file">
	                              <input type="file" class="custom-file-input">
	                              <label class="custom-file-label"></label>
	                          </div>
	                      </div>
	                      <div class="col-lg-7 row">
	                      	<div class="choose col-lg-6 mb-4">
	                           <label class="text-label">카테고리</label>
	                           <select id="inputState" class="form-control">
	                               <option>케이크</option>
	                               <option>베이커리</option>
	                               <option>디저트</option>
	                               <option>샌드위치</option>
	                               <option>원두</option>
	                           </select>
	                       </div>
	                       <!-- 카테고리에 맞는 부 카테고리가 나오게끔 하면 좋을것 같다! -->
	                       <div class="choose col-lg-6 mb-4">
	                           <label class="text-label">카테고리</label>
	                           <select id="inputState" class="form-control">
	                               <option>무스케이크</option>
	                               <option>쉬폰케이크</option>
	                               <option>치즈케이크</option>
	                               <option>초코케이크</option>
	                               <option>버터케이크</option>
	                               <option>롤케이크</option>
	                               <option>컵케이크</option>
	                               <option>티라미수</option>
	                               <option>카스테라</option>
	                               <option>크레이프</option>
	                           </select>
	                       </div>
	                      </div>
	                      <div class="col-lg-7 mb-4">
	                          <div class="form-group">
	                              <label class="text-label">메뉴명</label>
	                              <input type="text" name="menuname" class="form-control" placeholder="" required>
	                          </div>
	                      </div>
	                      <div class="col-lg-7 mb-4">
	                          <div class="form-group">
	                              <label class="text-label">단위</label>
	                              <div class="input-group">
	                                  <input type="number" class="form-control" id="inputGroupPrepend2" required>
	                              </div>
	                          </div>
	                      </div>
	                      <div class="col-lg-7 mb-4">
	                          <div class="form-group">
	                              <label class="text-label">가격</label>
	                              <div class="input-group">
	                                  <input type="number"  class="form-control" id="inputGroupPrepend2" required>
	                              </div>
	                          </div>
	                      </div>
	                      <div class="col-lg-7 mb-4">
	                          <div class="form-group">
	                              <label class="text-label">옵션</label>
	                              <div class="input-group">
	                                  <input type="TEXT" class="form-control" id="inputGroupPrepend2" required>
	                              </div>
	                          </div>
	                      </div>
	                      <div class="col-lg-12 mb-4">
	                          <div class="form-group">
	                              <label class="text-label">상품내용</label>
	                              <div class="input-group">
	                                  <textarea class="form-control" rows="7" id="comment" style="margin-top: 0px; margin-bottom: 0px; height: 400px;" required></textarea>
	                                </div>
	                            </div>
	                            <div class="col-lg-12 mb-4 ml-2">
	                                <input class="form-check-input" type="checkbox" id="basic_checkbox_1">사업자전용 
	                            </div>
	                            
	                            <button type="submit" class="btn btn-primary">등록</button>
	                            <button type="submit" class="btn btn-light">취소</button>
	                        </div>
	                        
	                    </div>
	                </section>
	            </div>
            </div>
        </div>
    </div>
</div>