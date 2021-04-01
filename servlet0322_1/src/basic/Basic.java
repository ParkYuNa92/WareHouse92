package basic;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.model.Customer;






@SuppressWarnings("serial")
@WebServlet("/t")
public class Basic extends HttpServlet {	//MVC 패턴의 Controller
	// M(model) V(view/jsp) C(Controller/Servlet) 

	
    public Basic() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer customer = new Customer();
		// TODO Auto-generated method stub
		System.out.println("여기 get방식으로 들어오나");
		response.getWriter().append("에서 출력됩니다.: ").append(request.getContextPath());
		String [] arr = new String [10];
		arr[0]=request.getParameter("action");
		arr[1]=request.getParameter("red");
		arr[2]=request.getParameter("blue");
		arr[3]=request.getParameter("yellow");
		arr[4]=request.getParameter("white");
		for(int i=5; i<arr.length; i++) {
			arr[i]= request.getParameter("a"+(i-4));
		}
		for(String a: arr) System.out.println(a);
		

		String page = null;
		if(customer == null) page = "/view/error.jsp";
		else page = "/view/success.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("pw"));
		System.out.println(request.getParameter("email"));
	}

}
