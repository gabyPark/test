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
    	alert(" ��ٱ��� ó�� ");
    	
    	// ���� ����,ũ��,���� �� ���ý� �̵� X
    	
    	if(document.gfr.amount.value == ""){
    		alert(" ���ż����� �Է��ϼ���.");
    		document.gfr.amount.focus();
    		return;
    		
    		
    	}
    	
		var check = confirm("��ٱ��Ͽ� �����Ͻðڽ��ϱ�?");
    	
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
			<img width="400" height="400" src="./upload/<%=gb.getF_gs_img().split(",")[0]%>"> <br>��ǰ�̹���</td>
		</tr>
		<tr>
			<td>��ǰ�̸� : <b><%=gb.getF_gs_name() %></b></td>
		</tr>
		<tr>
			<td>�ǸŰ��� : <%=gb.getF_gs_price() %> �� </td>
		</tr>
		<tr>
			<td>���ż��� : <input type="number" name="amount"></td>
		</tr>
		<tr>
			<td>�������� : <%=gb.getF_gs_amount() %> </td>	
		</tr>	
		<tr>
			<td>��ǰ���� : <%=gb.getF_gs_msg() %></td>
		</tr>
		<tr>
			<td><a href="javascript:isBasket()">[��ٱ��� ���]</a>
			<a href="javascript:isBuy()">[�����ϱ�]</a></td>
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