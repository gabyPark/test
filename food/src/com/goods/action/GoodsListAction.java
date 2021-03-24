package com.goods.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.goods.db.GoodsDAO;

public class GoodsListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : GoodsListAction_execute() ȣ��!");
		
		//�ѱ�ó��
		request.setCharacterEncoding("UTF-8");
		
		//ī�װ� ó��
		String item=request.getParameter("item");
		
		if(item ==null){
			item="all";
		}
		
		//DAO ��ü ����
		GoodsDAO gdao=new GoodsDAO();
		//�ش� ������ �������� �޼���
		//request ������ ����
		List goodsList=gdao.getGoodsList(item);
		request.setAttribute("goodsList", goodsList);
		
		//������ �̵�(./goods/goods_list.jsp)
		ActionForward forward=new ActionForward();
		forward.setPath("./goods/goods_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
