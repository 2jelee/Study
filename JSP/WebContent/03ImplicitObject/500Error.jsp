<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//실행 시 무조건 에러가 발생하는 코드이다.
int myAge = Integer.parseInt(request.getParameter("age")) + 10;
out.println("10년 후 당신의 나이는 "+myAge+"입니다.");
%>
</body>
</html>