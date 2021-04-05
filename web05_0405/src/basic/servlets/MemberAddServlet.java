package basic.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.dao.MemberDao;
import basic.vo.Member;

@SuppressWarnings("serial")
@WebServlet("/member/add")
public class MemberAddServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기 들어오나");
		RequestDispatcher rd = request.getRequestDispatcher("/member/MemberForm.jsp");
		rd.forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("ㅇㅇㅇㅇ");

		try {
				ServletContext sc = this.getServletContext();
				MemberDao memberDao = (MemberDao)sc.getAttribute("memberDao");
				memberDao.insert(new Member().setEmail(req.getParameter("email"))
							.setPassword(req.getParameter("password"))
							.setName(req.getParameter("name")));
				resp.sendRedirect("list"); //데이터 입력 후 list url로 이동함
			resp.setContentType("text/html;charset=UTF-8");	//DB에 한글처리

			resp.addHeader("Refresh", "1;url=list"); //refresh 정보를 응답 헤더에 추가, 데이터 추가하고 1초 후에 목록 페이지로 이동
		}catch(Exception e) {
			e.printStackTrace();
			req.setAttribute("error", e);
			RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
			rd.forward(req, resp);
		}
		
		
	}

}
