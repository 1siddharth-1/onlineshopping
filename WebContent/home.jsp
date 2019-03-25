<%@ include file="db.jsp" %>
<a href="showcart.jsp">SHOW CART</a>
<%
String qr="select * from product";
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(qr);
while(rs.next())
{
	String name=rs.getString("name");
	int price=rs.getInt("price");
	String cat=rs.getString("cat");
	String cmp=rs.getString("cmp");
%>
<a href="show.jsp?name=<%=name %>&price=<%=price %>&cat=<%=cat %>&cmp=<%=cmp %>"><%=name %></a>
<br>
<%} %>
