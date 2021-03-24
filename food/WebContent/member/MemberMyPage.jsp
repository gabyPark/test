<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/mypage.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = (String) session.getAttribute("f_mem_id");
	%>
	
	<jsp:include page="top.jsp"/>	
	
	<div class="div01"><label class="div01_lab">마이페이지</label></div>
	<div class="div02">
		<label class="div02_lab01">레시피 : 10</label><label class="div02_lab02">좋아요 : 6</label>
	</div>
	<div class="div03">
		<table class="tab01">
			<tr>
				<td><label>레시피관리</label></td>
				<td><label>댓글관리</label></td>
			</tr>
			<tr>
				<td><label>찜목록</label></td>
				<td><label onclick="location.href='./MemberUpdate.me'">회원정보수정</label></td>
			</tr>
			<tr>
				<td><label>관리자와대화</label></td>
				<td><label>장바구니</label></td>
			</tr>			
			<% // 관리자용
				
			%>
			<tr>
				<td><label>회원목록</label></td>
				<td><label>관리자기능</label></td>
			</tr>
			<% // 관리자용
				
			%>
		</table>
	</div>
</body>
</html>