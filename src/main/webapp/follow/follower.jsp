<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function ingShow(type, num, name) {
		$('#lightBoxOK').attr("value", num);
		$('#type').attr("value", type);

		$("#title").attr("value", num);
		if (type == "1") {
			$("#content").html(name + " 님 팔로잉을 취소 하시겠습니까");
			$("#content").attr("value", name);
		} else if (type == "2") {
			$("#content").html(name + " 님 팔로워 신청 하시겠습니까");
			$("#content").attr("value", name);
		}
		document.getElementById('myModal').style.display = 'block';
		//modal을 띄워준다.  	    
	}
	function memNum(num) {
		$(location).attr('href', './mypagePro?num=' + num + '');
	}
</script>
</head>
<style>
</style>
<body>

	
	<!-- 팔로워 리스트 -->
	<div style="margin-top:150px; width:100px; folat:left;">
<table class="w3-table w3-bordered" style="width: 400px">
			<tr>
				<th colspan="2">팔로워</th>
			</tr>
	
	<c:forEach var="fol" items="${follower}">
		<div>
			<tr>
						
	<td rowspan="2"><div
							style="width: 150px; height: 150px; border-radius: 50%; border: 1px solid gray; overflow: hidden;">
							<img src="${pageContext.request.contextPath}/${fol.mem_Photo}"
								style="max-width: 150%; height: auto;">
						</div></td>
						<td><a href="#" onclick="memNum('${fol.mem_Num}')">${fol.mem_Nickname}</a></td>

					</tr>
					<tr>
						<td>${fol.mem_Introduce}</td>
					</tr>
					<tr>
						<td colspan="2">
							<c:choose>
								<c:when test="${fol.follow == 1}">
										팔로우중
									</c:when>
								<c:otherwise>
									<input type="button" class="w3-button w3-black"
										onclick="ingShow('2','${fol.mem_Num}','${fol.mem_Nickname}')"
										value="신청">
								</c:otherwise>
							</c:choose>
							
						</div>
					</td>
				</tr>
				<tr>
					
				</tr>

			</table>
		</div>
	</c:forEach>
	<!-- Modal -->
	<div id="myModal" class="w3-modal">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span
					onclick="document.getElementById('myModal').style.display='none'"
					class="w3-button w3-display-topright">&times;</span>
				<form action="followsubmit" method="POST">
					<input type="hidden" id="title" name="title" />
					<p id="content"></p>
					<input type="hidden" id="type" name="type" />
					<div id="lightBoxOK">
						<input type="submit" value="확인"> <input type="button"
							onclick="document.getElementById('myModal').style.display='none'"
							value="취소">
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
	
</body>
</html>
