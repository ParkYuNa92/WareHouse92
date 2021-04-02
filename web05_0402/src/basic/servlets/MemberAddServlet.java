package basic.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/member/add")
public class MemberAddServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기 들어오나");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html><head><title> 회원 등록 </title></head>");
		out.println("<body><h1> 회원 등록 </h1>");
		out.println("<form action = 'add' method='post'>");
		out.println("이름 : <input type='text' name = 'name'><br>");
		out.println("이메일 : <input type='text' name = 'email'><br>");
		out.println("비밀번호 : <input type='text' name = 'password'><br>");
		out.println("<input type='submit' value='전송'/>");
		out.println("<input type='reset' value='초기화'/></form>");
		out.println("</body></html>");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("ㅇㅇㅇㅇ");
		System.out.println("이름 : "+ req.getParameter("name"));
		System.out.println("이메일 : "+ req.getParameter("email"));
		System.out.println("비밀번호 : "+ req.getParameter("password"));
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			conn = DriverManager.getConnection("jdbc:mysql://localhost/member", "root","1234");
			System.out.println(conn);
			stmt =  conn.prepareStatement(
					"insert into members(email, pwd, mname, cre_date, mod_date)"
					+ " values(?,?,?,now(),now())");
			stmt.setString(1, req.getParameter("email"));
			stmt.setString(2, req.getParameter("password"));
			stmt.setString(3, req.getParameter("name"));
			stmt.executeUpdate();
			
			//추가(refactoring, 좋은 코드로 변경하는 과정)
//			resp.sendRedirect("list");	//데이터 입력 후 list url로 이동함
			resp.setContentType("text/html;charset=UTF-8");	//DB에 한글처리
			PrintWriter out = resp.getWriter();
			out.println("<html><head><title>회원등록결과</title>");	//수정
			out.println("<meta http-equiv='Refresh' content='1; url=list'></head>");	//추가
			out.println("<body>");
			out.println("<p>등록 성공입니다");
			out.println("</body></html>");
			//refresh 정보를 응답 헤더에 추가
			//데이터 추가하고 1초 후에 목록 페이지로 이동
			resp.addHeader("Refresh", "1;url=list");
		}catch(Exception e) {throw new ServletException(e);
		}finally {
			try {if(stmt != null) stmt.close();}catch(Exception e) {}
			try {if(conn != null) conn.close();}catch(Exception e) {}

		}
		
		
	}

}
