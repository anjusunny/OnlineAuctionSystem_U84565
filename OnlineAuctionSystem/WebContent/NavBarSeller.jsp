<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>


<body><style>

table {
  background-color: #ffddcc;
}
a{
  text-decoration: none;
  
  /*below I changed the color*/
  color: black;
  /*I added some padding*/
  padding: 2vw;
  /*also changed the font family but that's totally irrelevant*/
  font-family:"Bauhaus 93"
}
a:hover { background: #666; color: #FFF; } 
</style>
<table width="100%" >
<tr><td align="left"  width=20% style='font-size:16.0pt;mso-bidi-font-size:11.0pt;
line-height:115%;font-family:"Bauhaus 93"'>Online Auction System</td><td  width="20%">	
<a href="BidderHomePage.jsp"> Bidder </a> &nbsp;&nbsp;&nbsp;
</td><td><a href="SellerLogin.html"> Seller </a>
</td><td align ="right" width="15%">
<%
//HttpSession sessionaa=request.getSession();
//if(sessionaa.getAttribute("status").equals("logged"))
//		{
//	out.print("<form action='Logout.jsp'><input type='submit' value='Logout'></form>");
	
	//	}
//else {
	
//} 	
%>
</td>


</tr>
</table>
</body>
</html>