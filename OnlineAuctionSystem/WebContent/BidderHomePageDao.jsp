<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bidder HomePage Dao </title>
</head>
<body><body><%@ include file="NavBar.jsp" %>
<%

String bname=request.getParameter("biddername");
String bemail=request.getParameter("bidderemail");
String baddress=request.getParameter("bidderAddress");
String bphone=request.getParameter("bidderphone");
String ProductId=request.getParameter("ProductId");
int auctionprice=Integer.parseInt(request.getParameter("auctionprice"));
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auction","root","rootuser");
Statement st= con.createStatement();
Statement minPriceFet=con.createStatement();
ResultSet rss=minPriceFet.executeQuery("select MinPrice from item where  id='"+ProductId+"'");
rss.next();
if( Integer.parseInt(rss.getString("MinPrice"))< auctionprice    ){
int i=st.executeUpdate("insert into bids(email, Biddername, phone, address,Auctionprice,Id)values('"+bemail+"','"+bname+"','"+bphone+"','"+baddress+"','"+auctionprice+"','"+ProductId+"')");
out.print("Congrats!!!  " +bname+ " your bid placed successfully ");
}
else {
	out.print("Please enter a value greater than Minimum price ");
}
%>
</body>
</html>