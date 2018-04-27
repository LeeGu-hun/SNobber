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
      <!-- Profile -->
     
    
      
      <!-- Accordion -->
     
   
      <!-- Interests --> 
     
      
 
    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
  
    <div class="w3-col m7" id="followTable" style="width: 70%; margin-left: 250px; float:left">

       	<c:forEach var="d" items="${folderfollowList }" varStatus="followIn">
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <h4>${d.folder_creater }</h4><br>
        <hr class="w3-clear">
        <p><a href="#" onclick="folder('${d.folder_num}')">${d.folder_title }</a></p>
     
      </div>
      
       </c:forEach>
       
       <c:if test="${empty list }">
	등록된 글이 없습니다.
	</c:if>
       
       
       
       
       
    <!-- End Middle Column -->
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






$(document).ready(function () {
	  $(document).scroll(function() {
	    var follow_maxHeight = $(document).height();
	    var follow_currentScroll = $(window).scrollTop() + $(window).height();
	    var follow_rowsCount=$(".followScroll:last").attr("data-follow");
	    /* 	var follow_table = document.getElementById("followTable");
					var follow_rowsCount = follow_table.rows.length; */
					//var lastbno = $(".likeScroll:last").attr("data-ch");
				

					  if (follow_maxHeight <= follow_currentScroll) {
							follow_rowsCount++;
						

							$.ajax({
								type : "POST",
								dataType : "json",
								url : "./folderScrollFollow",
								data : "follow_rowsCount=" + follow_rowsCount ,
								success : followsc

							   });
					    }
					  });
					});			 

		function followsc(data) {
	
		var folder_creater = data.scrollAddFolder_creator;
		var folder_title = data.scrollAddFolder_title;
		var followFlist=data.followFlist;
		var allfollowFlist=data.allfollowFlist;
		var follow_rowsCount=data.follow_rowsCount;
		var title_tag = "<a href='#'>" + folder_title  + "</a>";
		
		if (followFlist< allfollowFlist) {
			$('#followTable').append("<div class='w3-container w3-card w3-white w3-round w3-margin'>"+

					"</h4><a href='#' onclick="+"'memNum(\""+ folder_creater +"\")'>"+folder_creater+"</a>"+

					"</h4><br><hr class='w3-clear'><span id='searchHash'>"+title_tag +"</span> <br> <br> <br><div class='w3-row-padding' style='margin: 0 -16px'>"+

					"</div>");}
		

		
		
		
		
		
		
		

		}
	</script>
</body>
</html> 
