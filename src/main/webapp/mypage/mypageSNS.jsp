<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
<script src="${pageContext.request.contextPath}/js/common.js?ver=2.2"></script>
<link rel="stylesheet"href="${pageContext.request.contextPath}/resources/css/min.css" ver="1.2" />


<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}
</style>

<script>
	function mypagePro(num) {
		$(location).attr('href', './mypagePro?num=' + num + '');
	}
	function mypageSNS(num) {
		$(location).attr('href', './mypageSNS?num=' + num + '');
	}
	function stBoard(num) {
		$(location).data("num", num);
		$(location).attr('href', './mypageWritingView?num=' + num + '');
	}
</script>
<script type="text/javascript">
	function ingShow(num) {
		$('#boNum').attr("value", num);
		$('#lightBoxOK').attr("value", num);

		$("#content").html("정말 삭제하시겠습니까?");
		document.getElementById('myModal').style.display = 'block';
		//modal을 띄워준다.  	    
	}
	function boardDelete() {
		var num = $('#boNum').attr("value");
		var id = "Like";

		$.ajax({
			type : "POST",
			url : "./mypageBoardDelete",
			data : {
				id : id,
				num : num
			},
			success : boardDelete2
		});
	}
	function boardDelete2(num) {
		var next = $('.next').val();

		$(location).attr('href', './mypageSNS?num=' + next + '');
	}
</script>


<body class="w3-light-grey w3-content"  style="max-width: 100%">

	<%@ include file="/include/header.jsp"%>
	<input class="next" value="${member.mem_num}" style="display: none;">	
	<!-- Overlay effect when opening sidebar on small screens -->

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-right: 100px; margin-left: 100px; margin-top: 100px;">

		<!-- Header -->
		<header id="portfolio">
			<div class="w3-container">
				<h1>
					<b>SNS</b>
				</h1>
				<div class="w3-section w3-bottombar w3-padding-16">
					<span class="w3-margin-right">Filter:</span>
					<button class="w3-button w3-white w3-hide-small"
						onclick="mypagePro('${member.mem_num}')">
						<i class="fa fa-photo w3-margin-right"></i> 
							SNol
					</button>
					<button class="w3-button w3-white w3-hide-small"
						onclick="mypageSNS('${member.mem_num}')">
						<i class="fa fa-map-pin w3-margin-right"></i> 
							SNS
					</button>
				</div>
			</div>
		</header>

		<!-- First Photo Grid-->
		<div id="columns">
			<c:if test="${empty boardSNS }">
				<p>등록된 글이 없습니다.</p>
			</c:if>
			<c:forEach var="bo" items="${boardSNS }">
				<figure>
					<img src="${pageContext.request.contextPath}/${bo.board_File }" 
							onclick="stBoard('${bo.board_Num}')"/>
					<figcaption>
						<p class="content" onclick="stBoard('${bo.board_Num}')">
							${bo.board_Content }
						</p>
						<span>
							조회수 : ${bo.board_Read_Count}
						</span>
						<div style="text-align: right;">
							<span style="font-size: 0.8em;">
								${bo.board_Date } &nbsp;&nbsp;
							</span>
							<c:if test="${host eq bo.mem_Num }">
								<span onclick="boardNum(${bo.board_Num})" style="text-align: right; font-size: 0.8em;">
									Edit
								</span>
								<span class="boardD" onclick="ingShow('${bo.board_Num}')" style="text-align: right; font-size: 0.8em;">
									Delete
								</span>									
							</c:if>
						</div>
					</figcaption>							
				</figure>
			</c:forEach>
		</div>
		<!-- Modal -->
		<div id="myModal" class="w3-modal">
			<div class="w3-modal-content">
				<div class="w3-container">
					<span
						onclick="document.getElementById('myModal').style.display='none'"
						class="w3-button w3-display-topright">&times;</span> <input
						type="hidden" id="title" name="title" />
					<p id="content"></p>
					<input type="hidden" id="boNum" name="boNum" />
					<div id="lightBoxOK">
						<input type="button" value="확인" onclick="boardDelete()" style="text-align: right;"> 
						<input type="button" onclick="document.getElementById('myModal').style.display='none'" value="취소">
					</div>
					<p>&nbsp;</p>
				</div>
			</div>
		</div>
		
	</div>

	<!-- Pagination -->
	<div class="w3-center w3-padding-32">
		<div class="w3-bar">
			<a href="#" class="w3-bar-item w3-button w3-hover-black">«</a> 
			<a href="#" class="w3-bar-item w3-black w3-button">1</a> 
			<a href="#"class="w3-bar-item w3-button w3-hover-black">2</a> 
			<a href="#"class="w3-bar-item w3-button w3-hover-black">3</a> 
			<a href="#"class="w3-bar-item w3-button w3-hover-black">4</a> 
			<a href="#"class="w3-bar-item w3-button w3-hover-black">»</a>
		</div>
	</div>

	<!-- Images of Me -->
	<div class="w3-row-padding w3-padding-16" id="about">
		<div class="w3-col m6"></div>
	</div>

	<div class="w3-container w3-padding-large" style="margin-bottom: 32px">
		<%@ include file="../include/footer.jsp"%>
</body>
</html>
