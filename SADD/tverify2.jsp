<%@include file="aheader.jsp"%>
<%@ page  import="java.sql.*" import="databaseconnection.*"%>

<script type="text/javascript">  


//alert('Request Sent to TPA');  

</script>
<%
String fid=request.getParameter("id");
String cid=request.getParameter("cid");
%>
<br><br>
<center><h3>Data Auditing of File id: <%=fid%></h1><br></center>
<table width="50%" align="center">
<tr><td>
<table>
<%								


Connection con=databasecon.getconnection();
Statement st1 = con.createStatement();
Statement st2 = con.createStatement();
String sss1 = "select * from auditor where fileid='"+fid+"' ";

String sss2 = "select * from cloud where fileid='"+fid+"' ";


int i=1;
ResultSet rs=st1.executeQuery(sss1);%>
<form method="post" action="tverify3.jsp">
<%while(rs.next())
{
	
				%>
<tr >
<td><font size="5"></font></td>
<td><font size="5"></font></td>
<td><font size="5">Auditor</td>
</tr>
		<tr >
<td><font size="5">Block ( B1) </font></td>
<td><font size="5">:</font></td>
<td><textarea name="block1" cols="25" rows="2"><%=rs.getString("block1")%></textarea></td>
</tr>
<tr><td>&nbsp;<br></td></tr>
<tr>
<td><font size="5">Block (B2)</font></td>
<td><font size="5">:</font></td>
<td><textarea name="block2" cols="25" rows="2"><%=rs.getString("block2")%></textarea></td>
</tr>
<tr><td>&nbsp;<br></td></tr>
<tr>
<td><font size="5">Block (B3)</font></td>
<td><font size="5">:</font></td>
<td><textarea name="block3" cols="25" rows="2"><%=rs.getString("block3")%></textarea></td>
</tr>
<tr><td>&nbsp;<br></td></tr>

<%
}
%>
</table>
<td>
<table>
<%
int ii=1;
ResultSet rs2=st1.executeQuery(sss2);
while(rs2.next())
{
	
				%>
<tr >
<td><font size="5">CloudServer</td>
</tr>
		<tr>
<td><textarea name="block11" cols="25" rows="2"><%=rs2.getString("block1")%></textarea></td>
</tr>
<tr><td>&nbsp;<br><br><br></td></tr>
<tr>
<td><textarea name="block22" cols="25" rows="2"><%=rs2.getString("block2")%></textarea></td>
</tr>
<tr><td>&nbsp;<br><br></td></tr>
<tr>

<td><textarea name="block33" cols="25" rows="2"><%=rs2.getString("block3")%></textarea></td>
</tr>
<tr><td>&nbsp;<br></td></tr>

<%
}
%>
</table></table>	

<center>
	<input type="hidden" name="cid" value="<%=cid%>">
	<input type="hidden" name="id" value="<%=fid%>">
	<input type="submit" value="Verify">
</form></center>

<br><br><br>

            <%@include file="footer.jsp"%> 