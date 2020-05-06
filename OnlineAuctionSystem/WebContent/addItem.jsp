<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Item</title>
</head>
<body><%@ include file="NavBarSeller.jsp" %>
 <%
HttpSession sessiona=request.getSession();
if(sessiona.getAttribute("status").equals("logged"))
		{
	out.print("<form action='Logout.jsp'><input type='submit' value='Logout'></form>");
	
		}
else {response.sendRedirect("/OnlineAuctionSystem/SellerLogin.html");
} 	
%>
<form action="SellItem.jsp" method="post">
        <input type="text" placeholder="Enter Item name" name="ItemName"><br>
         <input type="text" placeholder="Enter Min Price" name="MinPrice"><br>
         <button >Submit</button>
</form>
</body>
</html>