<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/login.bo" method="get">
ID : <input type="text" value="홍길동" name="id"><br>
PW : <input type="password" value="1234" name="pw"><br>
<input type="submit" value="로그인">
</form>
<br>
<form action="/login.do" method="get">
ID : <input type="text" value="홍길동" name="id"><br>
PW : <input type="password" value="1234" name="pw"><br>
<input type="submit" value="로그인">
</form>
</body>
</html>