<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3-theme-blue-grey.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}
</style>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/min.css" />
<script src="${pageContext.request.contextPath}/js/common1.js?ver=2.6"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$('#folder_add_window').hide();
		$('#folderAdd').click(function() {
			$('#folder_add_window').toggle();
		});
		$('#folder_title_text').keyup(function() {
			var title = $('#folder_title_text').val();
			if (title == "") {
				$('#folder_create_btn').attr('disabled', true);
			} else {
				$('#folder_create_btn').attr('disabled', false);
			}
		});
		//폴더 만들기
		$('#folder_create_btn').on('click', function() {
			var secret = $('#folder_secret').val();
			var title = $('#folder_title_text').val();
			var id = $(this).attr('id');

			$.ajax({
				type : "POST",
				url : "./mypageFolderCreate",
				data : {
					id : id,
					title : title,
					secret : secret
				},
				success : mypageFF
			});
		})
		function mypageFF(msg) {
			var next = $('.next').val();

			$(location).attr('href', './mypagePro?num=' + next + '');
		}
	});
	function stFolder(num, memNum) {
		$(location).attr('href', './mypageFolder?num=' + num + '');
	};
	function stBoard(num) {
		$(location).data("num", num);
		$(location).attr('href', './mypageWritingView?num=' + num + '');
	}
	function folderDelete() {
		var num = $('#boNumm').attr("value");

		var id = "delete";

		$.ajax({
			type : "POST",
			url : "./mypageFolderDelete",
			data : {
				id : id,
				num : num
			},
			success : folderDelete2
		});
	}
	function folderDelete2() {
		var next = $('.next').val();

		$(location).attr('href', './mypagePro?num=' + next + '');
	}
	function folderFollow(num) {
		$(location).data("num", num);
		var id = "Follow";

		$.ajax({
			type : "POST",
			url : "./mypageFolderFollow",
			data : {
				id : id,
				num : num
			},
			success : folderFollow2
		});
	}
	function folderFollow2() {
		var next = $('.next').val();

		$(location).attr('href', './mypagePro?num=' + next + '');
	}
	function folderLike(num) {
		$(location).data("num", num);
		var id = "Like";

		$.ajax({
			type : "POST",
			url : "./mypageFolderLike",
			data : {
				id : id,
				num : num
			},
			success : folderLike2
		});
	}
	function folderLike2(num) {
		var next = $('.next').val();

		$(location).attr('href', './mypagePro?num=' + next + '');
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

		$(location).attr('href', './mypagePro?num=' + next + '');
	}

	function mypagePro(num) {
		$(location).attr('href', './mypagePro?num=' + num + '');
	}
	function mypageSNS(num) {
		$(location).attr('href', './mypageSNS?num=' + num + '');
	}

	function pop() {
		window.open(
			"mypage/photo",
			"pop",
			"width=400,height=500,history=no,resizable=no,status=no,scrollbars=yes,menubar=no")
	}
</script>
<script language="javascript">
		function photoModify() {
			photoEdit.submit();
		}
</script>

<script type="text/javascript">
	function ingShow(num) {
		$('#boNum').attr("value", num);
		$('#lightBoxOK').attr("value", num);

		$("#content").html("정말 삭제하시겠습니까?");
		document.getElementById('myModalll').style.display = 'block';
		//modal을 띄워준다.  	    
	}
	function ingShoww(num) {
		/* 폴더 삭제 */
		$('#boNumm').attr("value", num);
		$('#lightBoxOKk').attr("value", num);

		$("#contentt").html("정말 삭제하시겠습니까?");
		document.getElementById('myModall').style.display = 'block';
		//modal을 띄워준다.  	    
	}
	function memNum(num) {
		$(location).attr('href', './mypagePro?num=' + num + '');
	}
	function boardNum(num) {
		$(location).attr('href', './boardEdit?num='+num+'');
	}
</script>
</head>
<body class="w3-light-grey w3-content" style="max-width: 100%">
	<input class="next" value="${member.mem_num}" style="display: none;">

	<%@ include file="/include/header.jsp"%>
	<div>
		<div>

			<input class="next" value="${member.mem_num}" style="display: none;">

			<!-- Sidebar/menu -->

			<!-- Overlay effect when opening sidebar on small screens -->
			<div class="w3-overlay w3-hide-large w3-animate-opacity"
				onclick="w3_close()" style="cursor: pointer" title="close side menu"
				id="myOverlay"></div>

			<!-- !PAGE CONTENT! -->
			<div class="w3-main"
				style="margin-right: 150px; margin-left: 150px; margin-top: 100px; min-width: 650px;" >

				<!-- Header -->
				<header id="portfolio">
					<a href="#"> <img src="/w3images/avatar_g2.jpg"
						style="width: 65px;"
						class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity">
					</a> 
					<div class="w3-container" style="margin: auto 5%">
						<h1>
							<b>SNol</b>
						</h1>

						<!-- 사진 정보 수정 팔로우에 대한 정보들 -->
						<div class="w3-container w3-padding-large"
							style="margin-bottom: 32px">
							<div class="w3-col m6" style="width: 100%;">

								<table style="height: 200px; width: 100%;">
									<tr>
										<td rowspan="10" style="width: 200px;">
											<div
												style="width: 150px; height: 150px; border-radius: 50%; border: 1px solid gray; overflow: hidden;">
												<c:if test="${member.mem_Photo != null}">
													<img
														src="${pageContext.request.contextPath}/${member.mem_Photo}"
														style="max-width: 100%; height: 100%; margin-bottom: 100px"
														onclick="javascript:pop()">
												</c:if>
												<c:if test="${member.mem_Photo == null}">
													<img
														src="${pageContext.request.contextPath}/image/basic.png"
														style="max-width: 100%; height: auto; margin-bottom: 100px"
														onclick="javascript:pop()">
												</c:if>
											</div>
											<div style="margin-top: 15px; margin-left: 35px">
												<c:if test="${member.mem_num==host }">
													

														<button type="button" class="btn btn-default btn-xs"
															data-toggle="modal" data-target="#updateModalpho">
															사진수정</button> 
													
												</c:if>
											</div>
										</td>
									</tr>
									<c:choose>
										<c:when test="${member.mem_num==host }">
											<tr>
												<td style="width: 200px;">닉네임 ${member.mem_Nickname }</td>
												<td style="text-align: right;">
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#updateModal">
														수정</button>
												</td>
											</tr>
											<tr>
												<td style="width: 200px;">이메일 ${member.mem_Email }</td>
												<td style="text-align: right;">
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#a">팔로워 보기</button>
												</td>
											</tr>
											<tr>
												<td style="width: 200px;">소개 ${member.mem_Introduce }</td>
												<td style="text-align: right;">
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-toggle="modal" data-target="#b">
														팔로잉 보기</button>
												</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<td style="width: 200px;">닉네임 ${member.mem_Nickname }</td>
												<td style="text-align: right;">
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#a">팔로워 보기</button>
												</td>
											</tr>
											<tr>
												<td style="width: 200px;">이메일 ${member.mem_Email }</td>
												<td style="text-align: right;">
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-toggle="modal" data-target="#b">
														팔로잉 보기</button>
												</td>
											</tr>
											<tr>
												<td style="width: 200px;">소개 ${member.mem_Introduce }</td>
												<td style="text-align: right;"><c:if
														test="${follow != '1' }">
														<button type="button" class="btn btn-default btn-xs"
															data-toggle="modal" data-target="#followModal">
															팔로우 하기</button>
													</c:if> <c:if test="${follow == '1' }">
														<button type="button" class="btn btn-default btn-xs"
															data-toggle="modal" data-target="#cancleModal">
															팔로우 취소</button></td>
											</tr>
											<tr>
												<td style="width: 200px;"></td>
												<td style="text-align: right;">팔로우 중</td>
											</tr>
											</c:if>
											</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
						</div>

						<div class="w3-section w3-bottombar w3-padding-16">
							<span class="w3-margin-right">Filter:</span>
							<button class="w3-button w3-white w3-hide-small"
								onclick="mypagePro('${member.mem_num}')">
								<i class="fa fa-photo w3-margin-right"></i> SNol
							</button>
							<button class="w3-button w3-white w3-hide-small"
								onclick="mypageSNS('${member.mem_num}')">
								<i class="fa fa-map-pin w3-margin-right"></i> SNS
							</button>
							<div id="folder_add_window" class="w3-row-padding"
								style="position: absolute;">
								<div class="w3-col m12">
									<div class="w3-card w3-round w3-white">
										<div class="w3-container w3-padding">
											<h6 class="w3-opacity">Title</h6>
											<p>
												<input id="folder_title_text" type="text"
													class="w3-border w3-padding">
											</p>
											<select id="folder_secret">
												<option>공개</option>
										
											</select> <input id="folder_create_btn" class="w3-button w3-theme"
												type="button" value="만들기" disabled="disabled" />
										</div>
									</div>
								</div>
							</div>
							<c:if test="${host eq member.mem_num }">
								<button id="folderAdd" class="w3-button w3-white w3-hide-small">
									<i class="fa fa-diamond w3-margin-right"></i> Add List
								</button>
							</c:if>
						</div>
					</div>
				</header>

				<!-- First Photo Grid-->
				<c:if test="${empty folder }">
					<p>등록된 글이 없습니다.</p>
				</c:if>
				<c:forEach var="fol" items="${folder }" varStatus="stFolder">
					<div class="w3-row-padding" style="margin: auto 6%">
						<p>
							<b onclick="stFolder('${fol.folder_Num}')">
								${fol.folder_Title } </b>
							<c:if test="${fol.mem_Num eq host }">
								<c:if test="${fol.folder_Title != '기본'}">
									<span id="delete" class="folderD"
										onclick="ingShoww('${fol.folder_Num}')" style="float: right;">
										Delete </span>
								</c:if>
							</c:if>
							<c:if test="${fol.mem_Num ne host }">
								<span onclick="folderFollow('${fol.folder_Num}')"
									style="float: right;"> ${fol.follow_on == 1 ? "Un Follow" : "Follow"}
									&nbsp;&nbsp;&nbsp; </span>
							</c:if>
							<c:if test="${fol.mem_Num ne host }">
								<span onclick="folderLike('${fol.folder_Num}')"
									style="float: right;"> ${fol.like_on == 1 ? "Un Like" : "Like"}
									&nbsp;&nbsp;&nbsp; </span>
							</c:if>
						</p>
						<div id="columns">
							<c:forEach var="bo" items="${boardProBoard }" varStatus="stPro">
								<c:if test="${fol.folder_Num eq bo.folder_Num }">
									<figure>
										<c:if test="${bo.board_File != null}">
											<img
												src="${pageContext.request.contextPath}/${bo.board_File }"
												onclick="stBoard('${bo.board_Num}')" />
										</c:if>
										<figcaption>
											<p class="content" onclick="stBoard('${bo.board_Num}')">
												${bo.board_Content }</p>
											<span> 조회수 : ${bo.board_Read_Count} </span>
											<div style="text-align: right;">
												<span style="font-size: 0.8em;"> ${bo.board_Date }
													&nbsp;&nbsp; </span>
												<c:if test="${host eq bo.mem_Num }">
													<span onclick="boardNum(${bo.board_Num})"
														style="text-align: right; font-size: 0.8em;"> Edit
													</span>
													<span class="boardD" onclick="ingShow('${bo.board_Num}')"
														style="text-align: left; font-size: 0.8em;"> Delete
													</span>
												</c:if>
											</div>
										</figcaption>
									</figure>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:forEach>

				<!-- Pagination -->
				<div class="w3-center w3-padding-32">
					<div class="w3-bar">
						<a href="#" class="w3-bar-item w3-button w3-hover-black">«</a> <a
							href="#" class="w3-bar-item w3-black w3-button">1</a> <a href="#"
							class="w3-bar-item w3-button w3-hover-black">2</a> <a href="#"
							class="w3-bar-item w3-button w3-hover-black">3</a> <a href="#"
							class="w3-bar-item w3-button w3-hover-black">4</a> <a href="#"
							class="w3-bar-item w3-button w3-hover-black">»</a>
					</div>
				</div>

				<!-- Images of Me -->
				<div class="w3-row-padding w3-padding-16" id="about"></div>
			</div>
		</div>
		
		<!-- End page content -->
	</div>

	<script>
		// Script to open and close sidebar
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("myOverlay").style.display = "block";
		}

		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("myOverlay").style.display = "none";
		}
	</script>

	<!-- Modal -->
	<div id="myModalll" class="w3-modal">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span
					onclick="document.getElementById('myModal').style.display='none'"
					class="w3-button w3-display-topright">&times;</span> <input
					type="hidden" id="title" name="title" />
				<p id="content"></p>
				<input type="hidden" id="boNum" name="boNum" />
				<div id="lightBoxOK">
					<input type="button" value="확인" onclick="boardDelete()"
						style="text-align: right;"> <input type="button"
						onclick="document.getElementById('myModalll').style.display='none'"
						value="취소">
				</div>
				<p>&nbsp;</p>
			</div>
		</div>
	</div>
	<div id="myModall" class="w3-modal">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span
					onclick="document.getElementById('myModal').style.display='none'"
					class="w3-button w3-display-topright">&times;</span> <input
					type="hidden" id="titlee" name="titlee" />
				<p id="contentt"></p>
				<input type="hidden" id="boNumm" name="boNumm" />
				<div id="lightBoxOKk">
					<input type="button" value="확인" onclick="folderDelete()"
						style="text-align: right;"> <input type="button"
						onclick="document.getElementById('myModall').style.display='none'"
						value="취소">
				</div>
				<p>&nbsp;</p>
			</div>
		</div>
	</div>
	<!-- 팔로워 보기 모달 -->
	<div class="modal fade" id="a" role="dialog" style="widht: 130px">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn btn-default btn-xs"
						data-dismiss="modal">팔로워 보기</button>
				</div>
				<div class="modal-body">
					<div style="width: 100%;">
						<table class="w3-table w3-bordered"
							style="width: 70%; margin-left: 10%">

							<c:forEach var="fol" items="${follower}">
								<tr>
									<td rowspan="2" style="width: 50%">
										<div
											style="width: 100%; height: 100%; border-radius: 50%; border: 1px solid gray; overflow: hidden;">
											<c:if test="${fol.mem_Photo != null}">
												<img
													src="${pageContext.request.contextPath}/${fol.mem_Photo}"
													style="max-width: 100%; height: 130px;">
											</c:if>
											<c:if test="${fol.mem_Photo == null}">
												<img src="./image/basic.png"
													style="max-width: 100%; height: 130px;">
											</c:if>
										</div>
									</td>
									<td style="vertical-align: bottom;"><a href="#"
										onclick="memNum('${fol.mem_Num}')">${fol.mem_Nickname}</a></td>
								</tr>
								<tr>
									<td style="vertical-align: bottom;">${fol.mem_Introduce}</td>
								</tr>
								<tr>
									<td colspan="2"><c:choose>
											<c:when test="${fol.follow == 1}">
													팔로우중
												</c:when>
										</c:choose></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 팔로잉 보기 모달 -->
	<div class="modal fade" id="b" role="dialog" style="widht: 130px">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn btn-default btn-xs"
						data-dismiss="modal">팔로잉 보기</button>
				</div>
				<div class="modal-body">
					<div style="width: 100%;">
						<table class="w3-table w3-bordered"
							style="width: 70%; margin-left: 10%">
							<c:forEach var="fol" items="${following}">
								<tr>
									<td rowspan="2" style="width: 50%">

										<div
											style="width: 100%; height: 100%; border-radius: 50%; border: 1px solid gray; overflow: hidden;">
											<c:if test="${fol.mem_Photo != null}">
												<img
													src="${pageContext.request.contextPath}/${fol.mem_Photo}"
													style="max-width: 100%; height: 130px;">
											</c:if>
											<c:if test="${fol.mem_Photo == null}">
												<img src="./image/basic.png"
													style="max-width: 100%; height: 130px;">
											</c:if>
									</td>
									<td style="vertical-align: bottom;"><a href="#"
										onclick="memNum('${fol.follow_You_Num}')">
											${fol.mem_Nickname} </a></td>
								</tr>
								<tr>
									<td style="vertical-align: bottom;">${fol.mem_Introduce}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 팔로우 취소 모달 -->
	<div class="modal fade" id="cancleModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">팔로우 취소</div>
				<div class="modal-body">
					<form action="followsubmit" method="POST">
						<h3>${member.mem_Nickname }님팔로우를 취소 하겠습니까?</h3>
						<br> <input type="submit" value="취소">
						<button type="button" data-dismiss="modal">취소</button>
						<input type="hidden" id="type" name="type" value="1" /> <input
							type="hidden" id="title" name="title" value="${member.mem_num }" />
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 팔로우 신청 모달 -->
	<div class="modal fade" id="followModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">팔로우 신청</div>
				<div class="modal-body">
					<form action="followsubmit" method="POST">
						<h3>${member.mem_Nickname }님에게팔로우 신청 하겠습니까?</h3>
						<br> <input type="submit" value="신청">
						<button type="button" data-dismiss="modal">취소</button>
						<input type="hidden" id="type" name="type" value="2" /> <input
							type="hidden" id="title" name="title" value="${member.mem_num }" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 수정 모달 -->
	<div class="modal fade" id="updateModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 id="updateTitle" class="modal-title"></h4>
				</div>
				<div class="modal-body">
					<p><%@ include file="mypageEdit.jsp"%></p>
				</div>
			</div>
		</div>
	</div>
	<!-- 사진 수정 모달 -->
	<div class="modal fade" id="updateModalpho" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content" style="width: 300px" >
				<div class="modal-header">
						<h4 id="updateTitle" class="modal-title">사진 수정</h4><button type="button" class="close" data-dismiss="modal">&times;</button>
				
				</div>
				<div class="modal-body" >
					<form action="photoEdit" method="post" name="photoEdit"
						enctype="multipart/form-data">
						<table style="height: 200px;">
							<tr>
								<td rowspan="10" style="width: 100px;">
									<div
										style="width: 50%; height: 60%; border-radius: 50%; border: 1px solid gray; overflow: hidden;">
										<c:if test="${member.mem_Photo != null}">
											<img
												src="${pageContext.request.contextPath}/${member.mem_Photo}"
												style="max-width: 100%; height: auto;">
										</c:if>
										<c:if test="${member.mem_Photo == null}">
											<img src="${pageContext.request.contextPath}/image/basic.png"
												style="max-width: 100%; height: auto;">
										</c:if>
									</div> 
									<br>
									<input name="mem_Photo" type="file" value="${member.mem_Photo }">
																<br>
											<a href="javascript:photoModify()">변경</a>
								<a href="javascript:history.back();">뒤로</a>
								</td>
							</tr>

							<tr>
								
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>