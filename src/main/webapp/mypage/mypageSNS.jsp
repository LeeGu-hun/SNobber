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
	<div class="w3-main" style="margin-right: 150px; margin-left: 150px; margin-top: 100px">

		<!-- Header -->
		<header id="portfolio">
			<div class="w3-container" style="margin-left: 13%;margin-right: 13%;">
				<h1>
					<b>SNS</b>
				</h1>
				
					<!-- 사진 정보 수정 팔로우에 대한 정보들 -->
						<div class="w3-container w3-padding-large"
							style="margin-bottom: 32px">
							<div class="w3-col m6" style="width: 100%;">

								<table style="height: 200px; width: 100%;">
									<tr>
										<td rowspan="10" style="width: 200px;">
											<div style="width: 150px; height: 150px; border-radius: 50%; border: 1px solid gray; overflow: hidden;">
												<c:if test="${member.mem_Photo != null}">
												<img src="${pageContext.request.contextPath}/${member.mem_Photo}"
													style="max-width: 100%; height: auto; margin-bottom: 100px"
													onclick="javascript:pop()">
												</c:if>
												<c:if test="${member.mem_Photo == null}">
												<img src="${pageContext.request.contextPath}/image/basic.png"
													style="max-width: 100%; height: auto; margin-bottom: 100px"
													onclick="javascript:pop()">
												</c:if>
											</div> 
											<div style="margin-top:15px; margin-left: 35px">	
												<c:if test="${member.mem_num==host }">
													<a href="photoEdit">
														사진 수정
													</a>
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
														수정
													</button>
												</td>
												</tr>
												<tr>
													<td style="width: 200px;">이메일 ${member.mem_Email }</td>												
													<td style="text-align: right;">
														<button type="button" class="btn btn-default btn-xs" 
																data-toggle="modal" data-target="#a">
															팔로워 보기
														</button>
													</td>
												</tr>
												<tr>
													<td style="width: 200px;">소개 ${member.mem_Introduce }</td>
													<td style="text-align: right;">
														<button type="button" class="btn btn-default btn-xs" data-toggle="modal"
																data-toggle="modal" data-target="#b">
															팔로잉 보기
														</button>
													</td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<td style="width: 200px;">닉네임 ${member.mem_Nickname }</td>
													<td style="text-align: right;">
														<button type="button" class="btn btn-default btn-xs" 
																data-toggle="modal" data-target="#a">
															팔로워 보기
														</button>
													</td>
												</tr>
												<tr>
													<td style="width: 200px;">이메일 ${member.mem_Email }</td>
													<td style="text-align: right;">
														<button type="button" class="btn btn-default btn-xs" data-toggle="modal"
																data-toggle="modal" data-target="#b">
															팔로잉 보기
														</button>
													</td>
												</tr>
												<tr>
													<td style="width: 200px;">소개 ${member.mem_Introduce }</td>
													<td style="text-align: right;">
														<c:if test="${follow != '1' }">
															<button type="button" class="btn btn-default btn-xs"
																	data-toggle="modal" data-target="#followModal">
																팔로우 하기
															</button>
														</c:if>
														<c:if test="${follow == '1' }">
															<button type="button" class="btn btn-default btn-xs"
																	data-toggle="modal" data-target="#cancleModal">
																팔로우 취소
															</button>	
													</td>													
												</tr>
												<tr>
													<td style="width: 200px;">
													</td>
													<td style="text-align: right;">팔로우 중
													</td>
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
		<div id="columns"  style="margin-left: 13%; margin-right: 13%;">
			<c:if test="${empty boardSNS }">
				<p>등록된 글이 없습니다.</p>
			</c:if>
			<c:forEach var="bo" items="${boardSNS }">
			<div class="w3-row-padding">
				<figure>
					<c:if test="${bo.board_File != null}">
					<img src="${pageContext.request.contextPath}/${bo.board_File }" 
							onclick="stBoard('${bo.board_Num}')"/>
					</c:if>
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
			</div>
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
	
		<!-- 팔로워 보기 모달 -->
	<div class="modal fade" id="a" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn btn-default btn-xs"
							data-dismiss="modal">
						팔로워 보기
					</button>
				</div>
				<div class="modal-body">
					<div style="margin-top:150px; width:100px; folat:left;">
						<table class="w3-table w3-bordered" style="width: 400px">
							<tr>
								<th colspan="2">
									팔로워
								</th>
							</tr>
							<c:forEach var="fol" items="${follower}">
								<tr>
									<td rowspan="2">
									<div style="width: 150px; height: 150px; border-radius: 50%; border: 1px solid gray; overflow: hidden;">
									<c:if test="${fol.mem_Photo != null}">
										<img src="${pageContext.request.contextPath}/${fol.mem_Photo}"
											style="max-width: 150%; height: auto;">
									</c:if>
									<c:if test="${fol.mem_Photo == null}">
										<img src="${pageContext.request.contextPath}/image/basic.png"
											style="max-width: 150%; height: auto;">
									</c:if>
									</div>
									</td>
									<td>
										<a href="#" onclick="memNum('${fol.mem_Num}')">${fol.mem_Nickname}</a>
									</td>
								</tr>
								<tr>
									<td>${fol.mem_Introduce}</td>
								</tr>
								<tr>
									<td colspan="2">
										<c:choose>
											<c:when test="${fol.follow == 1}">
												팔로우중
											</c:when>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 팔로잉 보기 모달 -->
	<div class="modal fade" id="b" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn btn-default btn-xs"
							data-dismiss="modal">
						팔로잉 보기
					</button>
				</div>
				<div class="modal-body">
					<div style="margin-top: 150px; folat:right; width:100px; ">
						<table class="w3-table w3-bordered" style="width: 400px">
							<tr>
								<th colspan="2">팔로잉</th>
							</tr>
							<c:forEach var="fol" items="${following}">
									<tr>
										<td rowspan="2">
											<c:if test="${fol.mem_Photo != null}">
											<img src="${pageContext.request.contextPath}/${fol.mem_Photo}"
													style="max-width: 150%; height: auto;">
											</c:if>
											<c:if test="${fol.mem_Photo == null}">
											<img src="${pageContext.request.contextPath}/image/basic.png"
													style="max-width: 150%; height: auto;">
											</c:if>
										</td>
										<td>
											<a href="#" onclick="memNum('${fol.follow_You_Num}')">
												${fol.mem_Nickname}
											</a>
										</td>
									</tr>
									<tr>
										<td>${fol.mem_Introduce}</td>
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
				<div class="modal-header">
					팔로우 취소
				</div>
				<div class="modal-body">
					<form action="followsubmit" method="POST">
						<h4>${member.mem_Nickname }님 팔로우를 취소 하겠습니까?</h4>
						<input type="submit" value="취소">
						<button type="button" data-dismiss="modal">취소</button>
						<input type="hidden" id="type" name="type" value="1"/>
						<input type="hidden" id="title" name="title" value="${member.mem_num }"/>
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
				<div class="modal-header">
					팔로우 신청
				</div>
				<div class="modal-body">
					<form action="followsubmit" method="POST">
						<h4>${member.mem_Nickname }님에게 팔로우 신청 하겠습니까?</h4>
						<input type="submit" value="신청">
						<button type="button" data-dismiss="modal">취소</button>
						<input type="hidden" id="type" name="type" value="2"/>
						<input type="hidden" id="title" name="title"  value="${member.mem_num }"/>
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

	<div class="w3-container w3-padding-large" style="margin-bottom: 32px">
		<%@ include file="../include/footer.jsp"%>
</body>
</html>
