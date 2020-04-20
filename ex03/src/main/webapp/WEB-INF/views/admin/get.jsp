<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">고객 정보</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">고객정보 상세보기</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

          <div class="form-group">
          <label>ID</label> <input class="form-control" name='bno'
            value='<c:out value="${admin.bno }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>고객 이름</label> <input class="form-control" name='title'
            value='<c:out value="${admin.title }"/>' readonly="readonly">
        </div>
        
        <div class="form-group">
          <label>이메일</label> <input class="form-control" name='writer'
            value='<c:out value="${admin.writer }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>센서별 그래프</label>
          <textarea class="form-control" rows="3" name='content'
            readonly="readonly"><c:out value="${admin.content}" /></textarea>
        </div>        

<%-- 		<button data-oper='modify' class="btn btn-default">
        <a href="/admin/modify?bno=<c:out value="${admin.bno}"/>">Modify</a></button>
        <button data-oper='list' class="btn btn-info">
        <a href="/admin/list">List</a></button> --%>


<button data-oper='modify' class="btn btn-default">Modify</button>
<button type="submit" data-oper='remove' class="btn btn-danger">고객 탈퇴</button>
<button data-oper='list' class="btn btn-success">List</button>

<%-- <form id='operForm' action="/boad/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${admin.bno}"/>'>
</form> --%>


<form id='operForm' action="/boad/modify" method="post">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${admin.bno}"/>'>
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


<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){    
    operForm.attr("action","/admin/modify").submit();    
  });
      
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#bno").remove();
    operForm.attr("action","/admin/list")
    operForm.submit();
    
  });  
  
  // 고객 삭제
  var formObj = $("form");

  $('button').on("click", function(e){	    
    e.preventDefault(); 	    
    var operation = $(this).data("oper");	    
    console.log(operation);
    
    if(operation === 'remove'){
      formObj.attr("action", "/admin/remove");
      
    }else if(operation === 'list'){
      //move to list
      formObj.attr("action", "/admin/list").attr("method","get");
      
      var pageNumTag = $("input[name='pageNum']").clone();
      var amountTag = $("input[name='amount']").clone();
      var keywordTag = $("input[name='keyword']").clone();
      var typeTag = $("input[name='type']").clone();      
      
      formObj.empty();	      
      formObj.append(pageNumTag);
      formObj.append(amountTag);
      formObj.append(keywordTag);
      formObj.append(typeTag);	       
    }
    
    formObj.submit();
  });
});
</script>


<%@include file="../includes/footer.jsp"%>
