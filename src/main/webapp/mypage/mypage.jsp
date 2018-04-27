<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" media="all" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" ver="1.2">
<script src="${pageContext.request.contextPath}/js/common.js?ver=2"></script>
<script language="javascript">
	function pop() {
		window
				.open(
						"mypage/photo",
						"pop",
						"width=400,height=500,history=no,resizable=no,status=no,scrollbars=yes,menubar=no")
	}
</script>
</head>
<body>

	<table style="height: 200px;">
		<tr>
			<td rowspan="10" style="width: 220px;">
				<div
					style="width: 150px; height: 150px; border-radius: 50%; border: 1px solid gray; overflow: hidden;">
					<img src="${pageContext.request.contextPath}/${member.mem_Photo}"
						style="max-width: 150%; height: auto;" onclick="javascript:pop()">
				</div> <a href="mypage/photoEdit">사진 수정</a>
			</td>
			<td>이름 ${member.mem_Nickname }</td>
			<td><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">수정</button>
			<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p><%@ include file="mypageEdit.jsp"%></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  

						
					</td>
		</tr>
		<tr>
			<td>이메일 ${member.mem_Email }</td>
		</tr>
		<tr>
			<td>소개 ${member.mem_Introduce }</td>
		</tr>
	</table>
</body>
</html>