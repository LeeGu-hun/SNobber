<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3.css?ver=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3-theme-blue-grey.css?ver=1">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function boardNum(num) {
		$(location).attr('href', './mypageWritingView?num=' + num + '');
	}
	function memNum(num) {
		$(location).attr('href', './mypagePro?num=' + num + '');
	}
</script>
<style>
select {
    width: 200px;
    height: 30px;
    padding-left: 20px;
    font-size: 18px;
    color: #000;
    border: 1px solid #000;
    border-radius: 3px;
    
}


#searchbox{

size: 30px;
border: 1px solid #000;
    border-radius: 3px;
     font-size: 18px;
       width: 200px;
    height: 30px;

}


#searchsu{
size: 30px;
border: 1px solid #000;
    border-radius: 3px;
     font-size: 18px;
       width: 100px;
    height: 30px;

}

</style>
</head>
<body>
	<div style="margin-top: 100px;">
		<div>
			<%@ include file="/include/header.jsp"%>
		</div>
		<br>
		<form action="searching" name="searchFriend" method="post">
			<div style="margin-left:19px">
				<select name="searchOption">
					<option value="all,all">Member Search</option>
					<option value="mem_nickname,mem_nickname">Nickname</option>
					<option value="mem_introduce,mem_introduce">Member Introduce</option>
					<option value="board_content,mem_nickname">SNobber</option>
				</select> <input type="text" placeholder="Search.."
					name="keyword" value="${keyword }" id="searchbox"> <input type="submit" id="searchsu"
					value="조회">
			</div>


			<table border=1>

				<c:if test="${map.cntboard  > 0 }">
					<c:forEach var="bo" items="${map.boardList}">
						<div class="w3-container w3-card w3-white w3-round w3-margin">
							<br>
							
					<img src="${pageContext.request.contextPath}/${bo.board_File}"
									style="max-width: 150%; height: auto;">
								 <a href="#" onclick="boardNum('${bo.mem_Num}')">
										${bo.mem_Nickname} </a>

							<h4>
								${bo.board_Content}
							</h4>
							<br>
							<hr class="w3-clear">
					
							<div class="w3-row-padding" style="margin: 0 -16px">
								<!-- 사진 넣을 공간 -->
							</div>
							검색 키워드:${map.keyword}
						</div>




					</c:forEach>
				</c:if>

				<c:if test="${map.cntboard  <= 0 }">
				검색 결과가 없습니다
			</c:if>

				<c:if test="${map.cntMember > 0 }">
					<c:forEach var="bo" items="${map.memberList}">

<div class="w3-container w3-card w3-white w3-round w3-margin">
							<br>
							
				<%-- 	<img src="${pageContext.request.contextPath}/${bo.board_File}"
									style="max-width: 150%; height: auto;"> 그 사람 사진 가져오기--%>
								<a
								href="#" onclick="memNum('${bo.mem_num}')">
									${bo.mem_Nickname} </a>

							<h4>
								<p>소개</p>
								${bo.mem_Introduce}
							</h4>
							<br>
							<hr class="w3-clear">
					
							<div class="w3-row-padding" style="margin: 0 -16px">
								<!-- 사진 넣을 공간 -->
							</div>
							검색 키워드:${map.keyword}
						</div>


					</c:forEach>
				</c:if>

				<c:if test="${map.map.cntMember  <= 0 }">
				검색 결과가 없습니다
			</c:if>


		</form>

	</div>

</body>
</html>