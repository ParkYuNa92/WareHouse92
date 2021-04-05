package sample;



import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.vo.Member;

@SuppressWarnings("serial")
@WebServlet("/sample")
public class SampleController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기에 들어오나 sampleController get방식"+request.getParameter("no"));
		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/member", "root","1234");
			System.out.println(conn);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from members where mno = "+request.getParameter("no"));
			boolean re = rs.next();
			String email = rs.getString("email");
			String name = rs.getString("mname");
			String password = rs.getString("pwd");
			Member a= new Member();
			a.setEmail(email);
			a.setName(name);
			a.setPassword(password);
			System.out.println("이메일은: "+email);
			request.setAttribute("tt", a);

			RequestDispatcher rd = request.getRequestDispatcher("/2.jsp");
			rd.forward(request, response);
			
			}catch(Exception e) {}
				
		
		}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
