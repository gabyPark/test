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
   <h1>WebContent/goods_order/order_detail.jsp</h1>
   
   <%
     //request.setAttribute("orderDetailList", ordao.orderDetail(trade_num));
   
     List orderDetailList 
          = (List) request.getAttribute("orderDetailList");
     
     int total=0; // 총합 금액
   
   %>
   <h2> 주문내역 상세보기 </h2>
   
   <table border="1">
      <tr>
        <td>상품명</td>
        <td>주문 수량</td>
        <td>주문 금액</td>
      </tr>
      
      <%for(int i=0;i<orderDetailList.size();i++){
    	    OrderBean ob =(OrderBean) orderDetailList.get(i);
    	    total += ob.getF_or_sum();
    	  %>
	      <tr>
	        <td><%=ob.getF_or_rec_name() %></td>
	        <td><%=ob.getF_or_bas_amount() %></td>
	        <td><%=ob.getF_or_sum() %></td>
	      </tr>
      <%} %>
   </table>
   
   <h3> 총 주문 금액 : <%=total %>원</h3>
   
   
   
   
   
</body>
</html>