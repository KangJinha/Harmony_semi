package com.harmony.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.harmony.board.info.model.dto.InfoBoard;
import com.harmony.board.info.model.dto.InfoCommentBoard;
import com.harmony.board.model.service.InfoBoardService;


/**
 * Servlet implementation class InfoBoardViewServlet
 */
@WebServlet("/board/boardView.do")
public class InfoBoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoBoardViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		InfoBoard b=new InfoBoardService().selectInfBrdTitle();
//		request.setAttribute("InfoBoard",b);
		//서비스에 리스트 적어주고 보드뷰 맨위에 리스트 적어줘야함)
		String noParam = request.getParameter("no");
        int no = noParam != null ? Integer.parseInt(noParam) : 0;

        InfoBoardService infoBoardService = new InfoBoardService();
        InfoBoard b = infoBoardService.selectBoardByNo(no);
        List<InfoCommentBoard> comments = infoBoardService.selectBoardComments(no);

        request.setAttribute("InfoBoard", b);
        request.setAttribute("comments", comments);
	    //setAttribute 로 키값과 벨류값을 가져오고
	    //jsp에서 getAttribute를 이용해 키값을 가져와 화면에 나타냄
		
		request.getRequestDispatcher("/views/board/boardView.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
