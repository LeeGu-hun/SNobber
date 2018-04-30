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
<script type="text/javascript">
</script>
</head>
<body>
<form:form commandName="memberBean" action="deletemem">
<table style="margin: 0 auto;">
	<tr>
		<td>		
		<input type="hidden" name="mem_num" value="${member.mem_num}">
		</td>
	</tr>
	<p style="background-color: red; text-align: center; width: 500px; margin: 0 auto; font-size: 35px;">${member.mem_Nickname} 회원을 정지하시겠습니까?</p>
	<td colspan=2 style="text-align: center; background-color: yellow; width: 500px; font-size: 35px;">
		<input type="submit" value="정지">
		&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">돌아가기</a>
	</td>
</table>
</form:form>
</body>
</html>