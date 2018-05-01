<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<c:if test="${member.mem_Photo != null}">
		<img src="${pageContext.request.contextPath}/${member.mem_Photo}"
			style="max-width: 150%; height: auto;" onclick="javascript:pop();">
		</c:if>
		<c:if test="${member.mem_Photo == null}">
		<img src="./image/basic.png"
			style="max-width: 150%; height: auto;" onclick="javascript:pop();">
		</c:if>
	</div>
</body>
</html>