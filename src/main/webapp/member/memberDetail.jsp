<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/w3-theme-blue-grey.css">
<link rel="stylesheet"	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" media="all" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"
	type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/css/style.css"	rel="stylesheet" ver="1.2">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/min.css" />
<script src="${pageContext.request.contextPath}/js/common1.js?ver=2.6"></script>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>회원 정보</title>
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-flat.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
<style type="text/css">
	/* #detail{
		text-align: center;
		margin: 0 auto;
		background-color: silver;
	} */
</style>
<script type="text/javascript">
</script>
</head>
<body>
<%@ include file="/include/headerAdmin.jsp"%>
	<form:form commandName="member" id="detail">
	<div class="w3-container w3-flat-wet-asphalt" style="width:50%; margin-top:100px; margin-left:350px;">

  <p>
  <c:if test="${member.mem_Photo != null}">
  <img src="${pageContext.request.contextPath}/${member.mem_Photo}" style="max-width: 200px; height: 200px; border-radius: 45%; margin-left:100px">
  </c:if>
  <c:if test="${member.mem_Photo == null}">
  <img src="${pageContext.request.contextPath}/image/basic.png" style="max-width: 200px; height: 200px; border-radius: 45%; margin-left:100px">
  </c:if>
  </p>
  <p style="margin-left:100px">아이디: ${member.mem_Id}</p>
	<p style="margin-left:100px">이메일: ${member.mem_Email}</p>
	<p style="margin-left:100px">이름: ${member.mem_Nickname}</p>
	<p style="margin-left:100px">소개: ${member.mem_Introduce}</p>
	<p style="margin-left:100px">상태: ${member.mem_Condition}</p>
	<div style="text-align: center;">
	<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModals">[정지]</button>&nbsp;
	<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModalr">[복구]</button>&nbsp;
	<a href="javascript:history.back();" class="btn btn-default btn-xs">[뒤로]</a>
	</div>
	</div>

	</form:form>
	<!-- 수정 모달 -->
	<div class="modal fade" id="myModals" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">회원 권한 변경</h4>
					</div>
				<div class="modal-body">
					<p><%@ include file="stopMember.jsp"%></p>
				</div>
				</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModalr" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">회원 권한 변경</h4>
					</div>
				<div class="modal-body">
					<p><%@ include file="repairMember.jsp"%></p>
				</div>
				</div>
		</div>
	</div>





	
	 
	
</body>
</html>