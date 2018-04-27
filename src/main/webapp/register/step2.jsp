<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
</head>
<body>
<div><%@include file="../include/joinHeader.jsp" %></div>
	<div style="margin-left:100px;"><h2>회원 정보 입력</h2>
	<form:form action="step3" commandName="registerRequest"  enctype="multipart/form-data">
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
			<label>사진:<br> 
			<form:input type="file" path="mem_Photo" />
			<form:errors path="mem_Photo" />
			</label>
		</p>
		<p>
			<label>자기소개:<br> 
			<form:input type="textarea" path="mem_Introduce" />
			<form:errors path="mem_Introduce" />
			</label>
		</p>
		<input type="submit" value="가입 완료" />
	</form:form>
	</div>
	<div>

		<%@ include file="/include/footer2.jsp"%>

	</div>
</body>
</html>