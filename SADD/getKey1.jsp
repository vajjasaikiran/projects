<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%! String prikey=null,status=null;%>
<%@ include file="ccheader.jsp"%><br><br>

<% Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet i=st.executeQuery("select prikey1 from clients where username='"+uname+"' ");
if(i.next())
{
	prikey=i.getString(1);
}%>
<table align="center" cellpadding="5" cellspacing="12">
<form action="check1.jsp">
<tr><td><strong><h4><i> <p class="blink"><font size="4" color="red">Proof of Ownership Protocol:</font></u></strong></i></h4>
<tr>
	<td><strong><font size="3" color="3300cc">UserID</strong></td><td><input type="text" name="uid" value=<%=uname%> readonly></td>
</tr>

<tr>
	<td><strong><font size="3" color="red">Privilege Key</strong></td><td><input type="text" name="pkey" value=<%=prikey%> ></td></tr>
	<tr>
	<td></td><td><input type="submit" value="Verify"></td>
	</form>
</table><br><br><br><br><br>

<%@ include file="footer.jsp"%>