<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<title>W3.CSS Template</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3.css?ver=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3-theme-blue-grey.css?ver=1">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: "Open Sans", sans-serif
}
</style>


<script src="${pageContext.request.contextPath}/js/scriptSc.js?ver=2"></script>
<script type="text/javascript">
	
	
	function boardNum(num) {
		$(location).attr('href', './mypageWritingView?num='+num+'');
	}
	function memNum(num) {
		$(location).attr('href', './mypagePro?num='+num+'');
	}
</script>







<body class="w3-theme-l5">

	<!-- Navbar -->

	<!-- Navbar on small screens -->
	<div id="navDemo"
		class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
		<a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
		<a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
		<a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
		<a href="#" class="w3-bar-item w3-button w3-padding-large">My
			Profile</a>
	</div>

	<!-- Page Container -->
	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 80px">
		<!-- The Grid -->
		<div class="w3-row">
			<!-- Left Column -->
			<div class="w3-col m3">
				<!-- Profile -->



				<!-- Accordion -->


				<!-- Interests -->




				<!-- End Left Column -->
			</div>

			<!-- Middle Column -->
			<div class="w3-col m7" id="table_id"
				style="width: 70%; margin-left: 94px; float:left">

				<c:forEach var="bo" items="${list}" varStatus="status">
					<div class="w3-container w3-card w3-white w3-round w3-margin">
						<br><p> <img src="${pageContext.request.contextPath}/${bo.mem_Photo}" style="width:50px; height:50px; boarder-radius:50%;">

							<a href="#" onclick="memNum('${bo.mem_Num}')">
								${bo.mem_Nickname} </a>
						</p>
						<br>
						<hr class="w3-clear">
						<span id="searchHash"> ${bo.board_Content} <a href="#"
							onclick="boardNum(${bo.board_Num})"
							style="text-decoration: none;"><자세히보기></a>
						</span> <br> <br> <br>
						<div class="w3-row-padding" style="margin: 0 -16px">
							<img src="${pageContext.request.contextPath}/${bo.board_File}" style="width:400px; height:300px; boarder-radius:50%;">
						</div>

						<button type="button"
							style="background-color: #000; margin-bottom: 16px; border: none; display: inline-block; padding: 8px 16px; vertical-align: middle; overflow: hidden; text-decoration: none; color: inherit; background-color: inherit; text-align: center; cursor: pointer; white-space: nowrap;"
							class="likeScroll" data-ch="${status.index}">
							<span id="btnLike"> <a href="#"
								onclick="check('${bo.board_Num}','${bo.like_on}','${status.index}')"
								style="text-decoration: none;"> ${bo.like_on == 1 ? '★':'☆'}</a>
							</span>
						</button>

					</div>
				</c:forEach>
				<c:if test="${empty list }">
	등록된 글이 없습니다.
	</c:if>
				<!-- End Middle Column -->
			</div>



			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>
	<br>



	<script>

		
	$(document).ready(function () {
		  $(document).scroll(function() {
		    var maxHeight = $(document).height();
		    var currentScroll = $(window).scrollTop() + $(window).height();
		    var lastbno = $(".likeScroll:last").attr("data-ch");
		  
		  
		    if (maxHeight <= currentScroll) {
		    	lastbno++;
		    
		    	
		    	
		    	$.ajax({
		    		
		    	  type : "POST",
					dataType : "json",
					url : "./boardScroll",
					data : "lastbno="+ lastbno,
					success : sc
					
		      });
		    }
		  });
		});			  

function sc(data) {
	var like_on = data.scrollAddLi;
	var mem_num = data.scrollAddMeNu;
	var content = data.scrollAddCon;
	var mem_nickname = data.scrollAddMeN;
	var board_num = data.scrollAddBoardBum;
	var listSize = data.listSize;
	var allList = data.allList;
	var tag = like_on == 1 ? '★' : '☆';
	var scrollIndex = data.scrollIndex;
var mem_photo=data.scrollAddPho;

var liketag = "<span id='btnLike'><a href='#' style='text-decoration:none;' onclick="
	+ "'check(\"" + board_num + "\",\"" + like_on + "\",\""
	+ scrollIndex + "\")'>" + tag + "</a></span>";
var c_tag=  content+ "<a href='#' style='text-decoration:none;' onclick="+"'boardNum(\""+board_num+"\")'><자세히보기></a>"
if (listSize < allList) {
$('#table_id').append("<div class='w3-container w3-card w3-white w3-round w3-margin'><br><p><img src='../../upload/"+mem_photo+"' style='width:auto; height:auto; boarder-radius:50%;' >"+
		
		"<a href='#' onclick="+"'memNum(\""+mem_num +"\")'>"+mem_nickname+"</a></p>"+

		"<br><hr class='w3-clear'><span id='searchHash'>"+ 

		content+ "<a href='#' onclick="+"'boardNum(\""+board_num+"\")'><자세히보기></a>"+

		"</span> <br> <br> <br><div class='w3-row-padding' style='margin: 0 -16px'>"+

		"</div><button type='button' style='background-color: #000; margin-bottom: 16px; border: none; display: inline-block; padding: 8px 16px; vertical-align: middle; overflow: hidden; text-decoration: none; color: inherit; background-color: inherit; text-align: center; cursor: pointer; white-space: nowrap;'class='likeScroll' data-ch="+scrollIndex+">"+liketag+"</button>"+

		"</div>");}
	
	

}
</script>



</body>
</html>
