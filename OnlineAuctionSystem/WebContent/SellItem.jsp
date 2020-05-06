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
<title>Insert title here</title>
</head>
<body><%@ include file="NavBarSeller.jsp" %>

<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
        url = "jdbc:mysql://localhost:3306/auction"
        user = "root"  password = "rootuser"
	/>
 <sql:query dataSource="${snapshot}" var="conditi">
 select * from item where sellerid=(select ID from seller where USERNAME='<c:out value='${sessionScope["username"]}'/>')
 </sql:query>
 <c:choose>
<c:when test="${conditi.rowCount ==0 }"> 
        <sql:update  dataSource="${snapshot}" var="insertItem">
     
        insert into item(itemname,MinPrice,sellerid) values('<c:out value='${param.ItemName}'/>',<c:out value='${param.MinPrice}'/>,(select ID from seller where USERNAME='<c:out value='${sessionScope["username"]}'/>'))
        </sql:update>
    <%
    response.sendRedirect("/OnlineAuctionSystem/SellerHome.jsp");
    %>  
	 </c:when>
	 <c:otherwise>
	 <c:out value="You can only sell one item at a time . Close the bid before trying again "><br><a href="/OnlineAuctionSystem/SellerHome.jsp"">Goto Home</a></c:out>
	 </c:otherwise>
    </c:choose>
</body>
</html>