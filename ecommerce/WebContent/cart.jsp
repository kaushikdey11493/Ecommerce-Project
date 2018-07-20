<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #E2FDFF

}

li {
    float: left;
    font-weight:bold;
    color:black;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 25px;
    text-decoration: none;
}

li a:hover {
    background-color: #23DCEC;
}

div.welcome {
	color:white;
	background-color:#116BFF;
	font-weight:bold;
	text-align:center;
	font-size:24px;
	padding:25px;
	margin:25px 0px;
}
</style>


</head>
<body>
<%@page import="getdb.*,java.sql.*" %>
<div class='welcome'>
		Welcome To E-Commerce Website
		<br><br>
	</div>
	<ul>
  		<li><a href="home.jsp" style="color:black">Home</a></li>
  		<li><a href="electronics.jsp" style="color:black">Electronics & Appliances</a></li>
  		<li><a href="men.jsp" style="color:black">Men</a></li>
  		<li><a href="women.jsp" style="color:black">Women</a></li>
  		<li><a href="furniture.jsp" style="color:black">Home & Furniture</a></li>
  		<li><a href="#Men" style="color:black">Sports</a></li>
  		<li><a href="#Men" style="color:black">Books</a></li>
  		<%
			Cookie cookie = null;
			Cookie[] cookies = null;
			int f=0;
			String name="",email="",pass="";
			cookies = request.getCookies();

			if(session.getAttribute("email")==null)
			{
				if( cookies != null ) 
				{
  					for (int i = 0; i < cookies.length; i++) 
  					{
      					cookie = cookies[i];
      					if(cookie.getName().equals("ecommerce_name+email+pasword"))
      					{
      						String s=cookie.getValue();
      						String s1[]=s.split("\\+");
      						name=s1[0];
      						email=s1[1];
      						pass=s1[2];
      						session.setAttribute("name",name);
      						session.setAttribute("email",email);
      						session.setAttribute("pass",pass);
      						f=1;
      						System.out.println("Cookie is used");
      						
          					break;
          				}
       				}
    			}
			}
			else
			{
				name=(String)session.getAttribute("name");
				System.out.println("Session is used");
				f=1;
			}
			if(f==1)
			{
      	%>
      					<li style="float:right;"><a href="cart.jsp" style="color:red">Cart</a></li>
  						<li style="float:right;"><a href="userdetails.jsp" style="color:black;">Hello <%=name %></a></li>
      	<%	
      		}	
			if(f==0)
			{
				response.sendRedirect("login.jsp");
		%>
				<li style="float:right;"><a href="login.jsp" style="color:red">Cart</a></li>
  				<li style="float:right;"><a href="login.jsp" style="color:black;">Login & Signup</a></li>
		<%
			}
		%>
  	</ul>
  	<br><br>
<a href="orderdetails.jsp" style="text-decoration:none">
<div style="text-align:center;font-weight:bold;font-size:24px;padding:2% 5%;background:#FF5733;color:white;margin:0 20%;cursor:pointer">
	CLICK TO SEE ORDER DETAILS & HISTORY
</div>
</a>
<br><br>
<%
	String cart="";
	String sql="select cart from userinfo where email=? and password=?";
	email=(String)session.getAttribute("email");
	pass=(String)session.getAttribute("pass");
	if(session.getAttribute("cart")!=null)
	{
		cart=(String)session.getAttribute("cart");
	}
	else
	{
		try
		{
			Connection cn=GetDB.getCn();
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				cart=rs.getString(1);
				session.setAttribute("cart", cart);
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	if(cart==null || cart.equals(""))
	{
%>
		<div style="text-align:center;font-weight:bold;font-size:24px">
			NO PRODUCT ADDED SO FAR , OR PLEASE CHECK ORDER DETAILS & HISTORY
		</div>
<%
	}
	else
	{
%>
<br><br>
<div style="text-align:center;font-weight:bold;font-size:24px;">
	DELIVERY WITHIN 5 DAYS FROM ORDER
</div>
<br><br>
<table align="center" style="width:90%;">
	<tr ><th style="border-bottom:2px solid black;font-weight:bold;font-size:20px;padding:10px;color:#FF5733;width:15%">Product id</th><th style="border-bottom:2px solid black;font-weight:bold;font-size:20px;padding:10px;color:#FF5733;width:40%">Product Name</th><th style="border-bottom:2px solid black;font-weight:bold;font-size:20px;padding:20px;color:#FF5733;width:30%">Price</th><th style="padding:10px;width:15%"></th><th style="padding:10px;width:15%"></th></tr>
	<%
		String item[]=cart.split(" ");
		sql="select * from item where id=?";
		try
		{
			Connection cn=GetDB.getCn();
			PreparedStatement ps=cn.prepareStatement(sql);
			for(String s : item)
			{
				ps.setString(1, s);
				ResultSet rs=ps.executeQuery();
				System.out.println(s);
				if(rs.next())
				{
	%>
		<tr><td style="font-weight:bold;font-size:20px;padding:10px;color:#0563B1;width:15%;text-align:center"><%=rs.getString(1) %></td><td style="font-weight:bold;font-size:20px;padding:10px;color:#0563B1;width:40%;text-align:center"><%=rs.getString(2) %></td><td style="font-weight:bold;font-size:20px;padding:20px;color:#0563B1;width:30%;text-align:center">Rs <%=rs.getString(4) %></td><td style="width:15%"><a href="buy?pid=<%=s%>"><input type="button" value="BUY" style="font-weight:bold;font-size:20px;color:#FFF;border:none;padding:10px;background:#46D515;width:150px;cursor:pointer"></a></td><td style="width:15%"><a href="removeFromCart?pid=<%=s %>"><input type="button" value="REMOVE" style="font-weight:bold;font-size:20px;color:#FFF;border:none;background:#FA7D1B;padding:10px;width:150px;cursor:pointer"></a></td></tr>
	<%
				}
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
	%>
				
</table>
	
</body>
</html>