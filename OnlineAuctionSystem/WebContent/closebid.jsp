<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Close Bid</title>
</head>
<body><%@ include file="NavBarSeller.jsp" %>
<%
HttpSession sessiona=request.getSession();
if(sessiona.getAttribute("status").equals("logged"))
		{
	out.print("<form action='Logout.jsp'><input type='submit' value='Logout'></form>");
	
		}
else {
	response.sendRedirect("/OnlineAuctionSystem/SellerLogin.html");
} 	
%>
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
        url = "jdbc:mysql://localhost:3306/auction"
        user = "root"  password = "rootuser"
	/>
 
 
<sql:query dataSource = "${snapshot}" var = "result">

     select max(Auctionprice) as Auctionprice,Biddername,email from bids where id=(select id from item where id=(select sellerid from seller where username='<c:out value='${sessionScope["username"]}'/>'))
    </sql:query>
     <c:forEach var = "row" items = "${result.rows}">
          
          <br>
          The winner is   <c:out value = "${row.Biddername}"/><br>
          Amount :<c:out value = "${row.Auctionprice}"/><br>
          Email :<c:out value = "${row.email}"/><br>
        </c:forEach>
        <sql:update  dataSource="${snapshot}" var="del1">
        Delete from bids where Id=(select id from item where sellerid=(select ID from seller where USERNAME='<c:out value='${sessionScope["username"]}'/>'))
        
        </sql:update>
         <sql:update  dataSource="${snapshot}" var="del2">
     Delete from item where sellerid=(select ID from seller where USERNAME='<c:out value='${sessionScope["username"]}'/>')
        
        </sql:update>
        <a href="/OnlineAuctionSystem/SellerHome.jsp">Home</a>
    
</body>
</html>