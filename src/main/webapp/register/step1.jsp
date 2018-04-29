<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>	
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="member.register" /></title>
</head>
<body>
<div>
<div><%@include file="../include/joinHeader.jsp" %></div>
	<div style="margin-left:100px; text-align: center;"><h2>회원 정보 입력</h2>
	<form:form action="step2" commandName="registerRequest"  enctype="multipart/form-data">
	<h2>
		<spring:message code="term" />
	</h2>
	
		
		<textarea rows="10" cols="50" disabled="disabled">
		SNobber의 약관내용입니다.
		SNobber는 자신의 자신의 능력을 보여주며 함께 즐길 수 있는 곳으로 개인간 사건에 대한 형사상 책임은 없습니다.
		해당 약관을 잘 읽어보시고 동의하신다면 체크바랍니다.
		Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum cursus vulputate lorem ut blandit. Morbi convallis, arcu ut volutpat porta, nibh ex consectetur lectus, eu commodo sem lacus rutrum ex. Cras consequat, sem a semper tristique, est nisi pellentesque metus, sit amet ullamcorper odio enim ut nunc. Aliquam blandit sapien eu nibh ornare tempor. Fusce a urna porta, aliquet sem et, cursus turpis. Nam id sollicitudin augue. Morbi eu mattis sem, ac sodales turpis. Pellentesque in lorem et ex sagittis lacinia. Praesent feugiat, tellus vitae feugiat iaculis, enim nulla aliquet nulla, in blandit nisi sapien quis lorem.
		Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum cursus vulputate lorem ut blandit. Morbi convallis, arcu ut volutpat porta, nibh ex consectetur lectus, eu commodo sem lacus rutrum ex. Cras consequat, sem a semper tristique, est nisi pellentesque metus, sit amet ullamcorper odio enim ut nunc. Aliquam blandit sapien eu nibh ornare tempor. Fusce a urna porta, aliquet sem et, cursus turpis. Nam id sollicitudin augue. Morbi eu mattis sem, ac sodales turpis. Pellentesque in lorem et ex sagittis lacinia. Praesent feugiat, tellus vitae feugiat iaculis, enim nulla aliquet nulla, in blandit nisi sapien quis lorem.
		</textarea>
		<br>
	
		<label> <input type="checkbox" name="agree" value="true">
			<spring:message code="term.agree" />
		</label>
		<p>
			<label>ID:<br> 
			<form:input path="mem_Id" />
			<form:errors path="mem_Id" />
			</label>
		</p>
			<label>이름:<br> 
			<form:input path="mem_Name" />
			<form:errors path="mem_Name" />
			</label>
		</p>
		<p>
			<label>비밀번호:<br> 
			<form:password path="mem_Password" />
			<form:errors path="mem_Password" />
			</label>
		</p>
		<p>
			<label>비밀번호 확인:<br> 
			<form:password path="mem_ConfirmPassword" />
			<form:errors path="mem_ConfirmPassword" />
			</label>
		</p>
		<p>
			<label>이메일:<br> 
			<form:input path="mem_Email" />
			<form:errors path="mem_Email" />
			</label>
		</p>
		<p>
		<p>
			<label>자기소개:<br> 
			<form:input type="textarea" path="mem_Introduce" />
			<form:errors path="mem_Introduce" />
			</label>
		</p>
		<p>
			<label>사진:<br> 
			<form:input type="file" path="mem_Photo" />
			<form:errors path="mem_Photo" />
			</label>
		</p>
		<input type="submit" value="가입 완료" />
	</form:form>
	</div>
	<br>
	<div>

		<%@ include file="/include/footer.jsp"%>

	</div>
</div>
</body>
</html>