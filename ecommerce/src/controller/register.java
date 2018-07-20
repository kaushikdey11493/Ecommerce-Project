package controller;

import getdb.*;
import java.sql.*;
import java.util.Random;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		String number=request.getParameter("number");
		String country=request.getParameter("country");
		String state=request.getParameter("state");
		String city=request.getParameter("city");
		String town=request.getParameter("town");
		String street=request.getParameter("street");
		String housenumber=request.getParameter("housenumber");
		String nearby=request.getParameter("nearby");
		
		String sql="insert into userinfo"
				+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Random rand=new Random();
		int id=rand.nextInt(100000);
		String uid=email.substring(0, email.indexOf('@'))+id;
		try
		{
			Connection cn=GetDB.getCn();
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1,uid);
			ps.setString(2, name);
			ps.setString(3, email);
			ps.setString(4,pass);
			ps.setString(5,country);
			ps.setString(6,state);
			ps.setString(7,city);
			ps.setString(8,town);
			ps.setString(9,street);
			ps.setString(10,housenumber);
			ps.setString(11,nearby);
			ps.setString(12, null);
			ps.setString(13,"0");
			ps.setString(14,number);
			if(ps.executeUpdate()!=0)
			{
				HttpSession session=request.getSession();
				session.setAttribute("name",name);
				session.setAttribute("email",email);
				session.setAttribute("pass",pass);
				session.setAttribute("noofitem","0");
				Cookie cookie=new Cookie("ecommerce_name+email+pasword", name+"+"+email+"+"+pass);
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
				PrintWriter pw=response.getWriter();
				pw.println("Unable to store in database . Problem occured");
			}
		}
		catch(Exception e)
		{
			PrintWriter pw=response.getWriter();
			pw.println("Unable to store in database . Problem occured");
			System.out.println(e);
		}
	}

}
