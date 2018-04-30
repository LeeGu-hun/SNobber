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


<script src="${pageContext.request.contextPath}/js/scriptSc.js?ver=2"></script>
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



				<!-- Accordion -->


				<!-- Interests -->




				<!-- End Left Column -->
			</div>

			<!-- Middle Column -->
			<div>
				<div class="w3-col m7" id="table_id"
					style="width: 70%; margin-left: 94px; float: left">

					<c:forEach var="bo" items="${list}" varStatus="status">
						<div class="w3-container w3-card w3-white w3-round w3-margin">

							<p>

								<img src="${pageContext.request.contextPath}/${bo.mem_Photo}"
									style="width: 50px; height: 50px; boarder-radius: 50%;">
								<a href="#" onclick="memNum('${bo.mem_Num}')">
									${bo.mem_Nickname} </a>
							</p>
							<br>
							<hr class="w3-clear">
							<span id="searchHash"> ${bo.board_Content} <a href="#"
								onclick="boardNum(${bo.board_Num})"
								style="text-decoration: none;"><자세히보기></a>
							</span> <br> <br> <br>
							<c:if test="${bo.board_File ne null}">
								<div class="w3-row-padding" style="margin: 0 -16px">
									<img src="${pageContext.request.contextPath}/${bo.board_File}"
										style="width: 400px; height: 300px; boarder-radius: 50%;">
								</div>
							</c:if>
							<button type="button"
								style="background-color: #000; margin-bottom: 16px; border: none; display: inline-block; padding: 8px 16px; vertical-align: middle; overflow: hidden; text-decoration: none; color: inherit; background-color: inherit; text-align: center; cursor: pointer; white-space: nowrap;"
								class="likeScroll" data-ch="${status.index}">
								<span id="btnLike"> <a href="#"
									onclick="check('${bo.board_Num}','${bo.like_on}','${status.index}')"
									style="text-decoration: none;"> ${bo.like_on == 1 ? '★':'☆'}</a>
								</span>
							</button>

						</div>
					</c:forEach>

					<c:if test="${empty list }">
	등록된 글이 없습니다.
	</c:if>
					<!-- End Middle Column -->
				</div>
				<div id="b_id">
					<button onclick="te()" id="showBt">더보기</button>
				</div>
			</div>


			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>
	<br>

	<script>










</script>

	<script type="text/javascript">

function te(){
	$("#showBt").hide();
    var lastbno = $(".likeScroll:last").attr("data-ch");
var lastbnoTest= Number(lastbno) + Number(10);
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
     var like_on =  Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
     var mem_num =  Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
     var mem_nickname= Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
     var board_num= Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
     var mem_photo= Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);     
     var tag= Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
 	var scrollIndex = data.scrollIndex;
 	var file=Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
 	
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
    	  mem_photo[i]=eval("data.scrollAddPhoto"+i);
    	 console.log( "file[i]:"+file[i]);
    	 
    }
	var u='${pageContext.request.contextPath}';
	var filetag= Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
     for(var i=Number(reallastbno); i<Number(listSize); i++){
    	 tag[i] = like_on[i] == 1 ? '★' : '☆';
    	/* alert("tag[i]:"+tag[i]); */

     
     }

     var s='${pageContext.request.contextPath}';
     for(var i=Number(reallastbno); i<Number(listSize); i++){
    	 filetag[i]= file[i]!=0? file[i]:"";
   
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
            $('#table_id').append("<div class='w3-container w3-card w3-white w3-round w3-margin'><br><p><img src='"+u+"/"+mem_photo[i]+"' style='width:auto; height:auto; boarder-radius:50%;' >"+
			
			"<a href='#' onclick="+"'memNum(\""+mem_num[i] +"\")'>"+mem_nickname[i]+"</a></p>"+

			"<br><hr class='w3-clear'><span id='searchHash'>"+ 

			content[i]+ "<a href='#' onclick="+"'boardNum(\""+board_num[i]+"\")'><자세히보기></a>"+

			"</span> <br> <br> <br><div class='w3-row-padding' style='margin: 0 -16px'>"+"<img src='"+s+"/"+filetag[i]+"'>"+

			"</div><button type='button' style='background-color: #000; margin-bottom: 16px; border: none; display: inline-block; padding: 8px 16px; vertical-align: middle; overflow: hidden; text-decoration: none; color: inherit; background-color: inherit; text-align: center; cursor: pointer; white-space: nowrap; class='likeScroll' data-ch="+lastbno[i]+">"+liketag[i]+"</button>"+

			"</div>");

           /*  alert("<img src='./upload/"+mem_photo[i]+"' style='width:auto; height:auto; boarder-radius:50%;' >"); */
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
