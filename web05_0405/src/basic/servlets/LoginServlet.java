package basic.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import basic.dao.MemberDao;
import basic.vo.Member;


@SuppressWarnings("serial")
@WebServlet("/auth/login")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/auth/LoginForm.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("로그인 포스트 컨트롤러에 들어왔어요");

		try {
			//ServletContextLoader 리스너에 MemberDao객체를 생성하고 setAttribute
			//ServletContext 보관소에 저장했고 그것을 여기서도 getAttribute로 가져다 사용하고 다른 서블릿에서도 가져다 사용함
			ServletContext sc = this.getServletContext();
			MemberDao memberDao = (MemberDao)sc.getAttribute("memberDao");
			
			Member member = memberDao.exist(	//요청한 값을 가져온다
					//처음에는 get방식으로 가면 Loginform.jsp로 보내고
					//그 값을 post방식으로 submit한다.
						request.getParameter("email"),request.getParameter("password")				
					);

			if(member!=null) {
				HttpSession session = request.getSession();
				session.setAttribute("member", member);
				response.sendRedirect("../member/list");			
			}else {
				RequestDispatcher rd = request.getRequestDispatcher(
						"/auth/LoginFail.jsp");
				rd.forward(request, response);
			}
		}catch(Exception e){
			throw new ServletException(e);
		}
				
	}

}
