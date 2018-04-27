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
<title>Insert title here</title>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
	

<script>
	$(document).ready(function() {
		$(document).scroll(function() {
					console.log("document.height = " + $(document).height());
					console.log("window.height = " + $(window).height());
					console.log("window.scrollTop = " + $(window).scrollTop());
					console.log("window.scrollTop+window.height = " + ($(window).scrollTop()	+ $(window).height()));
					var offset = $("html body").offset();
					console.log("offset :"+offset);
					console.log(($(window).scrollTop() + $(window).height()) - 2000);
	
					
					var issue_maxHeight = $(document).height();
					var issue_currentScroll = $(window).scrollTop() + $(window).height();
					
					var issue_rowsCount = $(".hot_scroll:last").attr("data-issueIndex");
	
					if (issue_maxHeight  < issue_currentScroll) {
						issue_rowsCount++;
						
						$.ajax({
							type : "POST",
							dataType : "json",
							url : "./issue_folderScroll",
							data : "issue_rowsCount="
									+ issue_rowsCount,
							success : issueF
						});
					}
				});
	});

	function folder(num) {
		$(location).attr('href', 'mypageFolder?num=' + num + '');
	}
	function yourPage(num) {
		$(location).attr('href', 'mypagePro?num=' + num + '');
	}
</script>

</head>

<body>

	<h1>TODAY's ISSUE</h1>

	<c:forEach items="${fList}" var="fl" varStatus="sts">
		<div id="issue_folder">
			<div class="w3-container w3-flat-clouds">
				<h2>TODAY's RAMK</h2> <h1>${fl.rownum }</h1>
				<p>
					<a href="#" onclick="yourPage('${fl.mem_num}')">
						${fl.mem_nickname } </a>
				</p>
				<p class="hot_scroll" data-issueIndex="${sts.index }">
					<a href="#" onclick="folder('${fl.folder_num}')">
						${fl.folder_title } </a>
				</p>
			</div>
			<br>
		</div>

	</c:forEach>

	<script>

		function issueF(data) {
	
			var issue_title = data.issue_scrollAddTitle;
			var issue_rownum = data.issue_scrollAddRownum;
			var issue_mem_nickname = data.issue_scrollAddnickname;
			var issue_allList = data.issue_allListsize;
			var issue_fList = data.issue_fListsize;
			var issue_rowsCount = data.issue_rowsCount;
			var issue_mem_num = data.issue_mem_num;
			var issue_foldernum = data.issue_scrollAddfoldernum;
			//alert(issue_rowsCount);
			/* "<div class='w3-container w3-flat-emerald'><h2>"+issue_rownum+"</h2><p>"+nickname_tag+"</p>"			
			+"<p class='hot_scroll' data-issueIndex="+issue_rowsCount +"><a href='#' onclick="+"folder(\""+issue_foldernum+"\")'>"+issue_title+"</a>"
			+"</p></div>"
			 */

			nickname_tag = "<a href='#' onclick=" + "'yourPage(\""
					+ issue_mem_num + "\")'>" + issue_mem_nickname + "</a>";
			if (issue_fList < issue_allList) {

				$('#issue_folder').append(
								"<div class='w3-container w3-flat-emerald'><h2>"
										+ issue_rownum
										+ "</h2><p>"
										+ nickname_tag
										+ "</p>"
										+ "<p class='hot_scroll' data-issueIndex="+issue_rowsCount +"><a href='#' onclick="
										+ "folder(\"" + issue_foldernum
										+ "\")'>" + issue_title + "</a>"
										+ "</p></div>");

			}
		}
	</script>




</body>
</html>