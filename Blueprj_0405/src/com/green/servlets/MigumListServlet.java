package com.green.servlets;

import java.io.IOException;
import java.util.List;

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
@WebServlet("/m/list")
public class MigumListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ServletContext sc = this.getServletContext();
			MigumDao mdao =(MigumDao)sc.getAttribute("migumDao");
			List<Migum> tt = mdao.selectList();
			request.setAttribute("u", tt);
			RequestDispatcher rd = request.getRequestDispatcher("/migum/list.jsp");
			rd.include(request, response); 	//다시 받을 때는 request 말고 include를 쓴다
		}catch(Exception e) {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
