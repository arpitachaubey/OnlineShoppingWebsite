<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import= "javax.servlet.http.HttpSession"%>
    
       <%
String cookieName = "email";
Cookie cookies [] = request.getCookies ();
Cookie myCookie = null;
if (cookies != null)
{
for (int i = 0; i < cookies.length; i++) 
{
if (cookies [i].getName().equals (cookieName))
{
myCookie = cookies[i];
break;
}
}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<title>Admin_upload</title>
<style>

textarea {
   resize: none;
}
/* NEVIGATION BAR */
body {margin:0;}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
  font-family: Verdana;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
    background-color: #8C5DBF;
    color: white;
}</style>
</head>
<body>
<div align="center" style="background-color: #baa7c8; font-size:4vw; font-family: sans-serif;">
CLOTHING
</div>
<!--  NEVIGATION  -->
<div class="topnav">
  <a href="adminpanel.jsp">Customer database</a>
  <a class="active" href="adminupload.jsp">Upload product</a>
  <a href="adminproductlist.jsp">List of products</a>
  <a href="adminordercontrol.jsp">List of orders</a>
  
</div>
<%
				if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
			%>
			
			<%
				} else {
			%>
			
			<%
				}
			%>
<center>
<h2>
<%
if (myCookie == null) {
%>

You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%
} else {
%> 
<p>Welcome Admin: <%=myCookie.getValue()%></p>
<a href='logout.jsp'>Log out</a>

</h2>
 
   <br/> 
 <form method="post" action="Uploadimg" enctype="multipart/form-data">
            
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Product's Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Product's name</td>
                        <td><input type="text" name="p_name" /></td>
                    </tr>
                    <tr>
                        <td>Product's price</td>
                        <td><input type="text" name="p_price"  /></td>
                    </tr>
                    <tr>
                        <td>Category select</td>
                        <td>
                        <input type="radio" name="c_name" value="bengali">Bengali <br>
                        <input type="radio" name="c_name" value="maharasthra">Maharashtrian<br>
                        <input type="radio" name="c_name" value="punjabi">Punjabi<br>
                        <input type="radio" name="c_name" value="rajasthan">Rajasthani<br>
                        <input type="radio" name="c_name" value="southindia">South Indian</td>
                        
                        
                        
                         </tr>
                         <tr>
                        <td>Product's details</td>
                     
                        <td><textarea name="p_details" rows="4" cols="30"></textarea></td>
                    </tr>
                    
                   
                    <tr>
                    <td>Choose Image</td>
                    <td><input type="file" name="image" required="required"/></td>
                    
                    </tr> 
                    <tr>
                    <td>Size choose: </td>
                    
                    <td>
                    <input type="checkbox" name="small" value="1">Small
                    <input type="checkbox" name="medium" value="1">Medium
                    <input type="checkbox" name="large" value="1">Large
                    <input type="checkbox" name="free" value="1">Free Size<br>
                    <input type="checkbox" name="custom" value="1">CUSTOM
                    </td>
                    	</tr>
                        
                    
                   
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                   
                </tbody>
            </table>
            
        </form>
        <%
}
%>
        </center>
        
    </body>
</html>