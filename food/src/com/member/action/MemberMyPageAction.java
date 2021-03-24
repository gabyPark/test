package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class MemberMyPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberMyPageAction_execute() 호출");
		
		// 세션확인
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("f_mem_id");
				
		ActionForward forward = new ActionForward();
		/*
		if(id == null || !id.equals("admin")) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}		
		*/
		
		forward.setPath("./member/MemberMyPage.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
