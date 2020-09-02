<%@ include file="cheader.jsp"%>
<%@ page  import="java.sql.*" import="databaseconnection.*"%>


<%                                                       String message=request.getParameter("id");
                                                       if(message!=null && message.equalsIgnoreCase("succ"))
                                                       {
											                out.println("<script type=text/javascript>alert('Update Done..'); </script>  ");
                                                       }
                                               %>

<br><br><br>
<center>
<h1><font size="" color="#eb6705">SecureCloud Data's..</font></h1>
<br><br>
<%
Connection con=databasecon.getconnection();
Statement st1 = con.createStatement();
String sss1 = "select *from cloud where stats='SecCloud1' ";
ResultSet rs=st1.executeQuery(sss1);
%>
<table cellspacing="20">
<tr><td><h2><font size="" color="#eb6705">File ID</h2><td><h2><font size="" color="#eb6705">File Name</h2><td><h2><font size="" color="#eb6705">File Blocks</h2></tr>
<%
while(rs.next())
{
%>
            <tr bgcolor="#eb6705"> <td><h3><%=rs.getString(2)%></a></h3></td><td><h3><%=rs.getString(3)%></a></h3></td><td><h3><a href="cdata3.jsp?id=<%=rs.getString(2)%>">View</td>

<%
}
	%>
</table>
</h3>
</form>


<br><br><br><br><br><br>
<%@ include file="footer.jsp"%>