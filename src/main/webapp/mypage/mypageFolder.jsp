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
	function stBoard(num) {
		$(location).data("num", num);
		$(location).attr('href', './mypageWritingView?num='+num+'');
	}
</script>
</head>
<body>
<%@ include file="/include/header.jsp"%>
	<div style="width: 1100px; margin: auto auto;">	
		
		<br>
		<div style="margin: 0.5em;">			
			<div>
				${folderName }
			</div>
			<c:if test="${empty board }">
				등록된 게시물이 없습니다.
			</c:if>
			<c:forEach var="bo" items="${board }">
					<div style="width: 210px; height: 170px; display: inline-block; margin: 0.5em;">
						<a href="#" onclick="stBoard('${bo.board_Num}')">
							<div style="width: 100%; height: 118px; background-color: orange;">
								${bo.board_File }
							</div>
						</a>
						<div>
							<div>
								<b style="font-size: 13px;">
									<a href="#" onclick="stBoard('${bo.board_Num}')">
										${bo.board_Content }
									</a>
								</b>
							</div>
							<div>
								<span style="font-size: 9px;">조회수 :
									${bo.board_Read_Count} ${bo.board_Date }</span>
							</div>
						</div>
					</div>
			</c:forEach>
		</div>
	</div>
		<div>

		<%@ include file="/include/footer.jsp"%>

	</div>
</body>
</html>

















