<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FOLLOWFOLDER</title>
</head>



<body>
	<h1>MY FOLLOW FOLDER LIST</h1>
	<table border="1"
		style="width: 80%; margin-left: auto; margin-right: auto; border-collapse: collapse;" id="followTable">
		<tr>
			<td>폴더 만든 사람</td>
			<td>폴더 이름</td>
			<td>여기다가 폴더 팔로우 버튼 넣으면 좋을거같음</td>
		</tr>
		<c:forEach var="d" items="${folderfollowList }">
			<tr>
				<td>${d.folder_creater }</td>
				<td><a href="#">${d.folder_title }</a></td>
				<td>test</td>
			</tr>

		</c:forEach>

	</table>




	<script>
		$(document).ready(
				function() {
					var follow_table = document.getElementById("followTable");
					var follow_rowsCount = follow_table.rows.length;
					//var lastbno = $(".likeScroll:last").attr("data-ch");
					var follow_win = $(window);

					follow_win.scroll(function() {

						if ($(document).height() - follow_win.height() == follow_win
								.scrollTop()) {
							$('#loading').show();
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
		
			var title_tag = "<a href='#'>" + folder_title  + "</a>";
		if(followFlist<allfollowFlist){
				$('#followTable').append(
						'<tr><td>' + folder_creater + '</td><td>' + title_tag 
								+ '</td><td>' + 'test' + '</td></tr>');

		}

		}
	</script>











</body>


</html>

