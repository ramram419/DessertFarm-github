<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DessertFarm</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/main/basic.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/main/login.css"/>">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$(function(){
				$("input[name=terms_ag]").change(function(){
					if($(this).val() == "ag"){
						$(".nextbtn").css({"background-color":"#e13517","color":"#ffffff"});
					}else{
						$(".nextbtn").css({"background-color":"#bbbbbb","color":"#000000"});
					}
				})
			})
			
			$(".nextbtn").click(function(){
				if($("input[name=terms_ag]:checked").val() == "nag"){
					alert("이용약관에 동의해주세요!");
				}else{
					location.href="${path}/register";
				}
			})
		})
	</script>
</head>
<body>
	<c:import url="../top.jsp"/>
	<div class="content">
		<div class="terms">
			<div class="terms_text">이용약관</div>
			<div class="termsbox">
				제1조 (목적)<br>
				이 약관은 (주)코리아센터(이하 “회사”라 함)가 제공하는 “공공배달 단골앱 서비스”(이하 “서비스”라 한다) 이용함에 회사와 이용자 간의 권리·의무 및 책임사항과 하나의 ID 및 Password로 통합하여 이용하는데 따른 이용조건 및 절차 등 기본적인 사항을 규정함을 목적으로 합니다.<br>
	   			<br>
				제2조(정의)<br>
				① “서비스”라 함은 회사가 재화, 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화, 용역을 거래할 수 있도록 설정한 가상의 영업장 또는 회사가 운영하는 서비스를 말하며, 통합된 하나의 회원계정(ID 및 비밀번호)을 이용하여 서비스를 제공받을 수 있는 아래의 서비스를 의미합니다.<br>
				   &nbsp;- “스탬프팡” 서비스<br>
				   &nbsp;- 회사와 제휴한 개별 지방자치단체의 공공배달앱 서비스
				② 회원이라 함은 사업자등록증을 소지하거나 사업자등록증을 발급 받을 수 있는 자로서, 서비스를 이용하고자 회사가 요구하는 정보를 기재하고, 이 약관에 동의한 자를 의미합니다.<br>
				③ 아이디(ID)라 함은 회원의 식별과 회원의 서비스 이용을 위하여 회원이 설정하고 회사가 승인하는 영문, 숫자 또는 영문과 숫자의 조합을 의미합니다.<br>
				④ 비밀번호(Password)라 함은 회원의 식별 및 비밀을 보호하기 위하여 회원이 스스로가 설정한 영문과 숫자의 조합을 의미합니다.<br>
				⑤	인증이라 함은 회원의 식별과 회원의 서비스이용을 위하여 회사가 요청하는 휴대전화번호를 이용하여 회원을 확인하는 절차를 의미합니다.<br>
				   <br>
				제3조 (약관의 효력 및 변경)<br>
				① 회사는 이 약관의 내용을 회원이 쉽게 알 수 있도록 구현 단말기에서 실행되는 스탬프팡앱을 통하여 게시하며, 이 약관은 회사가 게시함으로써 약관 시행일로부터 그 효력이 발생합니다.<br>
				② 회사는 약관의규제등에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있으며, 이 경우 개정내용, 적용일자 및 개정사유를 명시하여, 현행약관과 함께 서비스의 초기화면에 그 적용일자 최소 7일 이전부터 공지합니다. 단, 변경내용이 회원에게 불리한 내용이거나 이 약관의 중요한 부분이 변경되는 경우에는 이 약관의 변경 적용일자 최소 30일 이전부터 공지합니다.<br>
				③ 회원이 신설 또는 변경된 약관에 동의하지 않을 경우 회원탈퇴 내지 서비스 앱을 삭제하는 방식으로 서비스이용을 중단할 수 있으며, 신설 또는 변경된 약관의 효력발생일 이후에도 서비스를 계속 사용할 경우 약관의 변경사항에 동의한 것으로 간주됩니다.<br>
				   <br>
				제4조 (약관 외 준칙)<br>
				이 약관에서 정하지 않은 사항과 이 약관의 해석에 관하여 이견이 있는 때에는 기타 관계법령 또는 상관례에 따릅니다. <br>
				   <br>
				제5조 (통합회원제)
				① 회원은 통합된 하나의 계정(ID 및 비밀번호)을 통해 이 약관 제2조 제1항에 명기한 서비스를 이용할 수 있습니다. 단, 일부 서비스의 경우 서비스 제공을 위해 필요한 범위 내에서 회원에게 별도 또는 추가적인 가입절차를 요청할 수 있으며, 해당 서비스에 대한 이용약관 등이 이 약관보다 우선 적용됩니다. <br>
				② 회사는 회원이 사이트 및 서비스를 쉽게 이용할 수 있도록 회원의 ID를 포함한 통합회원제를 관리하거나 사이트 또는 서비스를 개선, 변경할 수 있습니다. <br>
				③ 회원의 최초 서비스 이용신청 이후 회사의 서비스가 늘어나거나 줄어든 경우에도 별도 약관으로 명시하지 않는 한 이 약관이 적용되며, 회사는 신규 서비스 개시에 대한 정보를 서비스에 공지하거나 회원의 전자우편으로 알릴 수 있습니다. <br>
				   <br>
				제6조 (회원가입신청)<br>
				① 회원가입은 이용자의 회원가입신청 및 이 약관과 회사의 개인정보처리방침에 대한 동의의 표시로써 이루어집니다.<br>
				② 회원가입은 핸드폰번호 단위로 신청하는 것을 원칙으로 하며, 이용자는 회원가입 시 실명인증 및 서비스의 원활한 운영을 위하여 회사가 요청하는 아래의 사항들에 대하여 기재하여야 합니다. 단, 필수항목과 선택항목은 각 서비스별로 별도 구분 및 관리됩니다. <br>
				  1. 아이디(ID) <br>
				  2. 비밀번호 <br>
				  3. 성명<br>
				  4. 업종 <br>
				  5. 상호 <br>
				③ 회사는 필요한 경우 위2항의 내용 이외에도 추가적인 정보를 요청할 수 있습니다.<br>
				④ 회사는 회원이 회원가입 시 기재한 모든 정보를 진실한 것으로 간주합니다. 따라서 허위의 정보를 기재한 회원은 그 고의∙과실 여부와 관계없이 서비스 이용 중에 허위의 정보와 관련하여 발생한 모든 분쟁 및 사고 등에 있어 법적인 보호를 받을 수 없으며, 회사 및 제3자에게 야기한 손해를 배상할 책임이 있고, 회사의 서비스 제공이 제한될 수 있습니다.<br> 
			</div>
			<div class="ag_btn">
				<label><input type="radio" name="terms_ag" value="ag"/>동의합니다</label>
				<label><input type="radio" name="terms_ag" value="nag" checked/>동의하지 않습니다.</label>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  </label>
			</div>
			<button class="nextbtn">다음</button>
		</div>
	</div>
	<c:import url="../footer.jsp"/>

</body>
</html>