<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%! String token=null,status=null;%>
<%@ include file="ccheader.jsp"%><br><br>
<table align="center" cellpadding="5" cellspacing="12">
<% if(request.getParameter("msg")!=null)
{%>
<center><p class="blink">	<font color="red" size=2 name="times new roman"><b>Not Authenticated Privilege Key	</p></font></center>
<%
}%>
<tr><td><strong><h4><i> <p class="blink"><font size="4" color="red">Proof of Ownership Protocol:</font></u></strong></i></h4>
<tr>
	<td><strong><font size="3" color="3300cc">UserID</strong></td><td><input type="text" name="uid" value=<%=uname%>></td>
</tr>

<tr>
	<td><strong><font size="3" color="red">Privilege Key</strong></td><td><input type="text" name="pkey"></td><td><a href="getKey.jsp?uid=<%=uname%>"><font size="3" color="green"><h4>GetKey</h4></a></td>

</table><br><br><br><br><br>

<%@ include file="footer.jsp"%>