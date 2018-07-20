package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class logout
 */
@WebServlet("/logout")
public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.invalidate();
		Cookie cookie = null;
		Cookie[] cookies = null;
		cookies = request.getCookies();

		if( cookies != null ) 
		{
			for (int i = 0; i < cookies.length; i++) 
			{
  				cookie = cookies[i];
  				if(cookie.getName().equals("ecommerce_name+email+pasword"))
  				{
  					cookie.setMaxAge(0);
  					response.addCookie(cookie);
      				break;
      			}
   			}
		}
		response.sendRedirect("home.jsp");
	}
}
