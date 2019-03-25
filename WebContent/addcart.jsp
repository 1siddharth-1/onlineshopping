<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String name=request.getParameter("name");
String price=request.getParameter("price");
String cat=request.getParameter("cat");
String cmp=request.getParameter("cmp");
%>
<%@ include file="db.jsp" %>
<%
String qr="insert into cart values(?,?,?,?)";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1,name);
ps.setString(2,price);
ps.setString(3,cat);
ps.setString(4,cmp);
int i=ps.executeUpdate();
if(i>0)
{
	RequestDispatcher rs=request.getRequestDispatcher("home.jsp");
	rs.forward(request,response);
	out.println("item added to cart");
}
else
{
	RequestDispatcher rs=request.getRequestDispatcher("home.jsp");
	rs.forward(request,response);
	out.println("no item in cart");
}
%>
</body>
</html>