

<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">고객 상세정보</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">고객 정보보기</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

          <div class="form-group">
          <label>ID</label> <input class="form-control" name='ID'
            value='<c:out value="${admin.ID }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>고객 이름</label> <input class="form-control" name='username'
            value='<c:out value="${admin.username }"/>' readonly="readonly">
        </div>
        
        <div class="form-group">
          <label>이메일</label> <input class="form-control" name='email'
            value='<c:out value="${admin.email }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>센서별 그래프</label>
          <textarea class="form-control" rows="3" name='serialnum'
            readonly="readonly"><c:out value="${admin.serialnum}" /></textarea>
        </div>        

<%-- 		<button data-oper='modify' class="btn btn-default">
        <a href="/admin/modify?id=<c:out value="${admin.ID}"/>">Modify</a></button>
        <button data-oper='list' class="btn btn-info">
        <a href="/admin/list">List</a></button> --%>


<!-- button data-oper='modify' class="btn btn-default">수정</button-->
<button type="submit" data-oper='remove' class="btn btn-danger">고객 삭제</button>
<button data-oper='list' class="btn btn-success">목록</button>

<%-- <form id='operForm' action="/boad/modify" method="get">
  <input type='hidden' id='ID' name='ID' value='<c:out value="${admin.ID}"/>'>
</form> --%>


<form id='operForm' action="/admin/modify" method="get">
  <input type='hidden' id='ID' name='ID' value='<c:out value="${admin.ID}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
</form>
      </div>
      <!--  end panel-body -->
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->


<div class='row'>
	<div class="col-lg-12">
		<!-- /.panel -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> 고객 메모사항
				<button id='addReplyBtn' class='btn btn-success btn-xs pull-right'>메모	등록</button>
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<ul class="chat"></ul>
				<!-- ./ end ul -->
			</div>
			<!-- /.panel .chat-panel -->

			<div class="panel-footer"></div>
		</div>
	</div>
	<!-- ./ end row -->
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">메모 등록</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>메모 내용</label> <input class="form-control" name='reply' value='New Reply!!!!'>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name='replyer' value='replyer'>
				</div>
				<div class="form-group">
					<label>작성일</label> <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
				</div>
				
			</div>
			<div class="modal-footer">
				<!-- button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button-->
				<button id='modalRegisterBtn' type="button" class="btn btn-success">등록</button>
				<button id='modalCloseBtn' type="button" class="btn btn-default">닫기</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->



<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
	$(document).ready(function() {
		var bnoValue = '<c:out value="${admin.ID}"/>';
		var replyUL = $(".chat");
		showList(1);

		function showList(page) {

			console.log("show list " + page);

			replyService.getList( {
				id : bnoValue,				// 이거
				page : page || 1
			},
			function(replyCnt, list) {

				console.log("replyCnt: "
						+ replyCnt);
				console.log("list: " + list);
				console.log(list);

				if (page == -1) {
					pageNum = Math
							.ceil(replyCnt / 10.0);
					showList(pageNum);
					return;
				}

				var str = "";

				if (list == null
						|| list.length == 0) {
					return;
				}

				for (var i = 0, len = list.length || 0; i < len; i++) {
					str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					str += "  <div><div class='header'><strong class='primary-font'>["
							+ list[i].rno
							+ "] "
							+ list[i].replyer
							+ "</strong>";
					str += "    <small class='pull-right text-muted'>"
							+ replyService
									.displayTime(list[i].replyDate)
							+ "</small></div>";
					str += "    <p>"
							+ list[i].reply
							+ "</p></div></li>";
				}

				replyUL.html(str);
				showReplyPage(replyCnt);

			});//end function

			}//end showList

			var pageNum = 1;
			var replyPageFooter = $(".panel-footer");

			function showReplyPage(replyCnt) {

				var endNum = Math.ceil(pageNum / 10.0) * 10;
				var startNum = endNum - 9;
				var prev = startNum != 1;
				var next = false;
				if (endNum * 10 >= replyCnt) {
					endNum = Math.ceil(replyCnt / 10.0);
				}

				if (endNum * 10 < replyCnt) {
					next = true;
				}

				var str = "<ul class='pagination pull-right'>";

				if (prev) {
					str += "<li class='page-item'><a class='page-link' href='"
							+ (startNum - 1)
							+ "'>Previous</a></li>";
				}

				for (var i = startNum; i <= endNum; i++) {
					var active = pageNum == i ? "active" : "";
					str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"
							+ i + "</a></li>";
				}

				if (next) {
					str += "<li class='page-item'><a class='page-link' href='"
							+ (endNum + 1) + "'>Next</a></li>";
				}

				str += "</ul></div>";
				console.log(str);
				replyPageFooter.html(str);
			}

			replyPageFooter.on("click", "li a", function(e) {
				e.preventDefault();
				console.log("page click");

				var targetPageNum = $(this).attr("href");
				console.log("targetPageNum: " + targetPageNum);
				pageNum = targetPageNum;
				showList(pageNum);
			});

			/*     function showList(page){      
			 replyService.getList({id:bnoValue,page: page|| 1 }, function(list) {        
			 var str="";
			 if(list == null || list.length == 0){        
			 replyUL.html("");        
			 return;
			 }
			 for (var i = 0, len = list.length || 0; i < len; i++) {
			 str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
			 str +="  <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>"; 
			 str +="    <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
			 str +="    <p>"+list[i].reply+"</p></div></li>";
			 }

			 replyUL.html(str);
			 });//end function      
			 }//end showList */

			var modal = $(".modal");
			var modalInputReply = modal.find("input[name='reply']");
			var modalInputReplyer = modal
					.find("input[name='replyer']");
			var modalInputReplyDate = modal
					.find("input[name='replyDate']");

			var modalModBtn = $("#modalModBtn");
			var modalRemoveBtn = $("#modalRemoveBtn");
			var modalRegisterBtn = $("#modalRegisterBtn");

			$("#modalCloseBtn").on("click", function(e) {
				modal.modal('hide');
			});

			$("#addReplyBtn").on("click", function(e) {
				modal.find("input").val("");
				modalInputReplyDate.closest("div").hide();
				modal.find("button[id !='modalCloseBtn']").hide();
				modalRegisterBtn.show();
				$(".modal").modal("show");
			});

			modalRegisterBtn.on("click", function(e) {
				var reply = {
					reply : modalInputReply.val(),
					replyer : modalInputReplyer.val(),
					id : bnoValue
				};
				replyService.add(reply, function(result) {
					alert(result);
					modal.find("input").val("");
					modal.modal("hide");
					//showList(1);
					showList(-1);
				});
			});

			//댓글 조회 클릭 이벤트 처리 
			$(".chat").on("click", "li", function(e) {
				var rno = $(this).data("rno");
				console.log("나와라 댓글번호" + rno);
				replyService.get(rno, function(reply) {
					modalInputReply.val(reply.reply);
					modalInputReplyer.val(reply.replyer).attr("readonly", "readonly");
					modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
					modal.data("rno", reply.rno);

					modal.find("button[id !='modalCloseBtn']").hide();
					modalModBtn.show();
					modalRemoveBtn.show();

					$(".modal").modal("show");
					});
				});

			/*     modalModBtn.on("click", function(e){      
			 var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};      
			 replyService.update(reply, function(result){            
			 alert(result);
			 modal.modal("hide");
			 showList(1);        
			 });			
			 });

			 modalRemoveBtn.on("click", function (e){    	  
			 var rno = modal.data("rno");  	  
			 replyService.remove(rno, function(result){  	        
			 alert(result);
			 modal.modal("hide");
			 showList(1);  	      
			 });  	  
			 }); */

			modalModBtn.on("click", function(e) {
				var reply = {
					rno : modal.data("rno"),
					reply : modalInputReply.val()
				};

				replyService.update(reply, function(result) {
					alert(result);
					modal.modal("hide");
					showList(pageNum);
				});
			});

			modalRemoveBtn.on("click", function(e) {
				var rno = modal.data("rno");
				replyService.remove(rno, function(result) {
					alert(result);
					modal.modal("show");
					showList(pageNum);
				});
			});
		});
</script>



<!-- <script>
 console.log("===============");
console.log("JS TEST");

var bnoValue = '<c:out value="${board.ID}"/>'; */

//for replyService add test
/* replyService.add(
    {reply:"JS Test", replyer:"tester", id:bnoValue}
    ,
    function(result){ 
      alert("RESULT: " + result);
    }
); */


//reply List Test
/* replyService.getList({id:bnoValue, page:1}, function(list){
	  for(var i = 0,  len = list.length||0; i < len; i++ ){
	    console.log(list[i]);
	  }
});
 */

 
/*  //17번 댓글 삭제 테스트 
 replyService.remove(17, function(count) {
   console.log(count);
   if (count === "success") {
     alert("REMOVED");
   }
 }, function(err) {
   alert('ERROR...');
 });
 */
 

//12번 댓글 수정 
 replyService.update({
  rno : 12,
  id : bnoValue,
  reply : "Modified Reply...."
}, function(result) {
  alert("수정 완료...");
});  
</script> -->  

<script type="text/javascript">
$(document).ready(function() {
	var operForm = $("#operForm");   
	  $("button[data-oper='remove']").on("click", function(e){    
	    operForm.attr("action","/admin/remove").submit();    
	  });  
	  
  var operForm = $("#operForm");   
  $("button[data-oper='modify']").on("click", function(e){    
    operForm.attr("action","/admin/modify").submit();    
  });
  
  var operForm = $("#operForm");   
  $("button[data-oper='remove']").on("click", function(e){    
    operForm.attr("action","/admin/remove").submit();    
  });  
    
  $("button[data-oper='list']").on("click", function(e){    
    operForm.find("#id").remove();
    operForm.attr("action","/admin/list")
    operForm.submit();
    
  });  
});
</script>


<%@include file="../includes/footer.jsp"%>
