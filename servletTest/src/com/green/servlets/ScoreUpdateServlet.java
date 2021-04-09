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
@WebServlet("/score/update")
public class ScoreUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("업데이트 서블릿 get방식");
		try{
			ServletContext sc = this.getServletContext();
			ScoreDao scoreDao = (ScoreDao)sc.getAttribute("scoreDao");
			Score score = scoreDao.selectOne(Integer.parseInt(request.getParameter("sno")));
			request.setAttribute("score", score);
			RequestDispatcher rd = request.getRequestDispatcher("/score/ScoreUpdateForm.jsp");
			rd.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("업데이트 서블릿 post방식");
		try {
			ServletContext sc = this.getServletContext();
			ScoreDao scoreDao = (ScoreDao) sc.getAttribute("scoreDao");
			scoreDao.update(new Score()
							.setSno(Integer.parseInt(request.getParameter("sno")))
							.setSname(request.getParameter("sname"))
							.setKorea(Integer.parseInt(request.getParameter("korea")))
							.setMath(Integer.parseInt(request.getParameter("math")))
							.setEng(Integer.parseInt(request.getParameter("eng")))
							);
			response.sendRedirect("list");
			response.setContentType("text/html);charset=UTF-8");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
