package controller;

import java.io.IOException;
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
 * Servlet implementation class cancelorder
 */
@WebServlet("/cancelorder")
public class cancelorder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		String pid=request.getParameter("pid");
		String date=request.getParameter("date");
		System.out.println(email+","+pid+","+date);
		String sql="delete from delivery where email=? and pid=? and orderdate=?";
		Connection cn=GetDB.getCn();
		try {
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, pid);
			ps.setString(3, date);
			ps.executeUpdate();
			response.sendRedirect("orderdetails.jsp");;
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
