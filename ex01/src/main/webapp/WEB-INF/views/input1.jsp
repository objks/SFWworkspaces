<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h3>기본 자료형으로 받기</h3>
<form action="/add" method="get">
	숫자1 : <input type="text" name="num1"><br>
	숫자2 : <input type="text" name="num2"><br>
	<input type="submit" value="더해라"><br>	
</form>

<h3>객체로 받기</h3>
<form action="/add1" method="get">
	숫자1 : <input type="text" name="num1" value="5"><br>
	숫자2 : <input type="text" name="num2" value="3"><br>
	<input type="submit" value="더해라"><br>	
</form>

</body>
</html>