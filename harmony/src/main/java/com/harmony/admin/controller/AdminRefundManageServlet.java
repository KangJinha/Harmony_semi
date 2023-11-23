package com.harmony.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminRefundManageServlet
 */
@WebServlet("/admin/manage/refund.do")
public class AdminRefundManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRefundManageServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage = Integer.parseInt(request.getParameter("cPage")!=null?request.getParameter("cPage"):"1");
		Cookie[] cookies = request.getCookies();
		int numPerPage = 10;
		int pageBarSize = 5;
		for(Cookie c : cookies) {
			if(c.getName().equals("admin_report_numPerPage")) {
				numPerPage = Integer.parseInt(c.getValue());
			}
			if(c.getName().equals("admin_report_pageBarSize")) {
				pageBarSize = Integer.parseInt(c.getValue());
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
