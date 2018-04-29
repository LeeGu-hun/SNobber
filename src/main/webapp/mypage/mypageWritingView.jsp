<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<script src="${pageContext.request.contextPath}/js/common.js?ver=2"></script>
<script>
	function reAdd(num) {
		var Content = $('#reContent').val();
		
		$.ajax({ 
			type : "POST",
			url : "./mypageRe",
			data : {Content : Content, num : num},
			success : mypageRe
		});		
	}
	function mypageRe() {		
		alert('댓글 쓰기 완료');
		var next = $('.next').val();
		$(location).attr('href', './mypageWritingView?num=' + next + '');
	}
	
	function modifyRe(num) {
		$.ajax({ 
			type : "POST",
			url : "./modifyRe",
			data : { num : num},
			success : modifyRe2
		});		
	}
	function modifyRe2() {		
		var next = $('.next').val();
		$(location).attr('href', './mypageWritingView?num=' + next + '');
	}
	
	function deleteRe(num) {
		$.ajax({ 
			type : "POST",
			url : "./deleteRe",
			data : { num : num},
			success : deleteRe2
		});		
	}
	function deleteRe2() {		
		alert('댓글 삭제 완료');
		var next = $('.next').val();
		$(location).attr('href', './mypageWritingView?num=' + next + '');
	}
	function boardNum(num) {
		$(location).attr('href', './boardEdit?num='+num+'');
	}
</script>
</head>
<body>
	<%@ include file="/include/header.jsp"%>
	<div style="width: 1100px; margin-top: 200px;">

		<div style="width: 600px; margin: auto;">
			<c:forEach var="bm" items="${bm }">
				<input class="next" type="text" value="${bm.board_Num }"
					style="display: none;">

				<table>
					<tr>
						<td rowspan="2">사진</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2">${bm.mem_Nickname }</td>

					</tr>
					<tr>
					<c:if test="${bm.board_File ne null}">
						<td colspan="3" style="width: 200px; height: 200px"><img
							src="${pageContext.request.contextPath}/${bm.board_File }"
							style="width: 100%;"></c:if>${bm.board_Content }</td>
					</tr>

					<tr>
						<td style="font-size:small;">${bm.board_Date }</td>
						<td></td>
						<td><a href="#" onclick="boardNum(${bm.board_Num})">수정</a> <img
							src="../image/heart2.png"> ${likeNum }</td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" id="reContent"></td>
						<td><input type="button" value="추가"
							onclick="reAdd(${bm.board_Num})"></td>
					</tr>

				</table>

 	댓글  
					<c:forEach var="re" items="${re }">
					<table>

						<tr>
							<td rowspan="2"><img src="${pageContext.request.contextPath}/${re.mem_Photo }"
						style="width: 60px" height="50px"></td>
							<td colspan="2">닉네임 <small>${re.re_Date }</small> </td>
						</tr>
						<tr>

							<td colspan="3">${re.re_Content }<c:if
									test="${host eq bm.mem_Num}">
									<c:if test="${host eq re.mem_Num }">
										<span onclick="modifyRe('${re.re_Num}')"> Edit </span>
									</c:if>
									<span onclick="deleteRe('${re.re_Num}')"> Delete </span>
								</c:if> <c:if test="${host ne bm.mem_Num }">
									<c:if test="${host eq re.mem_Num }">
										<span onclick="modifyRe('${re.re_Num}')"> Edit </span>

										<span onclick="deleteRe('${re.re_Num}')"> Delete </span>
									</c:if>
								</c:if>
							</td>
						</tr>

					</table>
				</c:forEach>
		</div>
		</c:forEach>

	</div>
	</div>
</body>
</html>