<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script language="javascript">
		function mypageModify() {
			mypageEdit.submit();
		}
	</script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" ver="1.2">
</head>
<body>
	<form:form  method="post" name="mypageEdit" commandName="mypageEditCommand" enctype="multipart/form-data">
	<table style="height: 200px;">
		<tr>
			<td rowspan="10" style="width: 220px;">
				<div style="width:150px; height:150px; border-radius: 50%; border: 1px solid gray; overflow: hidden;">
					<img src="${pageContext.request.contextPath}/${member.mem_Photo}" style="max-width: 150%; height: auto;">
				</div>
			</td>
			<td>
				이름
			</td>
			<td>
				<input name="mem_nickname" type="text" value="${member.mem_Nickname }" >
			</td>	
		</tr>
		<tr>
			<td>
				이메일
			</td>
			<td>				
				<input name="mem_email" type="text" value="${member.mem_Email }">
			</td>
		</tr>
		<tr>
			<td>
				비밀번호
			</td>
			<td>
				<input name="mem_password" type="password" value="${member.mem_Password }">
			</td>
		</tr>
		<tr>
			<td>
				소개
			</td>
			<td>
				<textarea name="mem_introduce">
					${member.mem_Introduce }
				</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<a href="javascript:mypageModify()" class="btn btn-default" data-dismiss="modal">변경</a>
			</td>
			<td>
				<a href="javascript:history.back();" class="btn btn-default" data-dismiss="modal">뒤로</a>
			</td>			
		</tr>		
	</table>	
	</form:form>
</body>
</html>