package com.goods.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.admin.goods.db.GoodsBean;

public class GoodsDAO {
	

	// 메서드 작업에 필요한 참조변수 준비 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

//----------------------------------------------------------------------------------Connection getCon()----------------------------------
		
		
	private Connection getCon() throws Exception{ // 연결 정보를 리턴하는 메서드
		
		Context initCTX = new InitialContext(); 
		DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/foodDB"); //java:comp/env/ : 고정 + context.xml 의 name 정보 붙여넣기
		con = ds.getConnection();
			
		System.out.println("[goodsDAO] : 디비 연결 성공! >> "+con);
		return con;
		
	}//getCon()

//---------------------------------------------------------------------------------void closeDB()-------------------------------------
		
	
	private void closeDB(){
		try {
			if(rs != null ) rs.close();
			if(pstmt != null ) pstmt.close();
			if(con != null ) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// closeDB()
	
	//getGoodsList(item)
	public List getGoodsList(String item){
		List goodsList = new ArrayList();
		StringBuffer SQL=new StringBuffer();
		
		try {
			
			//1.2 디비연결
			con=getCon();
			
			//3.sql 작성 & pstmt객체
			
			SQL.append("select * from f_goods");
			
			if(item.equals("all")){
				
			}else{ //category
				SQL.append(" where f_gs_cate=?");
			}
			
		pstmt=con.prepareStatement(SQL.toString());
		
		if(item.equals("all")){
		
		}else{ //category
			pstmt.setString(1, item);
		}
		
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			//상품 정보 저장(GoodsBean)
			GoodsBean gb=new GoodsBean();
			
			gb.setF_gs_amount(rs.getInt("f_gs_amount"));
			gb.setF_gs_cate(rs.getString("f_gs_cate"));
			gb.setF_gs_date(rs.getString("f_gs_date"));
			gb.setF_gs_hit(rs.getInt("f_gs_hit"));
			gb.setF_gs_img(rs.getString("f_gs_img"));
			gb.setF_gs_msg(rs.getString("f_gs_msg"));
			gb.setF_gs_name(rs.getString("f_gs_name"));
			gb.setF_gs_num(rs.getInt("f_gs_num"));
			gb.setF_gs_price(rs.getInt("f_gs_price"));
			
			goodsList.add(gb);
		}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return goodsList;
	}
	
	
	public GoodsBean getGoods(int num){
		GoodsBean gb=null;
		
		try {
			//1.2. 디비연결
			con=getCon();
			//3.sql & pstmt
			sql="select * from f_goods where f_gs_num=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				gb=new GoodsBean();
				gb.setF_gs_amount(rs.getInt("f_gs_amount"));
				gb.setF_gs_cate(rs.getString("f_gs_cate"));
				gb.setF_gs_date(rs.getString("f_gs_date"));
				gb.setF_gs_hit(rs.getInt("f_gs_hit"));
				gb.setF_gs_img(rs.getString("f_gs_img"));
				gb.setF_gs_msg(rs.getString("f_gs_msg"));
				gb.setF_gs_name(rs.getString("f_gs_name"));
				gb.setF_gs_num(rs.getInt("f_gs_num"));
				gb.setF_gs_price(rs.getInt("f_gs_price"));
				
			}
			
			System.out.println("DAO : 상품정보 저장완료!");
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			closeDB();
		}
		return gb;
	}
	

}
