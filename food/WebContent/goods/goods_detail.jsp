<%@page import="com.admin.goods.db.GoodsBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
    function isBasket(){
    	alert(" 장바구니 처리 ");
    	
    	// 구매 수량,크기,색상 미 선택시 이동 X
    	
    	if(document.gfr.amount.value == ""){
    		alert(" 구매수량을 입력하세요.");
    		document.gfr.amount.focus();
    		return;
    		
    		
    	}
    	
		var check = confirm("장바구니에 저장하시겠습니까?");
    	
    	if(check){
    		document.gfr.action = "./BasketAdd.ba";
    		document.gfr.submit();	    		
    	}else{
    		return;
    	}
    	
    	
    }
    
</script>
</head>
<body>


<%
	GoodsBean gb=(GoodsBean)request.getAttribute("goods");



%>
	<h1>WebContent/goods/goods_detail.jsp</h1>
	
	<form action="" method="post" name="gfr">
	<input type="hidden" name="num" value="<%=gb.getF_gs_num()%>">
	<table border="1">
		<tr>
			<td rowspan="7">
			<img width="400" height="400" src="./upload/<%=gb.getF_gs_img().split(",")[0]%>"> <br>상품이미지</td>
		</tr>
		<tr>
			<td>상품이름 : <b><%=gb.getF_gs_name() %></b></td>
		</tr>
		<tr>
			<td>판매가격 : <%=gb.getF_gs_price() %> 원 </td>
		</tr>
		<tr>
			<td>구매수량 : <input type="number" name="amount"></td>
		</tr>
		<tr>
			<td>남은수량 : <%=gb.getF_gs_amount() %> </td>	
		</tr>	
		<tr>
			<td>상품내용 : <%=gb.getF_gs_msg() %></td>
		</tr>
		<tr>
			<td><a href="javascript:isBasket()">[장바구니 담기]</a>
			<a href="javascript:isBuy()">[구매하기]</a></td>
		</tr>
		 <tr>
       <td colspan="2">
       
       <c:forTokens var="imgName" items="${goods.f_gs_img}" delims=",">
        <img  width="600" src="./upload/${imgName }"><br>
       </c:forTokens>
       
       </td>
     </tr>
	
	</table>
	</form>
	

</body>
</html>