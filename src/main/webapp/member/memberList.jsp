<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3-theme-blue-grey.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>회원 조회</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	
</script>
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
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" ver="1.2">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/min.css" />
<script src="${pageContext.request.contextPath}/js/common1.js?ver=2.6"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	function check(num,name){
		$('#title').attr("value", num);
		document.getElementById('myModald').style.display = 'block';
		$("#content").html(name+"님을 탈퇴 시키겠습니까?");
	}
	function deleteMem(){
		var name = $('#title').val();
		
		$.ajax({
			type : "POST",
			url : "./memberlist/deletemem",
			data : {
				name : name
			},
			success : deleteMem2
		});
	}
	function deleteMem2() {
		$(location).attr('href', './memberlist');
	}
</script>
<body>
	<%@ include file="/include/headerAdmin.jsp"%>
	<div style="margin-top:100px;">
	<c:if test="${! empty members}">
		<table class="w3-table w3-bordered">
			<tr>
				<th>아이디</th>
				<th>이메일</th>
				<th>이름</th>
				<th>소개</th>
				<th>상태</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="mem" items="${members}">
				<tr>
					<th><a
						href="<c:url value="/memberdetail/${mem.mem_Id}"/>">${mem.mem_Id}</a></th>
					<th>${mem.mem_Email}</th>
					<th>${mem.mem_Nickname}</th>
					<th>${mem.mem_Introduce}</th>
					<th>${mem.mem_Condition}</th>
					<th>
						<button type="button" class="btn btn-default" onclick="check('${mem.mem_Id}','${mem.mem_Nickname}')">삭제</button>
					</th>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	</div>
	
	<div id="myModald" class="w3-modal">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span
					onclick="document.getElementById('myModald').style.display='none'"
					class="w3-button w3-display-topright">&times;</span> 
					<input type="hidden" id="title" name="title" />
				<p id="content"></p>
				<div id="lightBoxOK">
					<h4 id="content"></h4>
					<input type="button" value="확인" onclick="deleteMem()" style="text-align: right;"> 
					<input type="button" onclick="document.getElementById('myModald').style.display='none'" value="취소">
				</div>
				<p>&nbsp;</p>
			</div>
		</div>
	</div>
</body>
</html>