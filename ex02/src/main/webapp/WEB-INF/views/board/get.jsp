<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">스프링 게시판</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">게시글 읽기</div>
				<!-- /.panel-heading -->
				<div class="panel-body">

					<div class="form-group">
						<label>글번호</label> <input class="form-control" type="text" readonly="readonly"
							width="600px" name="bno" value="${board.bno }">
					</div>
					
					<div class="form-group">
						<label>제목</label> <input class="form-control" type="text" readonly="readonly"
							width="600px" name="title" value="${board.title}">
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" type="text" readonly="readonly"
							width="600px" name="writer" value="${board.writer}">
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="15" name="content" readonly="readonly">${board.content}</textarea>
					</div>

					<button data-oper='modify' type="submit" class="btn btn-default" onclick="location.href='/board/modify?bno=${board.bno}'">수정</button>
					<button data-oper='list' type="reset" class="btn btn-info" onclick="location.href='/board/list'">목록</button>



					<!-- Modal 추가 -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">Modal 제목</h4>
								</div>
								<div class="modal-body">처리가 완료되었습니다.</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">저장</button>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
</div>

<!-- script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';
		checkModal(result);
		function checkModal(result) {
			if(result == '') {
				return;
			}
			if(parseInt(result) > 0) {
				$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다."); 
			}
			$("#myModal").modal("show");
		}
		$("#regBtn").on("click", function() {
			self.location = "/board/register";
		})
	});
</script-->

<!-- 기본 모달창 
<script>
	$(document).ready(function() {
		var result = "${result}";
		alert(result);
	})
</script>
<!-- 기본 모달창 -->


<%@include file="../includes/footer.jsp"%>

</body>

</html>
