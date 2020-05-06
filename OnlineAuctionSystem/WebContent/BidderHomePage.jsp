<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bidder Home Page</title>
</head>
<body><%@ include file="NavBar.jsp" %>


<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/auction"
         user = "root"  password = "rootuser"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from item;
      </sql:query>
 
      <table border = "1" width = "50%" align="center">
         <tr>
            <th>Product ID</th>
            <th>Item Name</th>
            <th>Seller Name</th>
            <th>MinPrice</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.id}"/></td>
               <td><c:out value = "${row.itemname}"/></td>
               <td><c:out value = "${row.sellerid}"/></td>
               <td><c:out value = "${row.MinPrice}"/></td>
               <td><form action='BidderDetails.jsp'><input type='hidden' value='<c:out value = "${row.id}"/>' name='ProductId'><button id='<c:out value = "${row.id}"/>' name='<c:out value = "${row.id}"/>'>Bid</button></form>
             </tr>
         </c:forEach>
      </table>
 

</body>
</html>