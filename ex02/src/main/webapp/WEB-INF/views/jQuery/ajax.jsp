<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	var timerID;
	$(document).ready(function() {
		$('#execute').on('click', function(e) {
			e.preventDefault();
			updateData();
		});
		$('#stop').on('click', function(e) {
			e.preventDefault();
			clearTimeout(timerID); // 타이머 중지
			$('#showtime').html('');
		});
	});

	function updateData() {
		$.ajax({
			url : "http://localhost:8090/GetServer",
			type : "get",
			cache : false,
			success : function(data) { // getserver로 요청한 echo 결과값이 data임
				$('#showtime').html(data);
			}
		})
		timerID = setTimeout("updateData()", 2000);
	}
</script>
<title>Insert title here</title>
</head>

<body>
	<p>
		time : <span id="showtime"></span>
	</p>
	<input type="button" id="execute" value="실행" />
	<input type="button" id="stop" value="정지" />
</body>
</html>