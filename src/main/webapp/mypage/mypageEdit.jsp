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
	
	<style>
	
	td{
	
	}
	
	</style>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" ver="1.2">
</head>
<body>
	<form:form  action="mypageEditt" commandName="mypageEditCommand" enctype="multipart/form-data">
	<table style="height: 200px;">
		<tr>
			<td rowspan="10" style="width: 220px;">
				<div style="width:150px; height:150px; border-radius: 50%; border: 1px solid gray; overflow: hidden;">
					<c:if test="${member.mem_Photo != null}">
						<img src="${pageContext.request.contextPath}/${member.mem_Photo}"
							style="max-width: 150%; height: auto; margin-bottom: 100px"
							onclick="javascript:pop()">
					</c:if>
					<c:if test="${member.mem_Photo == null}">
						<img src="${pageContext.request.contextPath}/image/basic.png"
							style="max-width: 100%; height: auto; margin-bottom: 100px"
							onclick="javascript:pop()">
					</c:if>
				</div>
			</td>
			<td style="text-align: center; margin-bottom: 10px;">
				이름
			</td>
			<td>
				<input name="mem_Nickname" type="text" value="${member.mem_Nickname }" readonly="readonly">
			</td>	
		</tr>
		<tr>
			<td style="text-align: center; margin-bottom: 10px;">
				이메일
			</td>
			<td>				
				<input name="mem_Email" type="text" value="${member.mem_Email }" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td style="text-align: center">
				비밀번호
			</td>
			<td>
				<input name="mem_Password" type="password" value="${member.mem_Password }">
			</td>
		</tr>
		<tr>
			<td style="text-align: center">
				소개
			</td>
			<td>
				<textarea name="mem_Introduce">
					${member.mem_Introduce }
				</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" class="btn btn-default" value="변경">
				<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModald">탈퇴</button>
			</td>
		</tr>		
	</table>	
	</form:form>
	
	<div class="modal fade" id="myModald" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">회원 탈퇴</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
				<div class="modal-body" style="text-align: center;">
					<p>정말 탈퇴하싈?</p>
				</div>
				<a href="outmem" class="btn btn-default">탈퇴</a>
				</div>
		</div>
	</div>
</body>
</html>