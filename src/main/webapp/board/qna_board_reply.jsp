<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
	<title>MVC 게시판</title>
	<script language="javascript">
	function replyboard(){
		boardform.submit();
	}
	</script>
</head>
<body>
<!-- 게시판 답변 -->
<form:form commandName="boardCommand"  method="post" name="boardform">
<input type="hidden" name="BOARD_NUM" value="${board.BOARD_NUM}">
<input type="hidden" name="BOARD_RE_REF" value="${board.BOARD_RE_REF}">
<input type="hidden" name="BOARD_RE_LEV" value="${board.BOARD_RE_LEV}">
<input type="hidden" name="BOARD_RE_SEQ" value="${board.BOARD_RE_SEQ}">

<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">MVC 게시판</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">글쓴이</div>
		</td>
		<td>
			<label>${board.BOARD_NAME}</label>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="BOARD_SUBJECT" type="text" size="50" 
				maxlength="100" value="Re:${board.BOARD_SUBJECT}"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="BOARD_CONTENT" cols="67" rows="15"></textarea>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">비밀번호</div>
		</td>
		<td>
			<input name="BOARD_PASS" type="password">
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
		<a href="javascript:replyboard()">[등록]</a>&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">[뒤로]</a>
		</td>
	</tr>
</table>
</form:form>
<!-- 게시판 답변 -->
</body>
</html>