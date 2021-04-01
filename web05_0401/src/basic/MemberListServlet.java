package basic;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.vo.Member;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor

@SuppressWarnings("serial")
@WebServlet("/member/list")
public class MemberListServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("여기 들어오난");
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			System.out.println(conn);
			stmt= conn.createStatement();
			rs = stmt.executeQuery(
					"select * from members order by mno asc");
			response.setContentType("text/html;charset=UTF-8");
			ArrayList<Member> members = new ArrayList<Member>();
	
			//데이터베이스에서 회원 정보를 가져와 Member에 담는다
			//그리고 Member객체를 ArrayList에 추가
			while(rs.next()) {	//배열로 변경
				members.add(new Member()
					.setNo(rs.getInt("mno"))
					.setName(rs.getString("mname"))
					.setEmail(rs.getString("email"))
					.setCreatedDate(rs.getDate("cre_date")));
			}
	
				//request에 회원 목록 데이터 보관
				request.setAttribute("members", members);//getAttribute로 가져옴
				//jsp로 화면 출력 위임
				RequestDispatcher rd = request.getRequestDispatcher("/member/MemberList.jsp");
					rd.forward(request, response);
				
		} catch (SQLException e) {
			request.setAttribute("error", e);
			RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
			rd.forward(request, response);
			
		}finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {}
			try {if(stmt!=null) stmt.close();} catch(Exception e) {}
//			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		
	}

}
