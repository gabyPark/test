package com.goods.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.goods.db.GoodsDAO;

public class GoodsListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : GoodsListAction_execute() 호출!");
		
		//한글처리
		request.setCharacterEncoding("UTF-8");
		
		//카테고리 처리
		String item=request.getParameter("item");
		
		if(item ==null){
			item="all";
		}
		
		//DAO 객체 생성
		GoodsDAO gdao=new GoodsDAO();
		//해당 정보를 가져오는 메서드
		//request 영역에 저장
		List goodsList=gdao.getGoodsList(item);
		request.setAttribute("goodsList", goodsList);
		
		//페이지 이동(./goods/goods_list.jsp)
		ActionForward forward=new ActionForward();
		forward.setPath("./goods/goods_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
