<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<script src="https://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>



<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">스프링 게시판</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>

	<div id="canvas-holder" style="width: 40%">
		<canvas id="chart-area"></canvas>
	</div>
	<button id="randomizeData">Randomize Data</button>
	<button id="addDataset">Add Dataset</button>
	<button id="removeDataset">Remove Dataset</button>
	<script>
		var randomScalingFactor = function() {
			return Math.round(Math.random() * 100);
		};

		var config = {
			type : 'pie',
			data : {
				datasets : [ {
					data : [ randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), ],
					backgroundColor : [ window.chartColors.red,
							window.chartColors.orange,
							window.chartColors.yellow,
							window.chartColors.green, window.chartColors.blue, ],
					label : 'Dataset 1'
				} ],
				labels : [ 'Red', 'Orange', 'Yellow', 'Green', 'Blue' ]
			},
			options : {
				responsive : true
			}
		};

		window.onload = function() {
			var ctx = document.getElementById('chart-area').getContext('2d');
			window.myPie = new Chart(ctx, config);
		};

		document.getElementById('randomizeData').addEventListener('click',
				function() {
					config.data.datasets.forEach(function(dataset) {
						dataset.data = dataset.data.map(function() {
							return randomScalingFactor();
						});
					});

					window.myPie.update();
				});

		var colorNames = Object.keys(window.chartColors);
		document
				.getElementById('addDataset')
				.addEventListener(
						'click',
						function() {
							var newDataset = {
								backgroundColor : [],
								data : [],
								label : 'New dataset '
										+ config.data.datasets.length,
							};

							for (var index = 0; index < config.data.labels.length; ++index) {
								newDataset.data.push(randomScalingFactor());

								var colorName = colorNames[index
										% colorNames.length];
								var newColor = window.chartColors[colorName];
								newDataset.backgroundColor.push(newColor);
							}

							config.data.datasets.push(newDataset);
							window.myPie.update();
						});

		document.getElementById('removeDataset').addEventListener('click',
				function() {
					config.data.datasets.splice(0, 1);
					window.myPie.update();
				});
	</script>


	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var result = '<c:out value="${result}"/>';
							checkModal(result);
							function checkModal(result) {
								if (result == '') {
									return;
								}
								if (parseInt(result) > 0) {
									$(".modal-body").html(
											"게시글 " + parseInt(result)
													+ " 번이 등록되었습니다.");
								}
								$("#myModal").modal("show");
							}
							$("#regBtn").on("click", function() {
								self.location = "/board/register";
							})
						});
	</script>
	<br>
	<br>
	<br>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					Board List Tables
					<button id="regBtn" style="margin-top: -5px" type="button"
						class="btn btn-sm btn-info pull-right">새글 등록</button>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%"
						class="table table-striped table-bordered table-hover">

						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>수정일</th>
							</tr>
						</thead>
						<c:forEach items="${list}" var="aaa">
							<tr>
								<td><a href="/board/get?bno=${aaa.bno}">${aaa.bno}</a></td>
								<td><a href="/board/get?bno=${aaa.bno}">${aaa.title}</td>
								<td>${aaa.writer}</td>
								<td><fmt:formatDate pattern="yyy-MM-dd"
										value="${aaa.regdate}" /></td>
								<td><fmt:formatDate pattern="yyy-MM-dd"
										value="${aaa.updateDate}" /></td>
							</tr>
						</c:forEach>
					</table>

					<div class='pull-right'>
						<ul class="pagination">

							<c:if test="${pageMaker.prev }">
								<li class="paginame_button previous"><a href="/board/list?pageNum=${pageMaker.startPage-1}"> prev</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }">
								<li class="paginame_button"><a href="/board/list?pageNum=${num}"> ${num}
										&nbsp;</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next }">
								<li class="paginame_button next"><a href="/board/list?pageNum=${pageMaker.endPage+1}"> next</a></li>
							</c:if>
						</ul>
					</div>

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
										data-dismiss="modal">확인</button>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
</div>




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
