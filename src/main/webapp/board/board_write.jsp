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
<title>글 쓰기</title>
<script language="javascript">
	function change(){
		
		var type=document.getElementById("type").value;
		if(type=="1"){
			document.getElementById("folder1").style.display='none';
			document.getElementById("folder2").style.display='none';
		}
		else{
			var files = document.getElementById("files").value;
			document.getElementById("folder1").style.display='block';
			document.getElementById("folder2").style.display='block';
		}
	}
	function addboard() {
		var type=document.getElementById("type").value;
		var files = document.getElementById("files").value;
		if(type=="1"){
			boardform.submit();
		}else if(type=="2"){
			if(files==""){
				alert("pro글을 쓸 때는 파일을 선택 해주세요 ");
			}else{
				boardform.submit();
			}
		}
	}
</script>
</head>
<body>
	<!-- 게시판 등록 -->
	<form:form method="POST" commandName="boardCommand" name="boardform"
		enctype="multipart/form-data">
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td>
					글 분류
				</td>
				<td>
					<select name="writeMode" onchange="change()" id="type">
							<option id="sns" value="1">SNS</option>
    						<option id="pro" value="2">PRO</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					공개 범위
				</td>
				<td>
					<select name="secretMode">
							<option value="1">전체 공개</option>
    						<option value="2">친구? 공개</option>
    						<option value="3">비공개</option>
					</select>
				</td>
			</tr>
				<tr>
					
					<td>
						<div id ="folder1" style="display:none">
						폴더 선택
						</div>
					</td>
					<td>
						<div id ="folder2" style="display:none">
						<select name="folderMode">
							<c:forEach var="f" items="${title}">
	    						<option value="${f.folder_Num}">${f.folder_Title}</option>
	    					</c:forEach>
						</select>
						</div>
					</td>
					</div>
				</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">내 용</div>
				</td>
				<td><textarea name="BOARD_CONTENT" cols="67" rows="15"></textarea>
				</td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">파일 첨부</div>
				</td>
				<td><input id="files" name="BOARD_FILE" type="file" class="w3-button w3-theme"/></td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr align="center" valign="middle">
				<td colspan="5">
					<a href="javascript:addboard()" class="w3-button w3-theme">Post</a>
					&nbsp;&nbsp;
					<a href="javascript:hide()" class="w3-button w3-theme">Cancle</a>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>