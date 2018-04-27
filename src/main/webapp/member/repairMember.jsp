<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>     
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>타이틀이다.</title>
</head>
<body>
<form:form commandName="member" name="modifyForm" method="post">
<table style="margin: 0 auto;">
	<p style="background-color: lime; text-align: center; width: 500px; margin: 0 auto; font-size: 35px;">해당 회원을 복구하시겠습니까?</p>
	<td colspan=2 style="text-align: center; background-color: yellow; width: 500px; font-size: 35px;">
		<a href="javascript:modifyForm.submit()">복구</a>
		&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">돌아가기</a>
	</td>
</table>
</form:form>
</body>
</html>