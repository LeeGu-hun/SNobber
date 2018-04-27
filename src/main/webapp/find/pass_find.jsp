<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>타이틀이다.</title>
</head>
<body>
<%@include file="../include/joinHeader.jsp" %></div>
	<div style="margin-top:150px; margin-left:100px">
	<p>고객님의 비밀번호는${find.mem_Password}입니다.</p>
	</div>
	<div>

		<%@ include file="/include/footer2.jsp"%>

	</div>
</body>
</html>