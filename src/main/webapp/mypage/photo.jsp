<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>타이틀이다.</title>
<script language="javascript">
function pop(){ 
	self.close();
}
</script>
</head>
<body>
	<div>
		<img src="${pageContext.request.contextPath}/${member.mem_Photo}"
			style="max-width: 150%; height: auto;" onclick="javascript:pop();">
	</div>
</body>
</html>