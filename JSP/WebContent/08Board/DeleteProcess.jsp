<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./isLogin.jsp" %>
<%
String num = request.getParameter("num"); //폼값받기
BoardDTO dto = new BoardDTO();	//dao dto각각 생성
BoardDAO dao = new BoardDAO(application);
dto = dao.selectView(num); //기존 게시물 조회 >> 작성자 본인 확인을 위한

//session 영역에 저장된 회원 인증정보 얻어옴
String session_id = session.getAttribute("USER_ID").toString();
int delResult = 0;
if(session_id.equals(dto.getid())){ //작성자 본인 확인
	dto.setnum(num); //DTO 객체에 일련번호 저장
	delResult = dao.deletePost(dto); //삭제 메소드 호출
	dao.close();
	if(delResult==1){
		JSFunction.alertLocation("삭제되었습니다.", "ListSimple.jsp", out);
	}
	else{
		JSFunction.alertBack("삭제에 실패했습니다.", out);
	}
	
}
else{
	JSFunction.alertBack("본인만 삭제 가능합니다.", out);
	return;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>