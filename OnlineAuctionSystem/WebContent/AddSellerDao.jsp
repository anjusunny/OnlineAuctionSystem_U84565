<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ include file="NavBarSeller.jsp" %>
<%

String sname=request.getParameter("sellername");
String uname=request.getParameter("username");
String pwd=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auction","root","rootuser");
Statement st= con.createStatement();
int i=st.executeUpdate("insert into seller(SELLERNAME, USERNAME, PASSWORD)values('"+sname+"','"+uname+"','"+pwd+"')");
try
{
	if(i==1)
	{
		HttpSession sessiona=request.getSession();
		sessiona.setAttribute("username", sname);      //set attribute in session
		sessiona.setAttribute("status", "logged");
		response.sendRedirect("/OnlineAuctionSystem/SellerLogin.html");
	}
	else
	{
		
		response.sendRedirect("/OnlineAuctionSystem/CreateSeller.jsp");
	}
}
catch (Exception e) 
{
	e.printStackTrace();
}

%>
</body>
</html>