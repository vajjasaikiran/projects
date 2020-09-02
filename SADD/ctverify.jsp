<%@ page  import="java.sql.*" import="databaseconnection.*" %>
<%@ include file="ccheader.jsp"%>
<%
                                                       String message=request.getParameter("id");
                                                       if(message!=null && message.equalsIgnoreCase("succ"))
                                                       {
                out.println("<script type=text/javascript>alert('Data Replicated..'); </script>															   ");
                                                       }
                                               %>

<br><br>

<center><span class=""><font color="#663300" size="6"><u><b>Integrity Audit</b></u></font></span><br><br></center>

<font size="3" color=""><b>
  <%
int c=0;
  try{


Connection con=databasecon.getconnection();
	Statement st1 = con.createStatement();
	
	String sss1 = "select * from auditor  where clientid='"+uname+"' ";

	ResultSet rs=st1.executeQuery(sss1);
	%>

	<table align="center" cellspacing=20 width="525">
	<tr><td><h1><font color="#ff9900File">File Id</h2><td><h1><font color="#ff9900File">Client</h2><td><h1><font color="#ff9900File">Auditing</h2></tr>
	<%
	while(rs.next())	
	 {%>
	 <tr bgcolor=#999966><td><font size="3" color="white"><h1><%=rs.getString(1)%><td><font size="3" color="white"><h1><%=rs.getString(7)%><td><a href="ctverify2.jsp?id=<%=rs.getString(1)%>&cid=<%=rs.getString(7)%>"><font size="3" color="white"><h1>View</a>
	 <%
	}
  }
  catch(Exception e){
  
  }
  %>

</table>
</font>
  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>
<%@ include file="footer.jsp"%>