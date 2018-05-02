<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<title>SNobber</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-colors-flat.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3.css?ver=1">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<script src="${pageContext.request.contextPath}/js/scriptSc.js?ver=1"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">

<style>
body, h1 {
	font-family: "Montserrat", sans-serif
}

img {
	margin-bottom: -7px
}

.w3-row-padding img {
	margin-bottom: 12px
}

body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}
</style>





<body class="bo">
	<input type="hidden" id="session"
		value="${sessionScope.authInfo.mem_num}" />
	<!-- Sidebar -->
	<nav class="w3-sidebar w3-black w3-animate-top w3-xxlarge"
		style="display: none; padding-top: 150px;" id="mySidebar">
		<a href="javascript:void(0)" onclick="w3_close()"
			class="w3-button w3-black w3-xxlarge w3-padding w3-display-topright"
			style="padding: 6px 24px"> <i class="fa fa-remove"></i>
		</a>
		<div class="w3-bar-block w3-center">
			<a href="./main"
				class="w3-bar-item w3-button w3-text-grey w3-hover-black">Time
				Line</a> <a href="./searching"
				class="w3-bar-item w3-button w3-text-grey w3-hover-black">검색</a> <a
				href="./follow"
				class="w3-bar-item w3-button w3-text-grey w3-hover-black">My
				follow</a>

		</div>
	</nav>
	<div class="wrap">
		<%@ include file="/include/header.jsp"%>
	</div>
	<!-- !PAGE CONTENT! -->
	<div class="w3-content" style="max-width: 1500px">
		<!-- Header -->

		<div class="w3-opacity">



			<div class="w3-clear"></div>
			<header class="w3-center w3-margin-bottom" style="margin-top: 150px">

				<img src="./image/snobe.png" style="width: 20%; height: 10%;">

				<br>
				<p>
				<h3>
					<b>SNol: 네덜란드 어로 '놀다'를 뜻하며 <br>SNobber의 SNol에는 모두가 즐길 수 있는
						것들이 담겨있다.
					</b>
				</h3>
				</p>
			</header>
		</div>

		<div id="id01" class="w3-modal">
			<div class="w3-modal-content w3-card-4">
				<header class="w3-container w3-black">
					<span
						onclick="document.getElementById('id01').style.display='none'"
						class="w3-button w3-display-topright">&times;</span>
					<h2>Login</h2>
				</header>
				<div class="w3-container">
					<form:form commandName="loginCommand" action="login">
						<form:errors />
						<p>
							<label><spring:message code="id" />:<br> <form:input
									path="id" /> <form:errors path="id" /> </label>
						</p>
						<p>
							<label><spring:message code="password" />:<br> <form:password
									path="password" /> <form:errors path="password" /> </label>
						</p>
						<p>
							<label><spring:message code="rememberId" />: <form:checkbox
									path="rememberId" /> </label>
						</p>
						<input type="submit" value="<spring:message code="login.btn" />">
					</form:form>
				</div>
				<div style="margin-top: 20px; margin-bottom: 20px">
					<footer class="w3-container w3-black">
						<br>
					</footer>
				</div>
			</div>
		</div>


		<!-- Photo Grid -->
		<br>
		<br>
		<br>
		<div class="w3-row" id="myGrid" style="margin-bottom: 128px">
			<div style="margin-left: 150px;">
				<h1>
					<b>TODAY'S BEST SNol</b>
				</h1>
			</div>
			<br>
			<div class="w3-third"
				style="width: 80%; margin-right: 150px; float: right;">
				<div id="issue_folder">

					<c:forEach items="${fList}" var="fl" varStatus="sts">
						<div class="w3-third w3-container w3-margin-bottom">
							<h1>RANK ${fl.rownum }</h1>
							<c:if test="${fl.mem_photo != null}">
							<img src="${pageContext.request.contextPath}/${fl.mem_photo}"
								alt="Norway" style="width: 300px" class="w3-hover-opacity" height="200px">
							</c:if>
							<c:if test="${fl.mem_photo == null}">
							<img src="${pageContext.request.contextPath}/image/basic.png"
								alt="Norway" style="width: 300px" class="w3-hover-opacity" height="200px">
							</c:if>
							<div class="w3-container w3-white" style="margin-top: 20px">

								<table>
									<tr>
										<td><b>
												<h3>
													<a href="#" onclick="yourPage('${fl.mem_num}')">${fl.mem_nickname }</a>
												</h3>
										</b></td>
										<td></td>
									</tr>
									<tr>
										<td style="width:260px;"class="hot_scroll"
												data-issueIndex="${sts.index }">
												<a href="#" onclick="folder('${fl.folder_num}')">
													${fl.folder_title }</a>
											</td>
										<td>♥${fl.count}</td>
									</tr>
								</table>





							</div>
						</div>
					</c:forEach>
				</div>

















			</div>
		</div>
		<!-- End Page Content -->
	</div>

	<!-- Footer -->
	<footer
		class="w3-container w3-padding-64 w3-light-grey w3-center w3-opacity w3-xlarge"
		style="margin-top: 128px">
		<i class="fa fa-facebook-official w3-hover-opacity"></i> <i
			class="fa fa-instagram w3-hover-opacity"></i> <i
			class="fa fa-snapchat w3-hover-opacity"></i> <i
			class="fa fa-pinterest-p w3-hover-opacity"></i> <i
			class="fa fa-twitter w3-hover-opacity"></i> <i
			class="fa fa-linkedin w3-hover-opacity"></i>
		<p class="w3-medium">
			Powered by <a href="https://www.w3schools.com/w3css/default.asp"
				target="_blank" class="w3-hover-text-green">w3.css</a>
		</p>
	</footer>
	<script>
		function folder(num) {
			var session = document.getElementById('session').value;
			if (session == "") {
				alert('로그인 하세요');
			} else {
				$(location).attr('href', 'mypageFolder?num=' + num + '');
			}

		}
		function yourPage(num) {
			var session = document.getElementById('session').value;
			if (session == "") {
				alert('로그인 하세요 ');
			} else {
				$(location).attr('href', 'mypagePro?num=' + num + '');
			}

		}
		

		
		function logout() {
			$(location).attr('href', "./logout");
		}

		function w3_open() {
			document.getElementById("mySidebar").style.width = "100%";
			document.getElementById("mySidebar").style.display = "block";
		}

		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
		}
	</script>
</body>

</html>