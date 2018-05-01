
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!DOCTYPE html>
<html lang="ko">
<title>SNobber</title>
<metahttp-equiv ="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3-theme-blue-grey.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: "Open Sans", sans-serif
}
</style>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<script src="${pageContext.request.contextPath}/js/scriptSc.js?ver=2"></script>
<script type="text/javascript">
	function toggle() {
		document.getElementById('writeDiv').style.display = 'block';
	}
	function hide() {
		document.getElementById("writeDiv").style.display = 'none';
	}
</script>
<body class="w3-theme-l5">

	<c:if test="${sessionScope.authInfo.mem_num == 3}">
		<div>
			<%@ include file="/include/headerAdmin.jsp"%>
		</div>
	</c:if>
	<c:if test="${sessionScope.authInfo.mem_num != 3}">
		<div>
			<%@ include file="/include/header.jsp"%>
		</div>
		<br>
		<div style="margin-left: 10px;margin-top: 60px;">
			<input type="radio" id="timeline" value="timeline" name="list"
				onclick="javascript:contentsView(timeline);" checked>타임라인
			보여주기 <input type="radio" id="foldertimeline" value="foldertimeline"
				name="list" onclick="javascript:contentsView(foldertimeline);">팔로한
			폴더 보여주기
		</div>
		<div class="w3-row-padding" style="margin-top: 100px;">
			<div class="w3-col m12" style="width: 60%; ">
				<div class="w3-card w3-round w3-white" style="width: 80%; margin-left: 360px; text-align: center;">
					<div class="w3-container w3-padding">
						<a href="#" onclick="toggle()"> 글 작성</a>
						<div id="writeDiv" style="display: none">
							<%@ include file="/board/board_write.jsp"%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>


	<!-- Navbar -->

	<!-- Page Container -->
	<c:if test="${sessionScope.authInfo.mem_num != 3}">
	<div style="width: 80%; height: 100%; width: 100%;">

		<div id="followList" >
			<%@ include file="/include/boardList.jsp"%>
			<!--팔로 리스트 보여줌 -->
		</div>



		<div id="followFolderList" style="display: none; width: 60%; margin-left: 100px"">
			<%@ include file="/include/followFolderList.jsp"%></div>
	</div>
	</c:if>
	<br>
	<br>

	<!-- Footer -->
	<div>

		<%@ include file="/include/footer.jsp"%>

	</div>

	<script>
		// Accordion
		function myFunction(id) {
			var x = document.getElementById(id);
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
				x.previousElementSibling.className += " w3-theme-d1";
			} else {
				x.className = x.className.replace("w3-show", "");
				x.previousElementSibling.className = x.previousElementSibling.className
						.replace(" w3-theme-d1", "");
			}
		}

		// Used to toggle the menu on smaller screens when clicking on the menu button
		function openNav() {
			var x = document.getElementById("navDemo");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}
	</script>

</body>
</html>
