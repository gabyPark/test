<%@page import="com.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>레시피 맛집</title>
<link href="./css/memberUpdateForm.css" rel="stylesheet">
<script type="text/javascript">
function btn_click(str) {
	if(str == "modify") {
		fr01.action = "./MemberUpdateAction.me"
	} else if(str == "delete") {
		fr01.action = "./MemberDeleteAction.me"
	}
}

</script>
</head>
<body>
	<jsp:include page="top.jsp"/>
	<%
		String id = (String)session.getAttribute("f_mem_id");
		
		if(id == null) {
			response.sendRedirect("./MemberLogin.me");
		}	
	
		MemberBean mb = (MemberBean) request.getAttribute("mb");
	%>
	
	<div class="div01">
		<form name="fr01" method="post">
			<table class="tab01">
				<tr>
					<td>아아디</td>
					<td><input type="text" name="id" value="<%=mb.getF_mem_id() %>" readonly="readonly"></td>						
				</tr>
				<tr>
					<td>비밀번호</td>								
					<td><input type="password" name="pw" placeholder="최소 4자 최대 10자 가능."></td>
				</tr>
				<tr>
					<td>비밀번호확인</td>
					<td><input type="password" name="pw2"></td>								
				</tr>
				<tr>
					<td>이름</td>								
					<td><input type="text" name="name" value="<%=mb.getF_mem_name() %>"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="phone" value="<%=mb.getF_mem_phone() %>"></td>				
				</tr>
				<tr>
					<td>우편번호</td>								
					<td><input type="text" name="addr" value="<%=mb.getF_mem_addr() %>"></td>
				</tr>
				<tr>
					<td>주소</td>								
					<td><input type="text" name="addr1" value="<%=mb.getF_mem_addr1() %>"></td>
				</tr>
				<tr>
					<td>나머지</td>								
					<td><input type="text" name="addr2" value="<%=mb.getF_mem_addr2() %>"></td>
				</tr>
				<tr>
					<td>이메일</td>								
					<td><input type="text" name="email" value="<%=mb.getF_mem_email() %>"></td>
				</tr>
				<tr>
					<td>닉네임</td>								
					<td><input type="text" name="nick" value="<%=mb.getF_mem_nick() %>"></td>
				</tr>
			</table>
			<table>
				<tr>
					<td><input class="inp01" type="submit" value="수정" onclick="btn_click('modify')"></td>
					<td><input class="inp01" type="submit" value="회원탈퇴" onclick="btn_click('delete')"></td>
					<td><input class="inp01" type="button" value="취소" onclick="location.href='./MemberMyPageAction.me'"></td>
				</tr>
			</table>
		</form>
	</div>	
</body>
</html>