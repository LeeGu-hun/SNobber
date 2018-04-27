//$(document).ready(function() {			
//	$('#folder_add_window').hide();
//	$('#folderAdd').click(function() {
//		$('#folder_add_window').toggle();
//	});
//	$('#folder_title_text').keyup(function() {
//		var title = $('#folder_title_text').val();		
//		if(title=="") {
//			$('#folder_create_btn').attr('disabled', true);
//		} else {
//			$('#folder_create_btn').attr('disabled', false);
//		}
//	});
//});
//
//$(function() {
//	$('#folder_cancel_btn').on('click', function() {
//		$('#folder_add_window').hide();
//	});
//	
//	$('#folder_create_btn').on('click', function() {
//		var secret = $('#folder_secret').val();
//		var title = $('#folder_title_text').val();	
//		var id = $(this).attr('id');
//		
//		$.ajax({ 
//			type : "POST",
//			url : "./mypageFolderCreate",
//			data : {id : id, title : title, secret : secret},
//			success : mypageFF
//		});		
//	})		
//	function mypageFF(msg) {
//		$(location).attr('href', './main');
//	}
//});
//
//function mypageSNS(msg) {
//	$('#mypageSNS_span').html(msg);
//}
