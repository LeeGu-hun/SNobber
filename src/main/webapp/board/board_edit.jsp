<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<title>글 수정</title>
<script language="javascript">
function editboard(num) {
	boardform.submit(num);
}
</script>
</head>
<body>
	<%@ include file="/include/header.jsp"%>
	<form:form action="boardEdit" method="POST" commandName="boardMemberBean" name="boardform"
		enctype="multipart/form-data">
		<table cellpadding="0" cellspacing="0" style="margin: 0 auto;">
			<tr align="center" valign="middle">
				<td colspan="5">글쓰기</td>
			</tr>
			<tr>
			<td>
				게시판 번호
			</td>
			<td>
			<input name="board_Num" value="${bm.board_Num }" readonly="readonly"/>
			</td>
			</tr>
			<tr>
				<td>
					공개 범위
				</td>
				<td>
					<select name="board_Secret">
							<option value="1">전체 공개</option>
    						<option value="2">친구? 공개</option>
    						<option value="3">비공개</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">내 용</div>
				</td>
				<td><textarea name="board_Content" cols="67" rows="15">${bm.board_Content}</textarea>
				</td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr align="center" valign="middle">
				<td colspan="5">
					<a href="javascript:editboard(${bm.board_Num })">[수정]</a>
					&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[취소]</a>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>