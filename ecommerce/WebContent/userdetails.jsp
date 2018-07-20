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



.inputbox{
	background:black;
	color:white;
	width:500px;
	height:1470px;
	margin:10% 32%;
	text-align:center;
}
.inputbox p{
	font-weight:bold;
	font-family: sans-serif;
	text-align:left;
	margin-left:20px;
	font-size:20px
}

.inputbox h1 {
	padding:40px;
	font-weight:bold;
	font-size:24px;
	background:#FF7000;
	width:84%;
	font-family: sans-serif;
	
}
.inputbox input[type='email'],input[type='password'],input[type='text'],input[type='number']{
	width:90%;
	margin:1%;
	border:none;
	border-bottom:1px solid #FFF;
	background:black;
	font-size:18px;
	color:#fff;
	outline-style: none;
}
input[type='button']{
	width:90%;
	height:50px;
	font-size:18px;
	color:#fff;
	background:#FF2204;
	border:none;
	font-weight:bold;
	outline-style: none;
}

input[type='button']:hover{
	background: #FFBA27;
	cursor:pointer;
	outline-style: none;
}

.inputbox a {
	font-size:18px;
	text-align:left;
	color:#fff;
	text-decoration : none;
	margin:10px;
	outline-style: none;
}
a:hover{
	color:#FF7510;
	outline-style: none;
}

#name,#number,#email:hover{
	cursor: context-menu;
}
</style>

<script type="text/javascript">
function save()
{
	var country=document.getElementById('country').value;
	var state=document.getElementById('state').value;
	var city=document.getElementById('city').value;
	var town=document.getElementById('town').value;
	var nearby=document.getElementById('nearby').value;
	if(country=='' || state=='' || city=='' || town=='' || nearby=='')
	{
		alert("Some of the details is empty");
	}
	else
	{
		document.frm.action="userdetails";
		document.frm.method="post";
		document.frm.submit();
	}
}
function logout()
{
	document.frm.action="logout";
	document.frm.method="post";
	document.frm.submit();
}

</script>

</head>
<body>
<%@page import="getdb.*,java.sql.*"%>
<%

	if(session.getAttribute("email")==null)
		response.sendRedirect("login.jsp");

	String email=(String)session.getAttribute("email");
	String pass=(String)session.getAttribute("pass");
	String id="",name="",country="",state="",city="",town="",street="",housenumber="",nearby="",phone="";
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
			id=rs.getString(1);
			name=rs.getString(2);
			country=rs.getString(5);
			state=rs.getString(6);
			city=rs.getString(7);
			town=rs.getString(8);
			street=rs.getString(9);
			if(street==null)
				street="";
			housenumber=rs.getString(10);
			if(housenumber==null)
				housenumber="";
			nearby=rs.getString(11);
			phone=rs.getString(14);
		}
	}
	catch(Exception e)
	{
		out.println("Database error occured");
		System.out.println(e);
	}
%>
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
			int f=1;
			name="";
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
<form name="frm">
	<div class="inputbox">
		<h1>User Details </h1>
		<%
			if(session.getAttribute("save")!=null)
			{
				String s=(String)session.getAttribute("save");
				if(s.equals("1"))
				{
		%>
					<p style="color:#C8F930">Saved successfully</p>
		<%
				}
				else
				{
		%>
					<p style="color:#FF7D23">*** Unable to save data ***</p>
		<%
				}
				session.removeAttribute("save");
			}
		%>
		<p>Name : </p>
		<input type="text" name="name" id="name" value="<%=name %>" disabled>
		<br><br>
		<p>Email Id: </p>
		<input type="email" name="email" id="email" value="<%=email %>" disabled>
		<br><br>
		<p>Phone Number : </p>
		<input type="number" id="number" name="number" value="<%=phone %>"  disabled>
		<br><br>
		<p>Country : </p>
		<input type="text" id="country" name="country" value="<%=country %>" autocomplete='off'>
		<br><br>
		<p>State : </p>
		<input type="text" id="state" name="state" value="<%=state %>" autocomplete='off'>
		<br><br>
		<p>City : </p>
		<input type="text" id="city" name="city" value="<%=city %>" autocomplete='off'>
		<br><br>
		<p>Town : </p>
		<input type="text" id="town" name="town" value="<%=town %>" autocomplete='off'>
		<br><br>
		<p>Street name : </p>
		<input type="text" id="street" name="street" value="<%=street %>" autocomplete='off'>
		<br><br>
		<p>Enter House number : </p>
		<input type="text" id="housenumber" name="housenumber" value="<%=housenumber %>" autocomplete='off'>
		<br><br>
		<p>Enter Nearby : </p>
		<input type="text" id="nearby" name="nearby" value="<%=nearby %>" autocomplete='off'>
		<br><br>
		<input type='button' value='Save Details' onclick="save()">
		<br><br>
		<input type='button' value='Log out' onclick="logout()">
	</div>
	</form>
</body>
</html>