<%@ include file="cheader.jsp"%>
<%@ page  import="java.sql.*" import="databaseconnection.*"%>


<%                                                       String message=request.getParameter("id");
                                                       if(message!=null && message.equalsIgnoreCase("succ"))
                                                       {
											                out.println("<script type=text/javascript>alert('Update Done..'); </script>  ");
                                                       }
                                               %>


<center>
<h1><font size="" color="#eb6705">SecureCloud Data's..</font></h1>
<br><br>
<%
Connection con=databasecon.getconnection();
Statement st1 = con.createStatement();
String sss1 = "select *from cloud ";
ResultSet rs=st1.executeQuery(sss1);
%>
<table cellspacing="20">
<tr><td><h2><font size="" color="#eb6705">File ID</h2><td><h2><font size="" color="#eb6705">File Name</h2><td><h2><font size="" color="#eb6705">File Blocks</h2></tr>
<%
while(rs.next())
{
%>
            <tr bgcolor="#eb6705"> <td><%=rs.getString(2)%></a></h3></td><td><h3><%=rs.getString(2)%></a></h3></td><td><h3><%=rs.getString(3)%></a></h3></td><td><h3><a href="cdata2.jsp?id=<%=rs.getString(2)%>">View</td>

<%
}
	%>
</table>
</h3>
</form>
* Select File id to open file.


<%@ include file="footer.jsp"%>