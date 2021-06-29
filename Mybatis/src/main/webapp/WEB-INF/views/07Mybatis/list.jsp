<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.css" />
<script src="../resources/jquery/jquery-3.6.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- <div class="container"> -->

<!-- 	<h2>회원제 방명록 게시판</h2> -->
	
<!-- <div class="media border p-3"> -->
<!--     <img src="../resources/img_avatar3.png" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;"> -->
<!--     <div class="media-body"> -->
<!-- 	    <h4>John Doe <small><i>Posted on February 19, 2016</i></small></h4> -->
<!-- 	    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>       -->
<!--     </div> -->
<!-- </div> -->

<div class="container">
	<h3 class="text-center">방명록(한줄게시판)</h3>
		
	<!-- 방명록 반복 부분 s -->
	<c:forEach items="${lists }" var="row">		
		<div class="border mt-2 mb-2">
			<div class="media">
				<div class="media-left mr-3">
					<img src="../images/img_avatar3.png" class="media-object" style="width:60px">
				</div>
				<div class="media-body">
					<h4 class="media-heading">작성자:${row.name }(${row.id })</h4>
					<p>${row.contents }</p>
				</div>	  
				<!--  수정,삭제버튼 -->
				<div class="media-right">
					
				</div>
			</div>
		</div>
	</c:forEach>
	
	<!-- 방명록 반복 부분 e -->
	<ul class="pagination justify-content-center">
		${pagingImg }
	</ul>
</div>
	
</body>
</html>