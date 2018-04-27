<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

  <p><img src="${pageContext.request.contextPath}/${member.mem_Photo}" style="max-width: 200px; height: 250px; border-radius: 45%; margin-left:100px"></p>
  <p style="margin-left:100px">아이디: ${member.mem_Id}</p>
	<p style="margin-left:100px">이메일: ${member.mem_Email}</p>
	<p style="margin-left:100px">이름: ${member.mem_Nickname}</p>
	<p style="margin-left:100px">소개: ${member.mem_Introduce}</p>
	<p style="margin-left:100px">상태: ${member.mem_Condition}</p>
	<a href="<c:url value='/deletemember/${member.mem_num}'/>" style="margin-left:100px">[정지]</a>
	<a href="<c:url value='/repairmember/${member.mem_num}'/>" style="margin-left:100px">[복구]</a>
	<a href="javascript:history.back();" style="margin-left:100px">[뒤로]</a>
	
	</form:form>
</div>





	
	 
	
</body>
</html>