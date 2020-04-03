<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/test/test25" method="post">
<label><input type="checkbox" name="menu" value="1">한식</label>
<label><input type="checkbox" name="menu" value="2">중식</label>
<label><input type="checkbox" name="menu" value="3">일식</label>
<label><input type="checkbox" name="menu" value="4">양식
<input type="checkbox" name="menu" value="default" checked hidden></label>
<input type="submit" value="이거다">
</form>
</body>
</html>