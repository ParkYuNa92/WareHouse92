package basic.listeners;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import basic.dao.MemberDao;
import basic.util.DBConnectionPool;

@WebListener
public class ContextLoaderListener implements ServletContextListener {
	DBConnectionPool connPool;

    public void contextDestroyed(ServletContextEvent event)  { 
         try {
        	 connPool.CloseAll();
         } catch(Exception e) {}
    }

    public void contextInitialized(ServletContextEvent event)  { 
         // AppInitServlet의 코드를 가져와서 여기서 실행
    	try {
    		System.out.println("리스너의 contextInitialized 호출됨 ");
    		ServletContext sc = event.getServletContext();
    		connPool = new DBConnectionPool(
    				sc.getInitParameter("driver"),
    				sc.getInitParameter("url"),
    				sc.getInitParameter("username"),
    				sc.getInitParameter("password"));
			MemberDao memberDao = new MemberDao();
			memberDao.setDBConnectionPool(connPool);
			sc.setAttribute("memberDao", memberDao);
    	} catch (Throwable e) {	//exception 에서 가장 높은 Throwable
    		e.printStackTrace();
    	}
    }
	
}
