package com.goods.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.")
public class GoodsFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Goods-doProcess() ȣ��");

		System.out.println("\n\n 1. �����ּ� ���");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();

		String command = requestURI.substring(contextPath.length());
		System.out.println("command : " + command);

		System.out.println("\n 1. �����ּ� ���");

		System.out.println("\n 2. �����ּ� ����");

		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/GoodsList.go")){
			// http://localhost:8088/food/GoodsList.go
		System.out.println("C : /GoodsList.go ȣ��");
		System.out.println("C : DB���� ������ �����ͼ� view ���");
		
			action=new GoodsListAction();
			
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}if(command.equals("/GoodsDetail.go")){
			System.out.println("C : /GoodsDetail.go ȣ��");
			System.out.println("C : DB���� ������ �����ͼ� view ���");
			
			action=new GoodsDetailAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		

		System.out.println("\n 2. �����ּ� ����");

		System.out.println("\n 3. ������ �̵�");

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());

				dis.forward(request, response);
			}
		}

		System.out.println("\n 3. ������ �̵�");

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Goods-doGet() ȣ��");

		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Goods-doPost() ȣ��");

		doProcess(request, response);
	}

}
