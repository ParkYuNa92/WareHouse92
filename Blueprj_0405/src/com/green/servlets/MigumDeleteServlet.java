package com.green.servlets;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.dao.MigumDao;


@SuppressWarnings("serial")
@WebServlet("/m/delete")
public class MigumDeleteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ServletContext sc = this.getServletContext();
			MigumDao mdao = (MigumDao) sc.getAttribute("migumDao");
			System.out.println("삭제 서블릿 "+ Integer.parseInt(request.getParameter("no")));
			mdao.delete(1);
			response.sendRedirect("list");
		}catch(Exception e) {
			
		}
		
	}

}
