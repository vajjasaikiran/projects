<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%! String prikey=null,status=null;%>
<%@ include file="ccheader.jsp"%><br><br>

<% Connection con=databasecon.getconnection();
Statement st=con.createStatement();
	System.out.println("select prikey1 from clients where username='"+uname+"' "); 
ResultSet i=st.executeQuery("select prikey1 from clients where username='"+uname+"' ");
if(i.next())
{
	prikey=i.getString(1);
	System.out.println("----------------"+prikey);
}%>
<table align="center" cellpadding="5" cellspacing="12">
<form action="check.jsp">
<tr><td><strong><h4><i> <p class="blink"><font size="4" color="red">Proof of Ownership Protocol:</font></u></strong></i></h4>
<tr>
	<td><strong><font size="3" color="3300cc">UserID</strong></td><td><input type="text" name="uid" value=<%=uname%> readonly></td>
</tr>

<tr>
	<td><strong><font size="3" color="red">Privilege Key</strong></td><td><textarea name="pkey" rows="" cols=""><%=prikey%></textarea>
	
	<tr>
	<td></td><td><input type="submit" value="Verify"></td>
	</form>
</table><br><br><br><br><br>

<%@ include file="footer.jsp"%>