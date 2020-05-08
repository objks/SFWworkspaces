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
				<div class="panel-heading">
					Board List Tables <button id="regBtn" style="margin-top:-5px" type="button" class="btn btn-sm btn-info pull-right">새글 등록</button>
				</div>
				<!-- /.panel-heading -->
					<form action="/board/modify" method="post">
				<div class="panel-body">

					<div class="form-group">
						<label>글번호</label> <input class="form-control" type="text" readonly="readonly"
							width="600px" name="bno" value="${board.bno}">
					</div>
					
					<div class="form-group">
						<label>제목</label> <input class="form-control" type="text" 
							width="600px" name="title" value="${board.title}">
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" type="text" readonly="readonly"
							width="600px" name="writer" value="${board.writer}">
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="15" name="content" >${board.content}</textarea>
					</div>
										
					<button type="submit" class="btn btn-default" data-oper="modify">수정</button>
					<button type="submit" class="btn btn-danger" data-oper="remove">삭제</button>
					<button type="submit" class="btn btn-info" data-oper="list">목록</button>
					</form>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form");
		
		$("button").on("click", function(e) {
			e.preventDefault();
			var operation=$(this).data("oper");
			console.log(operation);
			
			if(operation=='remove'){
				formObj.attr("action", "/board/remove");
			} else {
				self.location="/board/list";
				return;
			}
			formObj.submit();
		})
	});
</script>

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
