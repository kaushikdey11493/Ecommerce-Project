package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import getdb.GetDB;

/**
 * Servlet implementation class buy
 */
@WebServlet("/buy")
public class buy extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		String pid=request.getParameter("pid");
		String email=(String)session.getAttribute("email");
		Date date=new Date();
		String sql="insert into delivery values(?,?,?)";
		Connection cn=GetDB.getCn();
		try 
		{
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, pid);
			ps.setString(3, date.toString());
			ps.executeUpdate();
			response.sendRedirect("removeFromCart?pid="+pid);
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}

}
