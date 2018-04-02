<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="login.title" /></title>
<script>
	function list(curPage) {
		location.href = "./main?curPage=" + curPage
				+ "&searchOption=${map.searchOption}"
				+ "&keyword=${map.keyword}";
	}
</script>
</head>
<body>
	<div style="text-align: right">
		<p>${sessionScope.authInfo.name}님
			환영합니다. <a href="./member/list">회원관리</a>&nbsp;&nbsp;&nbsp; <a
				href="./logout">로그아웃</a>
		</p>
		<label>글갯수 :${bean.count}</label>
	</div>
	<br>
	<h1 style="text-align: center">다이어리</h1>
	<div style="text-align: right">
		<a href="./BoardWrite">[글 쓰기]</a>
	</div>
	<br>
	<div>
		<c:if test="${bean.count > 0}">
			<table>
				<form name="form1" method="post" action="./main">
					<select name="searchOption">
						<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
						<option value="all"
							<c:out value="${bean.searchOption == 'all'?'selected':''}"/>>제목+내용</option>
						<option value="board_subject"
							<c:out value="${bean.searchOption == 'board_subject'?'selected':''}"/>>제목</option>
						<option value="board_content"
							<c:out value="${bean.searchOption == 'board_content'?'selected':''}"/>>내용</option>
					</select> <input name="keyword" value="${bean.keyword}"> <input
						type="submit" value="조회">
				</form>
				<tr align="center" valign="middle" bordercolor="#333333">
					<td style="font-family: Tahoma; font-size: 10pt;" width="8%"
						height="26">
						<div align="center">번호</div>
					</td>
					<td style="font-family: Tahoma; font-size: 10pt;" width="50%">
						<div align="center">제목</div>
					</td>
					<td style="font-family: Tahoma; font-size: 10pt;" width="14%">
						<div align="center">작성자</div>
					</td>
					<td style="font-family: Tahoma; font-size: 10pt;" width="17%">
						<div align="center">날짜</div>
					</td>
					<td style="font-family: Tahoma; font-size: 10pt;" width="11%">
						<div align="center">조회수</div>
					</td>
				</tr>
				<c:forEach var="bo" items="${bean.list}">
					<tr align="center" valign="middle" bordercolor="#333333"
						onmouseover="this.style.backgroundColor='F8F8F8'"
						onmouseout="this.style.backgroundColor=''">
						<td height="23" style="font-family: Tahoma; font-size: 10pt;">
							</td>
						<td style="font-family: Tahoma; font-size: 10pt;">

							<div align="left">
								<c:if test="${!empty bo.BOARD_RE_LEV}">
									<c:forEach begin="0" end="${bo.BOARD_RE_LEV*2}">
											&nbsp;
										</c:forEach>
									▶
									</c:if>
								<c:if test="${empty bo.BOARD_RE_LEV}">
									▶
									</c:if>
								<a href="<c:url value="/BoardDetail/${bo.BOARD_NUM}"/>">
									${bo.BOARD_SUBJECT} </a>
							</div>
						</td>
						<td>${bo.BOARD_NAME}</td>
						<td><fmt:formatDate value="${bo.BOARD_DATE}"
								pattern="yyyy-MM-dd" /></td>
						<td>${bo.BOARD_READCOUNT}</td>
					</tr>
				</c:forEach>
				<tr align=center height=20>
					<td colspan=5 style="font-family: Tahoma; font-size: 10pt;"><jsp:include
							page="/include/paging.jsp" flush="true">
							<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
							<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
							<jsp:param name="startPageNo" value="${paging.startPageNo}" />
							<jsp:param name="pageNo" value="${paging.pageNo}" />
							<jsp:param name="endPageNo" value="${paging.endPageNo}" />
							<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
							<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
						</jsp:include></td>
				</tr>
			</table>
		</c:if>
		<c:if test="${bean.count <= 0}">
			<h1>등록된 글이 없습니다</h1>
		</c:if>
	</div>
</body>
</html>