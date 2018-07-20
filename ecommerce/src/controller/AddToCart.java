package controller;

import getdb.GetDB;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session=request.getSession();
		if(session.getAttribute("email")!=null)
		{
			String pid=request.getParameter("id");
			String email=(String)session.getAttribute("email");
			String pass=(String)session.getAttribute("pass");
			String cart="";
			int n=0;
			String sql="select * from userinfo where email=? and password=?";
			try
			{
				Connection cn=GetDB.getCn();
				PreparedStatement ps=cn.prepareStatement(sql);
				ps.setString(1, email);
				ps.setString(2, pass);
				ResultSet rs=ps.executeQuery();
				if(rs.next())
				{
					cart=rs.getString(12);
					n=Integer.parseInt(rs.getString(13));
				}
				if(cart==null || cart.equals(""))
					cart=pid;
				else
					cart=cart+" "+pid;
				n=n+1;
				sql="update userinfo set cart=? , noofitem=? where email=? and password=?";
				PreparedStatement ps1=cn.prepareStatement(sql);
				ps1.setString(1,cart);
				ps1.setString(2, ""+n);
				ps1.setString(3, email);
				ps1.setString(4, pass);
				if(ps1.executeUpdate()>0)
				{
					session.setAttribute("cart", cart);
					response.sendRedirect("cart.jsp");
				}
				else
				{
					PrintWriter pw=response.getWriter();
					pw.println("Database problem occured");
				}
				
			}
			catch(Exception e)
			{
				System.out.println("Database problem occured");
				System.out.println(e);
			}
		}
		else
		{
			response.sendRedirect("login.jsp");
		}
	}

}
