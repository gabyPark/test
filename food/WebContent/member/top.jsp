<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>레시피 맛집</title>
<link href="${pageContext.request.contextPath }/css/top.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/jscript/mainScript.js"></script>
</head>
<body>
	<%	
		String id = (String) session.getAttribute("f_mem_id");
	%>

	<div class="main_page_top">
		<section class="main_top_sec">
			<div class="main_top_buttons">
			<%
				if(id == null) {
			%>
				<button type="button" name="mem_join" value="mem_login" onclick=" location.href='./MemberLogin.me' ">로그인</button>
				<button type="button" name="mem_join" value="mem_join" onclick="location.href='./MemberJoin.me'">회원가입</button>				
			<%
				} else {
			%>
				<label><%=id %>님</label>
				<button type="button" name="mem_logout" value="mem_logout" onclick="location.href='./MemberLogout.me'">로그아웃</button>
				<button type="button" name="mem_join" value="mem_mypage" onclick="location.href='./MemberMyPageAction.me'">마이페이지</button>				
			<%	
				}
			%>	
				<button type="button" name="mem_join" value="mem_order">주문/배송조회</button>
				<button type="button" name="mem_join" value="mem_">고객센터</button>
			</div>
			<div class="main_name"><a href="./Main.me">FOOD</a><div>
		</section>
		
		<section class="main_menu_sec">
			<button class="tablink" onclick="openPage('Home', this, 'red')" 
			onmouseover="openCity(event, 'Home')" onmouseout="closeCity(event, 'Home')">소개</button>
			<button class="tablink" onclick="openPage('News', this, 'green')" 
			onmouseover="openCity(event, 'News')" onmouseout="closeCity(event, 'News')" id="defaultOpen">레시피</button>
			<button class="tablink" onclick="openPage('Contact', this, 'blue')" 
			onmouseover="openCity(event, 'Contact')" onmouseout="closeCity(event, 'Contact')">맛집</button>
			<button class="tablink" onclick="openPage('About', this, 'orange')" 
			onmouseover="openCity(event, 'About')" onmouseout="closeCity(event, 'About')">쇼핑몰</button>
			
			<div id="Home" class="tabcontent">
			  <h3>소개</h3>
			  <p>Home is where the heart is..</p>
			</div>
			
			<div id="News" class="tabcontent">
			  <h3>News</h3>
			  <p>Some news this fine day!</p>
			</div>
			
			<div id="Contact" class="tabcontent">
			  <h3>Contact</h3>
			  <p>Get in touch, or swing by for a cup of coffee.</p>
			</div>
			
			<div id="About" class="tabcontent">
			  <h3>About</h3>
			  <p>Who we are and what we do.</p>
			</div>
		</section>
	</div>
</body>
</html>