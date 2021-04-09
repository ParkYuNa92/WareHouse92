package com.green.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.dao.ScoreDao;
import com.green.vo.Score;

@SuppressWarnings("serial")
@WebServlet("/score/add")
public class ScoreAddServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/score/ScoreForm.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ServletContext sc = this.getServletContext();
			ScoreDao scoreDao = (ScoreDao) sc.getAttribute("scoreDao");
			scoreDao.insert(new Score().setSname(request.getParameter("sname"))
							.setSpassword(request.getParameter("spassword"))
							.setKorea(Integer.parseInt(request.getParameter("korea")))
							.setMath(Integer.parseInt(request.getParameter("math")))
							.setEng(Integer.parseInt(request.getParameter("eng")))
							);
			response.sendRedirect("list");
			response.setContentType("text/html;charset=UTF-8");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
