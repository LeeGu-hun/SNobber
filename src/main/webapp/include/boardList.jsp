<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<title>W3.CSS Template</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3.css?ver=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3-theme-blue-grey.css?ver=1">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: "Open Sans", sans-serif
}
</style>



<script src="${pageContext.request.contextPath}/js/scriptSc.js?ver=1"></script>
<script type="text/javascript">
	
	
	function boardNum(num) {
		$(location).attr('href', './mypageWritingView?num='+num+'');
	}
	function memNum(num) {
		$(location).attr('href', './mypagePro?num='+num+'');
	}
</script>







<body class="w3-theme-l5">

	<!-- Navbar test-->

	<!-- Navbar on small screens -->
	<div id="navDemo"
		class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
		<a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
		<a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
		<a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
		<a href="#" class="w3-bar-item w3-button w3-padding-large">My
			Profile</a>
	</div>

	<!-- Page Container -->
	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 80px">
		<!-- The Grid -->
		<div class="w3-row">
			<!-- Left Column -->
			<div class="w3-col m3">
				<!-- Profile -->
			</div>

			<!-- Middle Column -->
			<div>
				<div class="w3-col m7" id="table_id"
					style="width: 70%; margin-left: 94px; float: left">
					<c:forEach var="bo" items="${list}" varStatus="status">
						<div class="w3-container w3-card w3-white w3-round w3-margin">
							<br> 
							<c:if test="${bo.mem_Photo != null}">
							<img src="${pageContext.request.contextPath}/${bo.mem_Photo}"
								class="w3-left w3-circle w3-margin-right"
								style="width: 100px; margin-top: 10px"> 
							</c:if>
							<c:if test="${bo.mem_Photo == null}">
							<img src="${pageContext.request.contextPath}/image/basic.png"
								class="w3-left w3-circle w3-margin-right"
								style="width: 100px; margin-top: 10px"> 
							</c:if> 
								<span class="w3-right w3-opacity">${bo.board_Date }</span>
							<h4>
								<a href="#" onclick="memNum('${bo.mem_Num}')"
									style="text-align: right; margin-top:10px"> ${bo.mem_Nickname} </a>
							</h4>
							<br>
							<hr class="w3-clear">
							<span ><p class="content">${bo.board_Content}</span></p><a href="#"
									onclick="boardNum(${bo.board_Num})"
									style="text-decoration: none; margin-top: 10px"><자세히보기></a>
							
							<div class="w3-row-padding" style="margin: 0 -16px">
								<div class="w3-half">
									<c:if test="${bo.board_File ne null}">
										<div class="w3-row-padding" style="margin: 0 -16px">
											<c:if test="${bo.board_File != null}">
											<img
												src="${pageContext.request.contextPath}/${bo.board_File}"
												style="width: 400px; height: 300px; boarder-radius: 50%;">
											</c:if>
										</div>
									</c:if>
								</div>
							</div>
							<button type="button"
								style="background-color: #000; margin-top:10px; border: none; overflow: hidden; text-decoration: none; color: inherit; background-color: inherit; text-align: right; cursor: pointer; white-space: nowrap;"
								class="likeScroll" data-ch="${status.index}">
								<span id="btnLike"> <a href="#"
									onclick="check('${bo.board_Num}','${bo.like_on}','${status.index}')"
									style="text-decoration: none;"> ${bo.like_on == 1 ? "<img src='./image/like.png'>":"<img src='./image/unlike.png'>"}</a>
								</span>
							</button>
							<span
								style="margin-top:10px">
								${bo.count}</span>
						</div>
					</c:forEach>

					<c:if test="${empty list }">
						등록된 글이 없습니다.
					</c:if>
					<!-- End Middle Column -->
				</div>
			</div>
			<!-- End Grid -->
		</div>
				<div id="b_id">
					<button onclick="te()" id="showBt">더보기</button>
				</div>
		<!-- End Page Container -->
	</div>
	<br>

<script type="text/javascript">

function te(){
	$("#showBt").hide();
    var lastbno = $(".likeScroll:last").attr("data-ch");
var lastbnoTest= Number(lastbno) + Number(10);
alert("lastbnoTest:"+lastbnoTest);
lastbno++;
    $.ajax({
		
  	  type : "POST",
			dataType : "json",
			url : "./boardScroll",
			data : "lastbnoTest="+ lastbnoTest+"&lastbno="+lastbno,
			success : sc
			
    });
}





</script>

<script>
function sc(data) {

	var lastbno=new Array();
	var reallastbno=data.realscrolllastbno;
	
	var listSize = data.listSize;


     var content= Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
     var count= Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
     var like_on =  Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
     var mem_num =  Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
     var mem_nickname= Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
     var board_num= Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
     var mem_photo= Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);     
     var tag= Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
 	var scrollIndex = data.scrollIndex;
 	var file=Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
 	var boarddate=new Array;
 	var allList = data.allList;	

	var liketag= Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
	var c_tag= Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
	var btag="<button onclick='te()' id='showBt'>더보기</button>"
 	
     for (var i=Number(reallastbno); i<Number(listSize); i++)
    {
    	file[i]=eval("data.scrollAddFile"+i);
    	 lastbno[i]=eval("data.scrolllastbno"+i);
          content[i]=eval("data.scrollAddCon"+i);
    	  like_on[i]=eval("data.scrollAddLi"+i);
    	  mem_num[i]=eval("data.scrollAddMeNu"+i);
    	  mem_nickname[i]=eval("data.scrollAddMeN"+i);
    	  board_num[i]=eval("data.scrollAddBoardBum"+i);
    	  //사진 배열에저장
    	  mem_photo[i]=eval("data.scrollAddPhoto"+i);
    	count[i]=eval("data.count"+i);
    	boarddate[i]=eval("data.boarddate"+i);
    	  console.log( "boarddate[i]:"+boarddate[i]);

    	  
    	 
    }
	var u='${pageContext.request.contextPath}';
	var filetag= Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
	var memtag= Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
     for(var i=Number(reallastbno); i<Number(listSize); i++){
    	 tag[i] = like_on[i] == 1 ? "<img src='./image/like.png'>":"<img src='./image/unlike.png'>";
       memtag[i]= mem_photo[i] !=null ? "<img src='"+u+"/"+mem_photo[i]+"' class='w3-left w3-circle w3-margin-right' style='width: 100px; margin-top: 10px'>":"<img src='./image/basic.png' class='w3-left w3-circle w3-margin-right' style='width: 100px; margin-top: 10px'>";
    
    
     }
     

     var s='${pageContext.request.contextPath}';
     for(var i=Number(reallastbno); i<Number(listSize); i++){
    	 filetag[i]= file[i]!=0? file[i]:"";
   	
    	
    	 //파일 부분
     }
 
	for (var i=Number(reallastbno); i<Number(listSize); i++)
	    {
		liketag[i] = "<span id='btnLike'><a href='#' style='text-decoration:none;' onclick="
	+ "'check(\"" + board_num[i]+ "\",\"" + like_on[i] + "\",\""
	+ lastbno[i] + "\")'>" + tag[i] + "</a></span>";
      c_tag[i]= content[i]+ "<a href='#' style='text-decoration:none;' onclick="+"'boardNum(\""+board_num[i]+"\")'><자세히보기></a>"
	    } 

	
if(listSize<=allList){
		for (var i=Number(reallastbno); i<Number(listSize); i++){
            $('#table_id').append("<div class='w3-container w3-card w3-white w3-round w3-margin'><br><p>"+memtag[i]+
			            
			"<span class='w3-right w3-opacity'>"+boarddate[i]+"</span><h4><a href='#' onclick="+"'memNum(\""+mem_num[i] +"\")' style='text-align: right;'>"+mem_nickname[i]+"</a></h4>"+

			"<br><hr class='w3-clear'><p class='content'>"+ 

			content[i]+ "<a href='#' onclick="+"'boardNum(\""+board_num[i]+"\")' style='text-decoration: none; margin-top: 10px'><자세히보기></a></p>"+

			"<div class='w3-row-padding' style='margin: 0 -16px'>"+"<div class='w3-half'><img src='"+s+"/"+filetag[i]+"'></div>"+

			"</div><button type='button' style='background-color: #000; margin-bottom: 16px; border: none; display: inline-block; overflow: hidden; text-decoration: none; color: inherit; background-color: inherit; cursor: pointer; white-space: nowrap; class='likeScroll' data-ch="+lastbno[i]+">"+liketag[i]+"</button>"+

			"<span style='margin-top:10px'>"+count[i]+"</span></div>");

		} 
	
	
		if(scrollIndex<allList){
	   $('#b_id').append("<div><button onclick='te()' id='showBt'>더보기</button></div>");
	    	
	 	}	
	 	$("#showBt").hide();

	} 



}
</script>



</body>
</html>
