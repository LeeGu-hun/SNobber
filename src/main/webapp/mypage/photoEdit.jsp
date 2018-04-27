<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>타이틀이다.</title>
<script language="javascript">
		function photoModify() {
			photoEdit.submit();
		}
</script>
</head>
<body>
	<form:form  method="post" name="photoEdit" commandName="mypageEditCommand" enctype="multipart/form-data">
	<table style="height: 200px;">
		<tr>
			<td rowspan="10" style="width: 220px;">
				<div style="width:150px; height:150px; border-radius: 50%; border: 1px solid gray; overflow: hidden;">
					<img src="${pageContext.request.contextPath}/${member.mem_Photo}" style="max-width: 150%; height: auto;">
				</div>
					<input name="mem_photo" type="file" value="${member.mem_Photo }" >
			</td>
		</tr>
	
		<tr>
			<td>
				<a href="javascript:photoModify()">변경</a>
			</td>
			<td>
				<a href="javascript:history.back();">뒤로</a>
			</td>			
		</tr>
		</table>
	</form:form>
</body>
</html>