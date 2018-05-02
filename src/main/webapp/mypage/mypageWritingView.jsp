<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
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
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" ver="1.2">
<link rel="stylesheet"href="${pageContext.request.contextPath}/resources/css/min.css" ver="1.2" />
<script src="${pageContext.request.contextPath}/js/common.js?ver=2"></script>
<script>
	function reAdd(num) {
		var Content = $('#reContent').val();
		
		$.ajax({ 
			type : "POST",
			url : "./mypageRe",
			data : {Content : Content, num : num},
			success : mypageRe
		});		
	}
	function mypageRe() {		
		alert('댓글 쓰기 완료');
		var next = $('.next1').val();
		$(location).attr('href', './mypageWritingView?num=' + next + '');
	}
	
	function modifyRe(num) {
		$.ajax({ 
			type : "POST",
			url : "./modifyRe",
			data : { num : num},
			success : modifyRe2
		});		
	}
	function modifyRe2() {		
		var next = $('.next1').val();
		$(location).attr('href', './mypageWritingView?num=' + next + '');
	}
	
	function deleteRe(num) {
		$.ajax({ 
			type : "POST",
			url : "./deleteRe",
			data : { num : num},
			success : deleteRe2
		});		
	}
	function deleteRe2() {		
		var next = $('.next1').val();
		$(location).attr('href', './mypageWritingView?num=' + next + '');
	}
	function boardNum(num) {
		$(location).attr('href', './boardEdit?num='+num+'');
	}
	function memNum(num) {
		$(location).attr('href', './mypagePro?num=' + num + '');
	}
	function boardDelete() {
		var num = $('#boNum').attr("value");
		var id = "Like";

		$.ajax({
			type : "POST",
			url : "./mypageBoardDelete",
			data : {
				id : id,
				num : num
			},
			success : boardDelete2
		});
	}
	function boardDelete2(num) {
		var next = $('.next').val();

		$(location).attr('href', './mypagePro?num=' + next + '');
	}
	
	function checkLike(mem_num){
		var num =$('.next').val();
		var like=parseInt($('#likeNum').val());
		if(mem_num==1){
			$.ajax({
				type : "POST",
				url : "./likeAdd",
				data : {
					num : num,
					like:like
				},
				success : addLike()
			});
			//var frm =document.getElementById('likeCheck'); 
			//frm.innerHTML ='<img src="${pageContext.request.contextPath}/image/like.png" onclick="checkLike('2')" >';
		}
		else if(mem_num==2){
			$.ajax({
				type : "POST",
				url : "./likeDelete",
				data : {
					num : num,
					like: like
				},
				success : deleteLike()
			});
			//var frm =document.getElementById('likeCheck');
			//frm.innerHTML = "<img src="${pageContext.request.contextPath}/image/unlike.png" onclick="checkLike('1')">";
		}
	}
	function addLike(data){
		var addr=$('#addr').val();
		var like=parseInt($('#likeNum').val());
		var str ="checkLike(2)";
		var spanTag = "<img src='"+addr+"/image/like.png' style='width: 15px; height:15px;'  onclick='"+str+"'>";
		$('#likeCheck').html(spanTag);
		$('#likeText').html(like+1);
	}
	function deleteLike(data){
		var addr=$('#addr').val();
		var like=parseInt($('#likeNum').val());
		var str ="checkLike(1)";
		var spanTag = "<img src='"+addr+"/image/unlike.png' style='width: 15px; height:15px;' onclick='"+str+"'>";
		$('#likeCheck').html(spanTag);
		$('#likeText').html(like);
	}
</script>
<script type="text/javascript">
function ingShow(num) {
	$('#boNum').attr("value", num);
	$('#lightBoxOK').attr("value", num);

	$("#content").html("정말 삭제하시겠습니까?");
	document.getElementById('myModalll').style.display = 'block';
	//modal을 띄워준다.  	    
}
</script>
</head>
<body style="background-color: silver;">
	
	<div style="width: 100%; text-align: center;">	
		<%@ include file="/include/header.jsp"%>
			<br>
			<c:forEach var="bm" items="${bm }">
			<input class="next" type="text" value="${bm.mem_Num }" style="display: none;">
			<input class="next1" type="text" value="${bm.board_Num }" style="display: none;">
			<input id="addr" type="hidden" value="${pageContext.request.contextPath}">
			<input id="likeNum" type="hidden" value="${likeNum}">
			<div id="column">
			<figure>
				<p style="text-align: left; margin-left: 10px;">
				<c:choose>
					<c:when test="${bm.mem_photo != null}">
						<img src="${pageContext.request.contextPath}/${bm.mem_photo}" style='width:15%;' >			
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath}/image/basic.png" style='width:15%;'>
					</c:otherwise>
				</c:choose>
				${bm.mem_Nickname }
				</p>
				<c:if test="${bm.board_File != null}">
				<img src="${pageContext.request.contextPath}/${bm.board_File }" style="width: 500px; height: 500px;"/>
				</c:if>
				<figcaption>
				<p style="width: 500px;">
				${bm.board_Content }
				</p>
				좋아요
				<span id="likeText">
					${likeNum }
				</span>
				<span id="likeCheck">
					<c:choose>
						<c:when test="${like =='0'}">
							<img src="${pageContext.request.contextPath}/image/unlike.png" onclick="checkLike('1')" style="width: 15px; height:15px;" >
						</c:when>
						<c:when test="${like == '1'}">
							<img src="${pageContext.request.contextPath}/image/like.png" onclick="checkLike('2')" style="width: 15px; height:15px;">
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/image/like.png" onclick="checkLike('2')" style="width: 15px; height:15px;">
						</c:otherwise>
					</c:choose>
				</span>
				<span>
				${bm.board_Date }
				</span>
				<c:if test="${host eq bm.mem_Num }">
				<a href="#" onclick="boardNum(${bm.board_Num})"style="text-align: left; font-size: 0.8em;">수정</a>
				<a class="boardD" href="#" onclick="ingShow('${bm.board_Num}')" style="text-align: left; font-size: 0.8em;">
				삭제
				</a>	
				</c:if>
			</figcaption>							
			</figure>
			</div>
				<div>	
					<div style="margin-top: 5px; width: 90%; margin: 0 auto;">
					댓글
					<textarea id="reContent" style="width: 30%;"></textarea>
					<input type="button" value="추가" onclick="reAdd(${bm.board_Num})">					
					</div>
					<br>
					<c:forEach var="re" items="${re }">
						<table style="width: 30%; margin-top: 5px; margin: 0 auto;">
							<tr style="font-size: 8pt; background-color: white;  text-align: left;">
								<td style="width: 50px;">
									<c:if test="${re.mem_Photo != null}">
									<img src="${pageContext.request.contextPath}/${re.mem_Photo }" style="width: 50px; height: 50px;"
										onclick="javascript:memNum(${re.mem_Num})"> 
									</c:if>
									<c:if test="${re.mem_Photo == null}">
									<img src="${pageContext.request.contextPath}/image/basic.png" style="width: 50px; height: 50px;"
										onclick="javascript:memNum(${re.mem_Num})"> 
									</c:if>  
								</td>
								<td style="width: 10%; font-size: small;" onclick="javascript:memNum(${re.mem_Num})">
									${re.mem_Nickname}
								</td>
								<td style="width: 60%; font-size: large;">
									${re.re_Content }
								</td>
								<td style="width: 20%;">
									${re.re_Date }
								</td>
								<td style="font-size: x-small; width: 10%;">
									<c:if test="${host eq bm.mem_Num}">
										<c:if test="${host eq re.mem_Num }">
											<span onclick="modifyRe('${re.re_Num}')">
												Edit
											</span>																		
										</c:if>
										<span onclick="deleteRe('${re.re_Num}')">
											Delete
										</span>
									</c:if>
									<c:if test="${host ne bm.mem_Num }">
										<c:if test="${host eq re.mem_Num }">
											<span onclick="modifyRe('${re.re_Num}')">
												Edit												
											</span>
											
											<span onclick="deleteRe('${re.re_Num}')">
												Delete
											</span>
										</c:if>								
									</c:if>									
								</td>
							</tr>
						</table>				
					</c:forEach>
				</div>
			</c:forEach>			
		</div>
		<!-- Modal -->
		<div id="myModalll" class="w3-modal"> 
			<div class="w3-modal-content">
				<div class="w3-container">
					<span
						onclick="document.getElementById('myModal').style.display='none'"
						class="w3-button w3-display-topright">&times;</span> <input
						type="hidden" id="title" name="title" />
					<p id="content"></p>
					<input type="hidden" id="boNum" name="boNum" />
					<div id="lightBoxOK">
						<input type="button" value="확인" onclick="boardDelete()"style="text-align: right;">
						<input type="button" onclick="document.getElementById('myModalll').style.display='none'"
							value="취소">
					</div>
					<p>&nbsp;</p>
				</div> 
			</div>
		</div>
		<br>
		<%@ include file="/include/footer.jsp" %>
	</div>
</body>
</html>