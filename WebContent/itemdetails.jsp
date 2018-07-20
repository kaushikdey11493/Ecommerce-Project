<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
.ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #E2FDFF

}

.li {
    float: left;
    font-weight:bold;
    color:black;
}

.li a {
    display: block;
    color: white;
    text-align: center;
    padding: 25px;
    text-decoration: none;
}

.li a:hover {
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


img{
	width: 35%;
	margin: 5%;
	float:left;
}

h1{
	font-size:35px;
	font-weight:bold;
	color:#159BF7;
}

.detail{
	font-size:20px;
	font-weight:bold;
	
}

p{
	margin:5%;
}

pre{
	font-size:30px;
	font-weight:bold;
	
}
input[type='button']{
	border:none;
	background:#FF8920;
	color:white;
	font-weight:bold;
	height:50px;
	width:250px;
	border-radius:5px;
	position: absolute;
	right: 150px;
	margin:100px;
	font-size:18px;
}

input[type='button']:hover{
	border:none;
	box-shadow:5px 5px 2px #D7F2F0;
	cursor:pointer;
	
}
</style>

</head>
<body>

	<div class='welcome'>
		Welcome To E-Commerce Website
		<br><br>
	</div>
	<ul class='ul'>
  		<li class='li'><a href="home.jsp" style="color:black">Home</a></li>
  		<li class='li'><a href="electronics.jsp" style="color:black">Electronics & Appliances</a></li>
  		<li class='li'><a href="men.jsp" style="color:black">Men</a></li>
  		<li class='li'><a href="women.jsp" style="color:black">Women</a></li>
  		<li class='li'><a href="furniture.jsp" style="color:black">Home & Furniture</a></li>
  		<li class='li'><a href="#Men" style="color:black">Sports</a></li>
  		<li class='li'><a href="#Men" style="color:black">Books</a></li>
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
      			<li  class='li' style="float:right;"><a href="cart.jsp" style="color:red">Cart</a></li>
  				<li  class='li' style="float:right;"><a href="userdetails.jsp" style="color:black;">Hello <%=name %></a></li>
      	<%	
      		}	
			if(f==0)
			{
		%>
				<li  class='li' style="float:right;"><a href="login.jsp" style="color:red">Cart</a></li>
  				<li  class='li' style="float:right;"><a href="login.jsp" style="color:black;">Login & Signup</a></li>
		<%
			}
		%>
  	</ul>
<%
	String id=request.getParameter("id");
	String productname=request.getParameter("productname");
	String price=request.getParameter("price");
	String details[]=request.getParameter("details").split("@");
	String src=request.getParameter("src");
%>
<form name='frm'>
<img alt="image" src="<%=src %>">
<!--  <div style="float:right;margin-right:150px;"> -->
<h1><br><%=productname %></h1>
<p>
	<div style="float:right;margin-right:150px;">
	<ul>
	<%
	for(String s : details)
	{
	%>
	<li class="detail"><%=s %></li>
	<%
	}
	%>
	</ul>
	<br>
	<pre>Price : Rs <%=price %></pre>
	<a href="AddToCart?id=<%=id%>"><input type="button" value="ADD ITEM TO CART"></a>
	</div>
</p>
</form>
</body>
</html>