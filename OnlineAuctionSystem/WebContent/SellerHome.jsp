<%@page import="javax.print.attribute.standard.Severity"%>
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
<title>Seller Home Page</title>
</head>
<body>
<%@ include file="NavBarSeller.jsp" %> 


	<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
        url = "jdbc:mysql://localhost:3306/auction"
        user = "root"  password = "rootuser"
	/>
 
	<sql:query dataSource = "${snapshot}" var = "result">
	select * from bids where Id=(select id from item where sellerid=(select ID from seller where USERNAME='<c:out value='${sessionScope["username"]}'/>'))
    
    </sql:query>
    <sql:query dataSource = "${snapshot}" var = "rt">
	select id from item where sellerid=(select ID from seller where USERNAME='<c:out value='${sessionScope["username"]}'/>')
    
    </sql:query>
   
 <c:choose>
 <c:when test="${rt.rowCount >0 }">
 <table border = "1" width = "70%">
 <tr>
 <th colspan="6">
 <sql:query dataSource = "${snapshot}" var = "itemname">
	select itemname from item where sellerid=(select ID from seller where USERNAME='<c:out value='${sessionScope["username"]}'/>')
    
  </sql:query>
<c:forEach var = "rows" items = "${itemname.rows}">
 <c:out value="${rows.itemname}">
  </c:out> </c:forEach>
 </th></tr>
        <tr>
        <th>ID</th>
        <th>Auction Price</th>
        <th>Email</th>
        <th>BidderName</th>
        <th>Address</th>
         <th>Phone</th>
        </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
            <td><c:out value = "${row.Id}"/></td>
            <td><c:out value = "${row.Auctionprice}"/></td>
            <td><c:out value = "${row.email}"/></td>
            <td><c:out value = "${row.Biddername}"/></td>
             <td><c:out value = "${row.address}"/></td>
             <td><c:out value = "${row.phone}"/></td>
            </tr>
        </c:forEach>
         <tr ><td colspan="10"></td>
         </tr>
          </table>
          <br><br><form action="closebid.jsp"><button>Close bid</button>
       </c:when>
       
       <c:otherwise>
        <form action="addItem.jsp" ><button>Sell Item</button></form>
       </c:otherwise>
       
        
    
 </c:choose>
    

</body>
</html>