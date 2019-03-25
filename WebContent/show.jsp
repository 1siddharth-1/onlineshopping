<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="addcart.jsp">
<%
String name=request.getParameter("name");
String p=request.getParameter("price");
int price=Integer.parseInt(p);
String cat=request.getParameter("cat");
String cmp=request.getParameter("cmp");
%>
<input type="hidden" name="name" value="<%=name %>" />
<input type="hidden" name="price" value="<%=price %>" />
<input type="hidden" name="cat" value="<%=cat %>" />
<input type="hidden" name="cmp" value="<%=cmp %>" />


<table align="center" border="1px">
<tr>
<td><%=name %></td>
<td><%=price %></td>
<td><%=cat %></td>
<td><%=cmp %></td>
<td><a href="https://www.paypal.com/in/signin">BUY NOW</a></td>
<td><input type="submit" value="ADD TO CART"></td>
</tr>


</table>
</form>
</body>
</html>