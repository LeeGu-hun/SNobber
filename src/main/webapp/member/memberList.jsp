<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 조회</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#from, #to").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년'
				});
		getDate();
	});

	function getDate() {
		var newDate = new Date();
		var yyyy = newDate.getFullYear();
		var mm = newDate.getMonth() + 1;
		if (mm < 10) {
			mm = "0" + mm;
		}
		var dd = newDate.getDate();
		if (dd < 10) {
			dd = "0" + dd;
		}
		var fromDay = yyyy + "-" + mm + "-01";
		var toDay = yyyy + "-" + mm + "-" + dd;
		<c:if test="${cmd.from eq null }">
		document.getElementById("from").value = fromDay;
		</c:if>
		<c:if test="${cmd.to eq null }">
		document.getElementById("to").value = toDay;
		</c:if>
	}
</script>
<body>
	<form:form commandName="cmd">
		<p>
			<label>from :
			<form:input path="from" value="${requestScope.from }" readonly="readonly" /></label>
			<form:errors path="from" />
			~ <label>to :
			<form:input path="to" value="${requestScope.to }" readonly="readonly" /></label>
			<form:errors path="to" />
			<input type="submit" value="조회">
		</p>
	</form:form>

	<c:if test="${! empty members}">
		<table>
			<tr>
				<th>아이디</th>
				<th>이메일</th>
				<th>이름</th>
				<th>가입일</th>
			</tr>
			<c:forEach var="mem" items="${members}">
				<tr>
					<td>${mem.id}</td>
					<td><a href="<c:url value="/member/detail/${mem.id}"/>">
							${mem.email}</a></td>
					<td>${mem.name}</td>
					<td><fmt:formatDate value="${mem.regdate}"
							pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>