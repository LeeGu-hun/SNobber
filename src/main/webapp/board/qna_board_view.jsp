<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<title>다이어리</title>
</head>

<body>
	<!-- 게시판 수정 -->
	<form:form commandName="boardCommand">
		<table cellpadding="0" cellspacing="0">
			<tr align="center" valign="middle">
				<td colspan="5">다이어리</td>
			</tr>

			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">제 목&nbsp;&nbsp;</div>
				</td>

				<td style="font-family: 돋음; font-size: 12">${board.BOARD_SUBJECT}
				</td>
			</tr>

			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">글쓴이&nbsp;&nbsp;</div>
				</td>

				<td style="font-family: 돋음; font-size: 12">${board.BOARD_NAME}
				</td>
			</tr>

			<tr bgcolor="cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>

			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">내 용</div>
				</td>
				<td style="font-family: 돋음; font-size: 12">
					<table border=0 width=490 height=250 style="table-layout: fixed">
						<tr>
							<td valign=top style="font-family: 돋음; font-size: 12">
								${board.BOARD_CONTENT}</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">첨부파일</div>
				</td>
				<td style="font-family: 돋음; font-size: 12">
				<c:if test="${! empty board.BOARD_FILE}">
					<a href="<c:url value="/upload/${board.BOARD_FILE}"/>">${board.BOARD_FILE}</a>
				</td>
				</c:if>
				<!-- 
				<td>
					<div style="width:100;height:100">
						<img src="<c:url value="/upload/${board.BOARD_FILE}"/>">
					</div>
				</td>
				 -->
			</tr>

			<tr bgcolor="cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>

			<tr align="center" valign="middle">
				<td colspan="5"><font size=2> 
						<a href="<c:url value="/BoardReply/${board.BOARD_NUM}"/>"> [답변] </a>&nbsp;&nbsp; 
						<a href="<c:url value="/BoardModify/${board.BOARD_NUM}"/>"> [수정] </a>&nbsp;&nbsp; 
						<a href="<c:url value="/BoardDelete/${board.BOARD_NUM}"/>"> [삭제] </a>&nbsp;&nbsp; 
						<a href="<c:url value="/main"/>">[목록]</a>&nbsp;&nbsp;
				</font></td>
			</tr>
		</table>
	</form:form>
	<!-- 게시판 수정 -->
</body>
</html>