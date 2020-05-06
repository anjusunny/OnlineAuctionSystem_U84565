<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create a Seller Account</title>
</head>
<body>
<%@ include file="NavBarSeller.jsp" %>
<form action="AddSellerDao.jsp" method="post">
<%

%>
<label>SellerName :  </label><input name ="sellername" placeholder="Enter your name" required="required"><br><br>
<label>User name :   </label><input name ="username" placeholder="set username" required="required"><br><br>
<label>Password : 	 </label><input type="password" name ="password" placeholder="set password" required="required"> <br><br>

<br><button type="submit" id="Add">Add</button><br>
</body>
</html>