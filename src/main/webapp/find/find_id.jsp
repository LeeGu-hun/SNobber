<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FInd Id</title>
</head>
<body>
<div><%@include file="../include/joinHeader.jsp" %></div>
	<div style="margin-top:150px; margin-left:100px"><form:form commandName="registerRequest" action="idFind">
		<p>ID 찾기</p>
		<p>
			<label>이름:<br>
			<form:input path="mem_Name"/>
			<form:errors path="mem_Name" />
			</label>
		</p>
		<p>
			<label>이메일:<br>
			<form:input path="mem_Email"/>
			<form:errors path="mem_Email" />
			</label>
		</p>
		<input type="submit" value="확인" />
	</form:form></div>
	<div>

		<%@ include file="/include/footer2.jsp"%>

	</div>
</body>
</html>