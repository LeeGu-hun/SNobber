<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			</tr>

			<c:forEach var="mem" items="${members}">
				<tr>
					<th><a
						href="<c:url value="/member/detail/${mem.mem_Id}"/>">${mem.mem_Id}</a></th>
					<th>${mem.mem_Email}</th>
					<th>${mem.mem_Nickname}</th>
					<th>${mem.mem_Introduce}</th>
					<th>${mem.mem_Condition}</th>
				</tr>
			</c:forEach>


		</table>



	</c:if>
	</div>
</body>
</html>