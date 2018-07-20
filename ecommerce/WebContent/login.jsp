<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

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
	width:400px;
	height:600px;
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
	padding:20px;
	font-weight:bold;
	font-size:24px;
	background:#FF7000;
	width:90%;
	font-family: sans-serif;
	
}
.inputbox input[type='email'],input[type='password']{
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
input[type='button']:hover{
	background: #FFBA27;
	cursor:pointer;
	outline-style: none;
}
</style>


<script type="text/javascript">
function check()
{
	var email=document.getElementById('email').value;
	var pass=document.getElementById('pass').value;
	if(email=='' || pass=='')
		alert("Fill up the form correctly");
	else
	{
		document.frm.action="login";
		document.frm.method="post"
		document.frm.submit();
	}
}
</script>

</head>

<body>
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
				response.sendRedirect("home.jsp");
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
	<br><br>
	
	
	<form name="frm">
	<div class="inputbox">
		<h1>Login</h1>
		<%
			if(session.getAttribute("error")!=null)
			{
		%>
		<p style="color:#FF7D23">*** Wrong email or password ***</p>
		<%
				session.removeAttribute("error");
			}
		%>
		<p>Enter Email : </p>
		<input type="email" name="email" id="email" placeholder="Enter email" autofocus  autocomplete='off'>
		<br><br>
		<p>Enter Password : </p>
		<input type="password" name="pass" id="pass" placeholder="Enter password">
		<br><br><br>
		<input type='button' value='Login' onclick="check()">
		<br><br><br>
		<a href='#'>Forgot your Password ?</a>
		<br><br>
		<a href='register.jsp'>Don't have an account ? Sign up</a>
	</div>
	</form>
</body>
</html>