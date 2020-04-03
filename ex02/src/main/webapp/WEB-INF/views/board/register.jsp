<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">게시글 작성</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">게시글 등록</div>

				<!-- /.panel-heading -->
				<div class="panel-body">
					<form action="/board/register" method="post">
						<div class="form-group">
							<label>제목</label> <input class="form-control" type="text" width="600px" name="title">
						</div>

						<div class="form-group">
							<label>작성자</label> <input class="form-control" type="text" width="600px" name="writer">
						</div>

						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="15" name="content"></textarea>
						</div>

						<button type="submit" class="btn btn-default">Submit</button>
						<button type="reset" class="btn btn-default">Reset</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

</div>

<%@include file="../includes/footer.jsp"%>

</body>

</html>
