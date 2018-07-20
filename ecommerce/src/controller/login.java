package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import getdb.GetDB;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		HttpSession session=request.getSession();
		
		String sql="select * from userinfo where email=? and password=?";
		try
		{
			Connection cn=GetDB.getCn();
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2,pass);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				session.setAttribute("name",rs.getString(2));
				session.setAttribute("email",email);
				session.setAttribute("pass",pass);
				session.setAttribute("noofitem",rs.getString(13));
				session.removeAttribute("error");
				Cookie cookie=new Cookie("ecommerce_name+email+pasword", rs.getString(2)+"+"+email+"+"+pass);
				cookie.setMaxAge(60*60*24*365);
				response.addCookie(cookie);
				response.setHeader("Cache-Control","no-store");
				response.setHeader("Pragma","no-cache"); 
				response.setHeader ("Expires", "0");
				/*RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
				rd.include(request,response);*/
				response.sendRedirect("home.jsp");
			}
			else
			{
				session.setAttribute("error", "1");
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
				rd.include(request,response);
			}
		}
		catch(Exception e)
		{
			PrintWriter pw=response.getWriter();
			pw.println("Unable to fetch from in database . Problem occured");
			System.out.println(e);
		}
	}

}
