package com.green.listeners;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.green.dao.ScoreDao;
import com.green.util.DBConnectionPool;


@WebListener
public class ContextLoaderListener implements ServletContextListener {
	DBConnectionPool connPool;

    public void contextDestroyed(ServletContextEvent event)  { 
         try {
        	 connPool.closeAll();
         }catch (Exception e) {}
    }


    public void contextInitialized(ServletContextEvent event)  { 
         try {
			ServletContext sc = event.getServletContext();
			connPool = new DBConnectionPool(
					sc.getInitParameter("driver"),
					sc.getInitParameter("url"),
					sc.getInitParameter("username"),
					sc.getInitParameter("password")
					);
			ScoreDao scoreDao = new ScoreDao();
			scoreDao.setDBConnectionPool(connPool);
			sc.setAttribute("scoreDao", scoreDao);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
	
}
