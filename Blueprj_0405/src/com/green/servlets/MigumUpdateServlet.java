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
@WebServlet("/m/update")
public class MigumUpdateServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("수정 서블릿 get으로 들어오나" + request.getParameter("no"));
		ServletContext sc = this.getServletContext();
		MigumDao mdao = (MigumDao)sc.getAttribute("migumDao");
		try {
			Migum a = mdao.get(request.getParameter("no"));
			request.setAttribute("one", a);
			RequestDispatcher rd = request.getRequestDispatcher("/migum/updateForm.jsp");
			rd.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post로 들어오나"+request.getParameter("no"));
		
		try {
			ServletContext sc = this.getServletContext();
			MigumDao mdao = (MigumDao)sc.getAttribute("migumDao");
			mdao.update(new Migum().setMno(Integer.parseInt(request.getParameter("no")))	//넘어오는 건 문자열이라서 parseInt로 바꿔줌
									.setName(request.getParameter("name"))
									.setTotal(Integer.parseInt(request.getParameter("total"))));//넘어오는 건 문자열이라서 parseInt로 바꿔줌
			response.sendRedirect("list");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
