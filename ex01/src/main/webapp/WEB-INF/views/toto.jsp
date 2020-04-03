<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
토토사이트

경기결과 예상<br>
축구경기 한국 : 일본<br>
(배당, 한국승 2배, 일본승 4배, 무승부 3배)<br>
결과선택 : 
<form action="/toto.do" method="get">
<label><input type="radio" name="winner" value="0"> 한국승</label> 
<label><input type="radio" name="winner" value="1"> 일본승</label>
<label><input type="radio" name="winner" value="2"> 무승부</label><br>
도토리 : <input type="text" name="dotori"> <input type="submit" value="확인">
</form>
 
</body>
</html>