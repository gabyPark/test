<%@page import="com.admin.goods.db.GoodsBean"%>
<%@page import="com.goods.action.GoodsListAction"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/goods/goods_list.jsp</h1>
	
	<%
	List goodsList=(List)request.getAttribute("goodsList");
	
	%>
	
	<nav>
		<ul>
			<li><a href="./GoodsList.go?">��ü����</a></li>
			<li><a href="./GoodsList.go?item=meal">��ŰƮ</a></li>
			<li><a href="./GoodsList.go?item=veg">�����</a></li>
			<li><a href="./GoodsList.go?item=tool">�ֹ��ǰ</a></li>
		</ul>
	</nav>
	
	<form action="">
		<select name="type">
			<option value="latest">�ֽż�</option>
			<option value="highPrice">��Ѱ��ݼ�</option>
			<option value="lowPrice">�������ݼ�</option>
		</select>
	</form>
	
	<%
	//��ǰ�� �� ����
	int size=goodsList.size();
    // ��ǰ�� ���� ���� 8��
    int col = 4;
    // ��ǰ�� ���� ����
    int row = (size / col) + (size % col>0? 1:0);
    // ���ī��Ʈ
    int num = 0;
	
	%>
	
	
	
	<table border="1">
	
	<%
      for(int a=0;a<row;a++){
    	  %>
    	  <tr>
    	  <%
    	  for(int b=0;b<col;b++){
    		  GoodsBean gb =(GoodsBean) goodsList.get(num);
    		%>
    		  <td>
    		     <img src="./upload/<%=gb.getF_gs_img().split(",")[0] %>"
                  width="130" height="150"><br>

                 <a href="./GoodsDetail.go?num=<%=gb.getF_gs_num() %>">          		 
          		 <%=gb.getF_gs_name() %>
          		 </a>
          		 <br>
          		 <%=gb.getF_gs_price() %>��<br>
    		  </td>
    		<%
    		num++;
    		if(size<=num) break;
    	  }
    	 %>
    	   </tr>
      <% 
      }
     %>
   
	</table>
</body>
</html>