<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 상품 등록 작성</title>
</head>
<body>

<h1> 판매 상품 등록 페이지 </h1>

<div>	
	<form action="./AdminGoodsAddAction.ag" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>카테고리</td>
				<td>
					<input type="radio" name="f_gs_cate" value="meal">밀키트
					<input type="radio" name="f_gs_cate" value="veg">식재료
					<input type="radio" name="f_gs_cate" value="tool">주방용품
				</td>
			</tr>
			<tr>
				<td>상품명</td>
				<td>
					<input type="text" name="f_gs_name">
				</td>
			</tr>
			<tr>
				<td>판매가</td>
				<td>
					<input type="text" name="f_gs_price">
				</td>
			</tr>
			<tr>
				<td>수량</td><!-- 재고량(판매가능수량) -->
				<td>
					<input type="text" name="f_gs_amount">
				</td>
			</tr>
			<tr>
				<td>제품정보</td>
				<td>
					<input type="text" name="f_gs_msg">
				</td>
			</tr>
			<tr>
				<td>메인 이미지</td>
				<td>
					<input type="file" name="file1">
				</td>
			</tr>
			<tr>
				<td>제품 이미지1</td>
				<td>
		 			<input type="file" name="file2">					
				</td>
			</tr>
			<tr>
				<td>제품 이미지2</td>
				<td>
					<input type="file" name="file3">					
				</td>
			</tr>
			<tr>
				<td>제품 이미지3</td>
				<td>
					<input type="file" name="file4">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록하기">
					<input type="reset" value="다시작성"> 
				</td>
			</tr>
		</table>
	</form>
</div>	

</body>
</html>