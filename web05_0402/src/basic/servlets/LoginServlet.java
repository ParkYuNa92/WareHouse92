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
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			ServletContext sc = this.getServletContext();
			conn = (Connection) sc.getAttribute("conn");
			stmt =  conn.prepareStatement(
					"select mname, email from members where email =? and pwd = ?"
					);
			stmt.setString(1, request.getParameter("email"));					
			stmt.setString(2, request.getParameter("password"));
			rs = stmt.executeQuery();
			System.out.println("이메일: "+ request.getParameter("email"));
			System.out.println("비밀번호: "+ request.getParameter("password"));
			
			if(rs.next()) {
				Member member = new Member()
						.setEmail(rs.getString("email"))
						.setName(rs.getString("mname"));
				HttpSession session = request.getSession();
				session.setAttribute("member", member);
				response.sendRedirect("../member/list");			
			}else {
				RequestDispatcher rd = request.getRequestDispatcher(
						"/auth/LoginForm.jsp");
				rd.forward(request, response);
			}
		}catch(Exception e){
			throw new ServletException(e);
		}finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {}
			try {if(stmt!=null) stmt.close();} catch(Exception e) {}
			
		}
				
	}

}
