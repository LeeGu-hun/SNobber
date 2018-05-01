<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<title>My Follow folder List</title>
<meta meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcescss/font-awesome.min.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>
<body class="w3-theme-l5">



<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">

    </div>
    
    <!-- Middle Column -->
  
    <div class="w3-col m7" id="followTable" style="width: 70%; margin-left: 250px; float:left">

       	<c:forEach var="d" items="${folderfollowList }" varStatus="followIn">
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <h4>${d.folder_creater }</h4><br>
        <hr class="w3-clear">
        <p class="followScroll" data-follow=${followIn.index }><a href="#" onclick="folder('${d.folder_num}')">${d.folder_title }</a></p>
     
      </div>
      
       </c:forEach>
       
       <c:if test="${empty list }">
	등록된 글이 없습니다.
	</c:if>
       
<div id="button_id">
					<button onclick="followfolder()" id="followbutton">더보기</button>
				</div>
    </div>
   
    
    
  <!-- End Grid -->
  </div>
  
  
<!-- End Page Container -->
</div>
<br>

<!-- Footer -->


<script>


function folder(num) {
	$(location).attr('href', 'mypageFolder?num=' + num + '');
}




</script><script type="text/javascript">
function followfolder(){	  
	 $("#followbutton").hide();


	    var follow_rowsCount=$(".followScroll:last").attr("data-follow");
	    var follow_rowsCountTest=Number(follow_rowsCount)+Number(2); 
	  	var follow_table = document.getElementById("followTable");
					//var follow_rowsCount = follow_table.rows.length; 
					//var lastbno = $(".likeScroll:last").attr("data-ch");
				
				//			follow_rowsCount++;
						

							$.ajax({
								type : "POST",
								dataType : "json",
								url : "./folderScrollFollow",
									data :  "follow_rowsCount=" + follow_rowsCount+"&follow_rowsCountTest="+follow_rowsCountTest, 
								success : followsc

							   });
					   
					 
					  } 

		function followsc(data) {
			alert("왔나??");
 	var followFlist=data.followFlist;
			var allfollowFlist=data.allfollowFlist;
			var follow_rowsCount=data.follow_rowsCount;//lastbno
			
			
		var folder_creater = Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
			
		var folder_num = Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
			
		var folder_title = Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
		
		var title_tag= Array.apply(null, new Array(10)).map(Number.prototype.valueOf,0);
		
		
		for (var i=Number(follow_rowsCount); i<Number(followFlist); i++)
	    {
			folder_creater[i]=eval("data.scrollAddFolder_creator"+i);
			folder_title[i]=eval("data.scrollAddFolder_title"+i);
			folder_num[i]=eval("data.scrollAddFolder_folder_num"+i);
			title_tag[i]= "<a href='#' onclick="+"'folder(\""+folder_num[i]+"\")'>" + folder_title[i]  + "</a>";
		
			console.log("folder_creater[i]:"+folder_creater[i]);
			console.log("folder_title[i] :"+folder_title[i]);
	    }
		
		
	
		
		
		if (followFlist< allfollowFlist) {
			for (var i=Number(follow_rowsCount); i<Number(followFlist); i++)
		    {
			$('#followTable').append("<div class='w3-container w3-card w3-white w3-round w3-margin'><br>"+

					"<h4><a href='#' onclick="+"'memNum(\""+ folder_creater[i] +"\")'>"+folder_creater[i]+"</a></h4><br>"+

					"<p class='followScroll' data-follow="+follow_rowsCount[i]+">"+title_tag[i] +"</p>"+

					"</div>");}}
		

		
		
		
		
		
		

		}
	</script>
</body>
</html> 
