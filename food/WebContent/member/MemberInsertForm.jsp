<%@page import="com.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>레시피 맛집</title>
<link href="./css/memberInsertForm.css" rel="stylesheet">
<script src="./jscript/insertScript.js" ></script>
</head>
<body>
	<jsp:include page="top.jsp"/>
	
	<div class="div01">
		<form action="./MemberJoinAction.me" name="userInfo" method="post" onsubmit="return checkValue()">		
			<table class="tab01">
				<tr>
					<td>아아디</td>
					<td><input type="text" name="f_mem_id"  onkeydown="inputIdChk()" placeholder="중복확인을 눌러주세요" readonly="readonly"></td>
					<td><input class="div01_inp_idChk" type="button" value="중복확인" onclick="openIdChk()"></td>
					<input type="hidden" name="idDup" value="idUncheck">									
				</tr>
				<tr>
					<td>비밀번호</td>								
					<td><input type="password" name="f_mem_pw" maxlength="10" placeholder="최소 4자 최대 10자 가능."></td>
				</tr>
				<tr>
					<td>비밀번호확인</td>
					<td><input type="password" name="f_mem_pw_chk" maxlength="10" onkeyup="pwCheck()"></td>								
					<td><input class="div01_inp_pwChkRes" type="text" name="f_mem_pw_result" readonly="readonly"></td>
				</tr>
				<tr>
					<td>이름</td>								
					<td><input type="text" name="f_mem_name" placeholder="이름"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="f_mem_phone" placeholder="휴대폰"></td>				
				</tr>
				<tr>
					<td>우편번호</td>								
					<td><input type="text" name="f_mem_addr" placeholder="우편번호"></td>
				</tr>
				<tr>
					<td>주소</td>								
					<td><input type="text" name="f_mem_addr1" placeholder="주소"></td>
				</tr>
				<tr>
					<td>나머지</td>								
					<td><input type="text" name="f_mem_addr2" placeholder="상세주소"></td>
				</tr>
				<tr>
					<td>이메일</td>								
					<td><input type="text" name="f_mem_email" placeholder="이메일"></td>
				</tr>
				<tr>
					<td>닉네임</td>								
					<td><input type="text" name="f_mem_nick" placeholder="닉네임"></td>
				</tr>
			</table>
			<table>
				<tr>
					<td><input class="inp01" type="submit" value="가입"/></td>					
					<td><input class="inp01" type="button" value="취소" onclick="location.href='./MemberLogin.me'"></td>
				</tr>
			</table>
		</form>
	</div>	
</body>
</html>