<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css?ver=1.2">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3-theme-blue-grey.css?ver=1">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.csss?ver=1" />
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>
<style>
	
</style>
<script>
	function mypagePro(num) {
		$(location).attr('href', 'mypagePro?num='+num+'');
	}
</script>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.authInfo.name !=null }">
			<div class="w3-top" >
			 <div class="w3-bar w3-theme-d2 w3-left-align w3-large" style="background-color:#000000;">
			  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
			  <a href="./" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>TODAY's Hot</a>
			  <a href="./main" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Account Settings"><i class="fa fa-user">My TimeLine</i></a>
			  <a href="./searching" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages"><i class="fa fa-search">Search</i></a>
			  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages" onclick="mypagePro('${sessionScope.authInfo.mem_num}')"><i class="fa fa-male">My Page</i></a>
			  <a href="./logout" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages"><i class="fa fa-close">Logout</i></a>
			 </div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="w3-top" >
			 <div class="w3-bar w3-theme-d2 w3-left-align w3-large" style="background-color:#000000;">
			  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
			  <a href="./" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>TODAY's Hot</a>
			  <a href="#" onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-black">Login</button>
			  <a href="./register/step1" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages" onclick="mypagePro('${sessionScope.authInfo.mem_num}')"><i class="fa fa-male">회원 가입</i></a>
			  <a href="./find/findId" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages" onclick="mypagePro('${sessionScope.authInfo.mem_num}')"><i class="fa fa-male">ID 찾기</i></a>
			  <a href="./find/findPass" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages" onclick="mypagePro('${sessionScope.authInfo.mem_num}')"><i class="fa fa-male">Password 찾기</i></a>
			 </div>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>