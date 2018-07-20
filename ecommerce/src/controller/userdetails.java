package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import getdb.GetDB;

/**
 * Servlet implementation class userdetails
 */
@WebServlet("/userdetails")
public class userdetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String country=request.getParameter("country");
		String state=request.getParameter("state");
		String city=request.getParameter("city");
		String town=request.getParameter("town");
		String street=request.getParameter("street");
		String housenumber=request.getParameter("housenumber");
		String nearby=request.getParameter("nearby");
		HttpSession session=request.getSession();
		String pass=(String)session.getAttribute("pass");
		String email=(String)session.getAttribute("email");
		String sql="update userinfo"
				+ " set country=?,state=?,city=?,town=?,streetname=?,housenumber=?,nearby=?"
				+ " where email=? and password=?";
		try
		{
			Connection cn=GetDB.getCn();
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1,country);
			ps.setString(2,state);
			ps.setString(3,city);
			ps.setString(4,town);
			ps.setString(5,street);
			ps.setString(6,housenumber);
			ps.setString(7,nearby);
			ps.setString(8, email);
			ps.setString(9, pass);
			System.out.println(email);
			System.out.println(pass);
			int r=ps.executeUpdate();
			System.out.println(r);
			if(r!=0)
			{
				session.setAttribute("save","1");
				response.sendRedirect("userdetails.jsp");
			}
			else
			{
				session.setAttribute("save","0");
				response.sendRedirect("userdetails.jsp");
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
