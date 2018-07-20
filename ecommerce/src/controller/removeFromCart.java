package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import getdb.GetDB;

/**
 * Servlet implementation class removeFromCart
 */
@WebServlet("/removeFromCart")
public class removeFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		String pass=(String)session.getAttribute("pass");
		String pid=request.getParameter("pid");
		String sql="select cart from userinfo where email=? and password=?";
		String sql1="update userinfo set cart=? where email=? and password=?";
		Connection cn=GetDB.getCn();
		try {
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String cart=rs.getString(1);
			System.out.println(pid);
			System.out.println(cart);
			
			String s[]=cart.split(" ");
			cart="";
			for(String s1 : s)
			{
				if(! (s1.equals(pid)))
				{
					cart=cart+" "+s1;
				}
			}
			cart=cart.trim();
			System.out.println(cart);
			PreparedStatement ps1=cn.prepareStatement(sql1);
			ps1.setString(1, cart);
			ps1.setString(2 , email);
			ps1.setString(3, pass);
			if(ps1.executeUpdate()>0)
			{
				session.removeAttribute("cart");
				session.setAttribute("cart", cart);
				response.sendRedirect("cart.jsp");
			}
			else
			{
				System.out.println("Cart update problem occured");
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
