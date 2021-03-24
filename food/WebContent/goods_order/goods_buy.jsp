<%@page import="com.admin.goods.db.GoodsBean"%>
<%@page import="com.basket.db.BasketBean"%>
<%@page import="com.member.db.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebContent / goods_order / goods_buy.jsp</title>
</head>
<body>

<h1>WebContent / goods_order / goods_buy.jsp</h1>

<h2> 주문 상세 내역 </h2>

<%
/* 	
	정보 저장
	request.setAttribute("basketList", basketList);
	request.setAttribute("goodsList", goodsList);
	request.setAttribute("memberInfo", memberInfo); 
*/
	ArrayList basketList = (ArrayList) request.getAttribute("basketList");
	ArrayList goodsList = (ArrayList) request.getAttribute("goodsList");
	MemberBean memberInfo = (MemberBean) request.getAttribute("memberInfo");

%>


  <table border="1">
  <tr>
	<td>이미지</td>
	<td>상품명</td>
	<td>구매수량</td>
	<td>가격</td>
  </tr>
  
  <%
  	int totalSum = 0;
  	
  	for(int i=0; i<basketList.size(); i++){
  		BasketBean bk = (BasketBean) basketList.get(i);
  		GoodsBean gb = (GoodsBean) goodsList.get(i);
  		
  		totalSum += (gb.getF_gs_price() * bk.getF_bas_amount());
  %>
    <tr>
      <td>
      	<img src="./upload/<%=gb.getF_gs_img().split(",")[0] %>"
      		width="50" height="50">
      </td>
      <td><%=gb.getF_gs_name() %></td>
      <td><%=bk.getF_bas_amount() %></td>
      <td><%=gb.getF_gs_price() %></td>
    </tr>
    <%
  	}
    %>
  </table>
  	<h3> 총 가격 : <%=totalSum %></h3>
  
  <hr>
  
<form action="./OrderAdd.or" method="post">
  <table border="1">
    <tr>
      <td colspan="2"><h2>주문자 정보</h2></td>
    </tr>  
    <tr>
      <td>이름</td>
      <td><%=memberInfo.getF_mem_name() %></td>
    </tr>  
    <tr>
      <td>전화번호</td>
      <td>전화번호</td>
    </tr>  
    <tr>
      <td>이메일</td>
      <td><%=memberInfo.getF_mem_email() %></td>
    </tr>  
    <tr>
      <td colspan="2"><h2>배송지 정보</h2></td>
    </tr>  
    <tr>
      <td>받는 사람</td>
      <td><input type="text" name="o_receive_name" value="<%=memberInfo.getName()%>"></td>
    </tr>  
    <tr>
      <td>전화번호(휴대폰)</td>
      <td><input type="text" name="o_receive_phone"></td>
    </tr>  
    <tr>
      <td>배송지 주소</td>
      <td><input type="text" name="o_receive_addr1"></td>
    </tr>  
    <tr>
      <td>상세 주소</td>
      <td><input type="text" name="o_receive_addr2"></td>
    </tr>  
    <tr>
      <td>배송 메세지 작성</td>
      <td><input type="text" name="o_memo"></td>
    </tr>  
    <tr>
      <td colspan="2"><h2>결제 정보</h2></td>
    </tr>  
    <tr>
      <td colspan="2">
        <input type="radio" checked> 무통장 입금 
        <input type="radio"> 신용카드 
        <input type="radio"> 체크카드
        <input type="radio"> 페이      
      </td>
    </tr>
    <tr>  
      <td>입금자명(무통장 입금)</td>
      <td><input type="text" name="o_trade_payer"
      	   value="<%=memberInfo.getName() %>"></td>
    </tr>  

    <tr>  
      <td colspan="2">
        <input type="submit" value="주문하기">      
        <input type="reset" value="취소">      
      </td>
    </tr>  
    
  </table>
</form> 

</body>
</html>