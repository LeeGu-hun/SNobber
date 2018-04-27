function contentsView(v) {

		if (v.value == 'timeline') {
			$('#followFolderList').css('display', 'none');
			$('#followList').css('display', 'block');
			return false;

		}

		if (v.value == 'foldertimeline') {
			$('#followFolderList').css('display', 'block');//보여줌
			$('#followList').css('display', 'none');
			return false;

		}

	}


function check(board_num, like_on, index) {

	$.ajax({
		type : "POST",
		dataType : "json",
		url : "./boardLikeTest",
		data : "board_Num=" + board_num + "&like_on=" + like_on + "&index="
				+ index,
		success : test,
		error : mesa

	});

}

function test(data) {
	var num = data.board_num;
	var like = data.like_onNew;

	var index = data.index;

	var atag1 = "<a href='#' onclick=" + "'check(\"" + num + "\",\"" + like
			+ "\",\"" + index + "\")'> ★</a>";
	var atag2 = "<a href='#' onclick=" + "'check(\"" + num + "\",\"" + like
			+ "\",\"" + index + "\")'> ☆</a>";

	btnLikes = document.querySelectorAll('#btnLike');

	for (var i = 0; i < btnLikes.length; i++) {
		var ls = btnLikes[i];

		if (i == index) {
			if (data.test == 1) {
				ls.innerHTML = atag2;
			} else if (data.test == 0 || data.test == 2) {
				ls.innerHTML = atag1;
			}
		}
	}

}

function mesa(request, status, error) {
	alert("code:" + request.status + "\n" + "message:"
			+ request.responseText + "\n" + "error:" + error);
}





/*추천 폴더 리스트 라이크 js*/



function like(folder_num, f_like_on, f_index) {

	$.ajax({
		type : "POST",
		dataType : "json",
		url : "./folderLike",
		data : "folder_num=" + folder_num + "&f_like_on=" + f_like_on
				+ "&f_index=" + f_index,
		success : folderLikeIn

	});

}

function folderLikeIn(data) {
	var f_num = data.folder_num;
	var f_like = data.like_onNewF;
	var f_index = data.f_index;

	var f_atag1 = "<a href='#' onclick=" + "'like(\"" + f_num + "\",\""
			+ f_like + "\",\"" + f_index + "\")'> ★</a>";
	var f_atag2 = "<a href='#' onclick=" + "'like(\"" + f_num + "\",\""
			+ f_like + "\",\"" + f_index + "\")'> ☆</a>";

	folderLike = document.querySelectorAll('#folderLike');

	for (var i = 0; i < folderLike.length; i++) {
		var f = folderLike[i];

		if (i == f_index) {
			if (data.folderLike == 1) {
				f.innerHTML = f_atag2;
			} else if (data.folderLike == 0 || data.folderLike == 2) {
				f.innerHTML = f_atag1;
			}
		}
	}

}


