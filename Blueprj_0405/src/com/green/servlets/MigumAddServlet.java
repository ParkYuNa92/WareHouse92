package com.green.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.dao.MigumDao;
import com.green.vo.Migum;

@SuppressWarnings("serial")
@WebServlet("/m/add")
public class MigumAddServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("추가 서블릿 get 방식으로 오는가");
		RequestDispatcher rd = request.getRequestDispatcher("/migum/form.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("추가 서블릿 post 방식으로 오는가"+request.getParameter("no"));
		try {
			ServletContext sc = this.getServletContext();
			MigumDao mdao = (MigumDao) sc.getAttribute("migumDao");
			mdao.insert(new Migum().setName(request.getParameter("name"))
									.setTotal(Integer.parseInt(request.getParameter("total"))));
			response.sendRedirect("list");
		}catch(Exception e) {
			
		}
	}

}
