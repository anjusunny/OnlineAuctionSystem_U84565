<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LoginDao</title>
</head>
<body>
<%

String name=request.getParameter("username");
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auction","root","rootuser");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from Seller where USERNAME='"+name+"' and PASSWORD='"+password+"'");
try
{
	rs.next();
	if(rs.getString("USERNAME").equals(name)&&rs.getString("PASSWORD").equals(password))
	{
		HttpSession sessiona=request.getSession();
		sessiona.setAttribute("username", name);      //set attribute in session
		sessiona.setAttribute("status", "logged");
		response.sendRedirect("/OnlineAuctionSystem/SellerHome.jsp");
	}
	else
	{
		
		response.sendRedirect("/OnlineAuctionSystem/SellerLogin.html");
	}
}
catch (Exception e) 
{
	e.printStackTrace();
}
%>
</body>
</html>