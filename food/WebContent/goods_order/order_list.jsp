<%@page import="com.order.db.OrderBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2> WebContent / goods_order / order_list.jsp</h2>

<%
	// request.setAttribute("orderList", ordao.getOrderList(id));
	List orderList = (List) request.getAttribute("orderList");

%>

<h2> 주문 목록 </h2>

<table border="1">
  <tr>
	<td>주문번호</td>  
	<td>상품명</td>  
	<td>결제 방법</td>  
	<td>주문 금액</td>  
	<td>주문 상태</td>  
	<td>주문 일자</td>  
	<td>운송장 번호</td>  
  </tr>

  <%
    for(int i=0; i<orderList.size(); i++) {
   		OrderBean ob = (OrderBean) orderList.get(i);
  %>
  <tr>
	<td>
	<a href="./OrderDetail.or?trade_num=<%=ob.getF_or_trade_num() %>">
	<%=ob.getF_or_trade_num() %>
	</a>
	</td>  
	<td><%=ob.getF_or_gs_name() %></td>  
	<td><%=ob.getF_or_trade_type() %></td>  
	<td><%=ob.getF_or_sum() %></td>  
	
	<%
	  // 주문 상태
	  // 0 대기중, 1 발송준비, 2 발송완료, 3 배송중
	  // 4 배송완료, 5 주문취소
	  String status = "";
	  
	  if(ob.getF_or_status() == 0){
		  status = "대기중";
	  } else if (ob.getF_or_status() == 1){
		  status = "발송 준비";
	  } else if (ob.getF_or_status() == 2){
		  status = "발송 완료";
	  } else if (ob.getF_or_status() == 3){
		  status = "배송중";
	  } else if (ob.getF_or_status() == 4){
		  status = "배송 완료";
	  } else if (ob.getF_or_status() == 5){
		  status = "주문 취소"; 
	  }  else {
		  status = "에러. 관리자에게 문의하세요";
	  }
	
	
	%>
	
	<td><%=status %></td>  
	<td><%=ob.getF_or_date() %></td>  
	<td><%=ob.getF_or_trans_num() %></td>  
  </tr>
  <%} %>

</table>

  <a href="./Main.me"> 메인페이지로 </a>

</body>
</html>