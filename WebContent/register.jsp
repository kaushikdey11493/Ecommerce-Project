<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>Online shopping</title>
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
	height:1750px;
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
</style>

<script type="text/javascript">
function check()
{
	var email=document.getElementById('email').value;
	var number=document.getElementById('number').value;
	var pass1=document.getElementById('pass1').value;
	var pass2=document.getElementById('pass2').value;
	var name=document.getElementById('name').value;
	var country=document.getElementById('country').value;
	var state=document.getElementById('state').value;
	var city=document.getElementById('city').value;
	var town=document.getElementById('town').value;
	var nearby=document.getElementById('nearby').value;
	if(email=='' || number=='' || pass1=='' || pass2=='' || name=='' || country=='' || state=='' || city=='' || town=='' || nearby=='')
	{
		alert("Fill up the form correctly");
	}
	else if(pass1!=pass2)
	{
		alert("Passwords are not matching");
	}
	else
	{
		document.frm.action="register";
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
		<h1>Signup</h1>
		<br>
		<p>Enter Name : </p>
		<input type="text" name="name" id="name" placeholder="Enter name (compulsory)" autofocus  autocomplete='off'>
		<br><br>
		<p>Enter Email : </p>
		<input type="email" name="email" id="email" placeholder="Enter email (compulsory)" autocomplete='off'>
		<br><br>
		<p>Enter Phone Number : </p>
		<input type="number" id="number" name="number" placeholder="Enter Phone Number (compulsory)" autocomplete='off'>
		<br><br>
		<p>Enter Country : </p>
		<input type="text" id="country" name="country" placeholder="Enter country (compulsory)" autocomplete='off'>
		<br><br>
		<p>Enter State : </p>
		<input type="text" id="state" name="state" placeholder="Enter state (compulsory)" autocomplete='off'>
		<br><br>
		<p>Enter City : </p>
		<input type="text" id="city" name="city" placeholder="Enter city (compulsory)" autocomplete='off'>
		<br><br>
		<p>Enter Town : </p>
		<input type="text" id="town" name="town" placeholder="Enter town (compulsory)" autocomplete='off'>
		<br><br>
		<p>Enter Street name : </p>
		<input type="text" id="street" name="street" placeholder="Enter street name" autocomplete='off'>
		<br><br>
		<p>Enter House number : </p>
		<input type="text" id="housenumber" name="housenumber" placeholder="Enter House number" autocomplete='off'>
		<br><br>
		<p>Enter Nearby : </p>
		<input type="text" id="nearby" name="nearby" placeholder="Enter Nearby (compulsory)" autocomplete='off'>
		<br><br>
		<p>Enter Password : </p>
		<input type="password" id="pass1" name="pass" placeholder="Enter password (compulsory)">
		<br><br>
		<p>Re-Enter Password : </p>
		<input type="password" id="pass2" placeholder="Re-Enter password (compulsory)">
		<br><br><br>
		<input type='button' value='Signup' onclick="check()">
		<br><br><br>
		<a href='login.jsp'>Existing user ? Log in</a>
	</div>
	</form>
</body>
</html>