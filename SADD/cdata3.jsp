     <%@include file="cheader.jsp"%>
<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%
String fid=request.getParameter("id");
%>

	<br><br><br>

<center>
<h2><font size="" color="#eb6705">Updating Data of File Id  <%=fid%>..</font></h1>
<br><br>
	<table cellspacing="5" cellpadding="5">
<%								


Connection con=databasecon.getconnection();
Statement st1 = con.createStatement();

	String sss1 = "select *from cloud where fileid='"+fid+"' ";

	ResultSet rs=st1.executeQuery(sss1);
	int i=1;
while(rs.next())
{
%>
<form method="post" action="cdata4.jsp">
		<tr>
		<td><h3><font size="" color="#eb6705">File Block1 </h3></td>
		<td><textarea name="b1" rows="3" cols="50" ><%=rs.getString(5)%></textarea></td>
		</tr>
		<tr>
		<td><h3><font size="" color="#eb6705">File Block2 </h3></td>
		<td><textarea name="b2" rows="3" cols="50" ><%=rs.getString(6)%></textarea></td>
		</tr>
		<tr>
		<td><h3><font size="" color="#eb6705">File Block3 </h3></td>
		<td><textarea name="b3" rows="3" cols="50" ><%=rs.getString(7)%></textarea></td>
		</tr>
		<%}%>

		<tr><td><input type="hidden" name="fid" value="<%=fid%>"></td>
		<td><input type="submit" value="Update"></td>
</tr>
</form>
</table>
<br><br><br><br><br>
<%@include file="footer.jsp"%> 