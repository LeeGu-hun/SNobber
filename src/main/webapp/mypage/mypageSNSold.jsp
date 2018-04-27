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
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" ver="1.2">
<script src="${pageContext.request.contextPath}/js/common.js?ver=2.2"></script>
<script>
	function mypagePro(num) {
		$(location).attr('href', './mypagePro?num='+num+'');
	}
	function mypageSNS(num) {
		$(location).attr('href', './mypageSNS?num='+num+'');
	}
</script>
</head>

<body>
	<div style="width: 1100px; margin: auto auto;">	
	<%@ include file="/include/header.jsp"%>
	<br><br><br><br><br>
		<div id="mypage" style="width: 100%; height: 500px">
			<table style="border: 1px solid gray; width: 100%; height: 40px;">
				<tr id="trr">
					<td name="pro" id="pro"
						style="text-align: center; border-right: 1px solid gray;"><a
						href="#" onclick="mypagePro('${member.mem_num}')"> pro </a></td>
					<td name="sns" id="sns"
						style="text-align: center; border-left: 1px solid gray;"><a
						href="#" onclick="mypageSNS('${member.mem_num}')"> sns </a></td>
				</tr>
			</table>
			<div style="width:100%; position: relative;">	
				<div style="width:100%; z-index: 20; position: absolute;">				
					<div style="width: 100%;">
						<br>
						<c:if test="${empty boardSNS}">
							<p>등록된 글이 없습니다.</p>
						</c:if>
	 					<c:forEach var="bo" items="${boardSNS }">
							<div style="height: 300px; margin: 0.5em; border-bottom: 1px solid gray">
	 						<span id="snsBoard"></span>
	 							<div>이름</div>
	 							<div>${bo.board_Date}</div>
	 							<c:if test="${!empty bo.board_File }">
		 							<div style="background-color:lime; width: 500px; height: 500px;">${bo.board_File }</div>
	 							</c:if>
	 							<div>${bo.board_Content }</div>
	 							<div>
	 								<span>
	 									좋아요 : ${bo.like_Num }
	 								</span>  
	 								<span>
	 									조회수 : ${bo.board_Read_Count }
	 								</span>	 								
	 							</div>								
							</div>
						</c:forEach>
					</div>			
				</div>
			</div>
		</div>
	</div>
</body>
</html>