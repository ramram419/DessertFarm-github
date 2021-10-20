<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="<c:url value="/resources/js/code.json"/>" type="text/javascript"></script>

<script>
		
        function itemChange() {
            var cake = ["무스케이크","쉬폰케이크","치즈케이크","초코케이크","파운드케이크","버터케이크","스펀지케이크","롤케이크","컵케이크","티라미수","카스텔라"
        ,"크레이프","타르트"]
        var bakery = ["크로플","에그타르트","마들렌","머핀","도넛","쿠키","플레인","베이글","크로칸슈","몽블랑","브라우니","식빵","샌드위치","크로아상","와플","스콘"]
        var sangji = ["크로아상","타르트/파이","스콘/볼","식빵"]
        var dessert = ["마카롱","뚱카롱","다쿠아즈","오믈렛","초콜릿","슈크림","아이스크림"]
        var sandwich = ["샌드위치","치아바타","크로크무슈"]
        var beans = ["원두"]
        var etc = ["기타"]

        var selectItem = $("#inputState").val();
        console.log(selectItem);
        var selectItem2;

        if ( selectItem == "케이크") {
            selectItem2 = cake;
        } else if(selectItem == "베이커리") {
            selectItem2 = bakery;
        } else if (selectItem == "생지") {
            selectItem2 = sangji;
        } else if (selectItem == "디저트") {
            selectItem2 = dessert;
        } else if (selectItem == "샌드위치") {
            selectItem2 = sandwich;
        } else if (selectItem == "원두") {
            selectItem2 = beans;
        } else if (selectItem == "기타") {
            selectItem2 = etc;
        }
        console.log(selectItem2.length);

        $('#inputState2').empty();
        for (var i=0; i<selectItem2.length; i++) {
            var option = $("<option>"+selectItem2[i]+"</option>")
            $("#inputState2").append(option);
        }

        };
   
        function nullCheck() {
            if ($('.name').val() == "") {
                alert("상품 이름을 입력하세요")
                history.go(-1)
            } else if ($('.category1').val() == "" || $('.category1').val() == null) {
                alert("상품 카테고리를 선택하세요")
                history.go(-1)
            } else if ($('.category2').val() == null || $('.category2').val() == "" ) {
                alert("상품 카테고리를 선택하세요")
                history.go(-1)
            } else if ($('.price').val() == "") {
                alert("상품 가격을 입력하세요")
                history.go(-1)
            } else if ($('.value').val() == "") {
                alert("상품 내용을 입력하세요")
                history.go(-1)
            }
        }
        
       function categoryConvert() {
            const code = JSON.parse(JSON.stringify(Params))
            $('#categoryCode').val(code[$('#inputState2').val()])
            alert($('#categoryCode').val());
       }
        
       function loadFile (input) {
    	   var str = "";
    	   var file = input.files;
    	   for (var i=0; i<file.length; i++) {
    		   console.log(file[i].name);
    		   str += (i+1) + "." + file[i].name + " ";
    	   }
    	   console.log(str);
			$(input).next().html(str)    	   
       }
       
       function isOnlyb(box) {
    	   var isCk =  $('input:checkbox[id="basic_checkbox_1"]').is(":checked");
    	   console.log(isCk);
    	   if (isCk == true)
    	   $(box).val(true);
    	   else 
    	   $(box).val(false);
    	   console.log($(box).val())
       }
      
       
   </script>

<div class="row">
  <div class="col-xl-12 col-xxl-12">
      <div class="card">
          <div class="card-header">
              <h4 class="card-title">메뉴 등록</h4> 
          </div>
          <div class="card-body">
	          <div>
	              <section>
	              
	              <form name="frm" action="${path }/product/register" method="post" encType="multipart/form-data">
	                  <div>
	                      <div class="input-group col-lg-7 mb-4">
	                          <div class="input-group-prepend">
	                              <span class="input-group-text">대표이미지</span>
	                          </div>
	                          <div class="custom-file">
	                              <input type="file" class="custom-file-input" name="product_thumb" onChange="loadFile(this);" />
	                              <label class="custom-file-label"></label>
	                          </div>
	                      </div>
	                      <div class="input-group col-lg-7 mb-4">
	                          <div class="input-group-prepend">
	                              <span class="input-group-text">추가이미지</span>
	                          </div>
	                          <div class="custom-file">
	                              <input type="file" class="custom-file-input" name="product_images" multiple  onChange="loadFile(this);" />
	                              <label class="custom-file-label"></label>
	                          </div>
	                      </div>
	                      <div class="col-lg-7 row">
	                      	<div class="choose col-lg-6 mb-4">
	                           <label class="text-label">카테고리</label>
	                           <select id="inputState" class="form-control" name="category1" onChange="itemChange();">
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
	                           <select id="inputState2" class="form-control" name="category2">
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
	                      <input type="hidden" name="categoryCode" id="categoryCode">
	                      <div class="col-lg-7 mb-4">
	                          <div class="form-group">
	                              <label class="text-label">메뉴명</label>
	                              <input type="text" name="product_name" class="form-control" placeholder="" required>
	                          </div>
	                      </div>
	                      <div class="col-lg-7 mb-4">
	                          <div class="form-group">
	                              <label class="text-label">단위</label>
	                              <div class="input-group">
	                                  <input type="number" class="form-control" id="inputGroupPrepend2" name="product_unit" required>
	                              </div>
	                          </div>
	                      </div>
	                      <div class="col-lg-7 mb-4">
	                          <div class="form-group">
	                              <label class="text-label">가격</label>
	                              <div class="input-group">
	                                  <input type="number"  class="form-control" id="inputGroupPrepend2" name="product_price" required>
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
	                                  <textarea name="product_value" class="form-control" rows="7" id="comment" style="margin-top: 0px; margin-bottom: 0px; height: 400px;" required></textarea>
	                                </div>
	                            </div>
	                            <div class="col-lg-12 mb-4 ml-2">
	                                <input name="product_only_b" class="form-check-input" type="checkbox" id="basic_checkbox_1" value="0" onClick="isOnlyb(this);">사업자전용 
	                            </div>
	                           
	                            <button type="submit" class="btn btn-primary" onclick="categoryConvert();">등록</button>
	                            <button type="submit" class="btn btn-light">취소</button>
	                        </div>
	                        <button type="submit">ddd</button>
	                    </div>
	                    </form>
	                </section>
	            </div>
            </div>
        </div>
    </div>
</div>