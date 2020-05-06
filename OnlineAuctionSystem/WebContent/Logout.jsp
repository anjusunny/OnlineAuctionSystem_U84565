<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
HttpSession sessiona=request.getSession();
sessiona.invalidate();
response.sendRedirect("/OnlineAuctionSystem/SellerLogin.html");

%>
</body>
</html>