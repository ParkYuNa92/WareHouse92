package basic;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;


@SuppressWarnings("serial")
@WebServlet("/AppInitServlet")
public class AppInitServlet extends HttpServlet {
	
	

	public void init(ServletConfig config) throws ServletException {
		System.out.println("AppInitServlet 준비..........");
		super.init(config);
		try {
			ServletContext sc =  this.getServletContext();
			//객체를 하나만 만들어 재사용하는 singleton 객체로 구현되어 있다
//			ServletContext sc = new ServletContext;	//객체 생성 불가
			Class.forName(sc.getInitParameter("driver"));
			Connection conn = DriverManager.getConnection(
					sc.getInitParameter("url"),
					sc.getInitParameter("username"),
					sc.getInitParameter("password")
					);
			sc.setAttribute("conn", conn);	//저장할 땐 setAttribute, 가져올 땐 getAttribute
			
		}catch(Throwable e){
			throw new ServletException(e);
		}
	}
	//생명주기
	//1) Application(ServletCOntext/보관소)
	//2) Session(HttpSession)
	//3) request(ServletRequest)
	//4) pageContext(JspCOntext)

	public void destroy() {
		System.out.println("AppInitServlet 마무리.........");
		super.destroy();
		Connection conn = (Connection) this.getServletContext().getAttribute("conn");
		try {
			if(conn!=null && conn.isClosed()==false) {
				conn.close();
			}
		}catch(Exception e) {}
	}//destory

}
