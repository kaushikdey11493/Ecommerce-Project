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


a{
	float:left;
	text-decoration:none;
}

div.gallery{
	height:250px;
	width:600px;
	border:1px solid #BBF1F1;
	border-radius:20px;
	margin:25px;
	padding:5px;
	float:left;
}
.gallery:hover{
	box-shadow:10px 10px 5px #D7F2F0;
	cursor: pointer;
}

div.gallery p{
	font-size:18px;
	font-weight:bold;
	color:#159BF7;
	
}
div.gallery img {
    width:340px;
    height:240px;
    float:left;
    
}
</style>


</head>
<body>
	<%@ page import="getdb.*,java.sql.*" %>
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
		%>
				<li style="float:right;"><a href="login.jsp" style="color:red">Cart</a></li>
  				<li style="float:right;"><a href="login.jsp" style="color:black;">Login & Signup</a></li>
		<%
			}
		%>
  	</ul>
	
	<br>
	<%
		String category=request.getParameter("category");
		String sql="select * from item where category=?";
		try
		{
			Connection cn=GetDB.getCn();
		 	PreparedStatement ps=cn.prepareStatement(sql);
		 	ps.setString(1, category);
		 	ResultSet rs=ps.executeQuery();
		 	while(rs.next())
		 	{
		 		String id=rs.getString(1);
		 		String productname=rs.getString(2);
		 		String price=rs.getString(4);
		 		String details=rs.getString(5);
		 		String src=rs.getString(6);
	%>
	<a target='_blank' href="itemdetails.jsp?id=<%=id %>&productname=<%=productname %>&price=<%=price %>&details=<%=details %>&src=<%=src %>" >
	<div class="gallery">
		<img src="<%=src %>">
		<p> <%=productname %></p>
		<br><br>
		<p><pre style="font-size:20px;font-weight:bold;color:#076B8E;">    Rs <%=price %></pre></p>
	</div>
	</a>
	<%
		 	}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	%>
	
	
</body>
</html>