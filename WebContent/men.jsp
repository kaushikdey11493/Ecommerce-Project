<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online shopping</title>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #E2FDFF;
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


div.gallery {
    margin: 15px;
    border: none;
    float: left;
    width: 17%;
    margin-bottom:50px;
    margin-left:5%;
   
}

div.gallery:hover {
    box-shadow: 10px 10px 5px #D9E9EA;
}

div.gallery img {
    width: 100%;
    height: 300px;
}

div.desc {
    padding: 15px;
    text-align: center;
    color:#076B8E;
    font-weight:bold;
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
    text-decoration:none;
}
</style>
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
	<div class="gallery">
  		<a href="products2.jsp?category=men-jeans">
    		<img src="Image/men/jeans.jpeg" alt="Jeans" >
  			<div class="desc">Jeans</div>
  		</a>
	</div>
	<div class="gallery">
  		<a href="products2.jsp?category=men-jacket">
    		<img src="Image/men/jacket.jpeg" alt="Jacket" >
  			<div class="desc">Jacket</div>
  		</a>
	</div>
	<div class="gallery">
  		<a target="_blank" href="img_5terre.jpg">
    		<img src="Image/men/tshirt.jpeg" alt="T-Shirts" >
  			<div class="desc">T-Shirts</div>
  		</a>
	</div>
	<div class="gallery">
  		<a target="_blank" href="img_5terre.jpg">
    		<img src="Image/men/shirt.jpeg" alt="Shirts" >
  			<div class="desc">Shirts</div>
  		</a>
	</div>
	<div class="gallery">
  		<a target="_blank" href="img_5terre.jpg">
    		<img src="Image/men/trimmer.jpeg" alt="Trimmers" >
  			<div class="desc">Trimmers</div>
  		</a>
	</div>
</body>
</html>