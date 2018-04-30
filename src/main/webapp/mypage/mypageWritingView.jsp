<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
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
<body style="background-color: silver;">
	<div style="width: 100%; text-align: center;">	
		<%@ include file="/include/header.jsp"%>
			<br>
			<div style="width: 600px; margin: 0 auto; margin-top: 50px;">
			<c:forEach var="bm" items="${bm }">	
				<input class="next" type="text" value="${bm.board_Num }" style="display: none;">						
				<br>
				<div>
					${bm.mem_Nickname }
				</div>
				<div>
					${bm.board_Date }
				</div>
				<br>
				<div>
					<c:if test="${bm.mem_Num==sessionScope.authInfo.mem_num}">
						<a href="#" onclick="boardNum(${bm.board_Num})">수정</a>
					</c:if>
				</div>
				<br>
				<img src="${pageContext.request.contextPath}/${bm.board_File }" style="width: 100%; height: auto;"> 
				<br>
				<div>
					<%-- ${bm.board_read_count } --%>
				</div>
				<div>
					좋아요 ${likeNum }
				</div>
				<div>	
					댓글
					<input type="text" id="reContent" style="width: 80%;">
					<input type="button" value="추가" onclick="reAdd(${bm.board_Num})">					
					<c:forEach var="re" items="${re }">
						<table>
							<tr style="font-size: 8pt;">
								<td>
									${re.mem_Photo }
								</td>
								<td>
									${re.re_Content }
								</td>
								<td>
									${re.re_Date }
								</td>
								<td>
									<c:if test="${host eq bm.mem_Num}">
										<c:if test="${host eq re.mem_Num }">
											<span onclick="modifyRe('${re.re_Num}')">
												Edit
											</span>																		
										</c:if>
										<span onclick="deleteRe('${re.re_Num}')">
											Delete
										</span>
									</c:if>
									<c:if test="${host ne bm.mem_Num }">
										<c:if test="${host eq re.mem_Num }">
											<span onclick="modifyRe('${re.re_Num}')">
												Edit												
											</span>
											
											<span onclick="deleteRe('${re.re_Num}')">
												Delete
											</span>
										</c:if>								
									</c:if>									
								</td>
							</tr>
						</table>				
					</c:forEach>
				</div>
			</c:forEach>
			
		</div>
		<br>
		<%@ include file="/include/footer.jsp" %>
	</div>
</body>
</html>