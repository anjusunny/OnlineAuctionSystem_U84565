<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bid Details</title>
</head>
<body>
<body><%@ include file="NavBar.jsp" %>
<form action="BidderHomePageDao.jsp" method="post">
<%

String ProductId=request.getParameter("ProductId");
out.print("<input type='hidden' value='"+ProductId+"' name='ProductId'>");
%>
<label>Name     </label><input name ="biddername" placeholder="Enter your name" required="required"><br><br>
<label>Email    </label><input name ="bidderemail" placeholder="Enter your emailaddress" required="required"><br><br>
<label>Address  </label><input name ="bidderAddress" placeholder="Enter your address"> <br><br>
<label>Phone    </label><input name ="bidderphone" placeholder="Enter your phone"><br><br>
<label>Auction Price     </label><input name ="auctionprice" placeholder="Enter price" required="required"><br>

<button type="submit">Add</button><br>
</body>
</html>