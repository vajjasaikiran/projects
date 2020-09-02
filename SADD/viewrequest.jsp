<%@include file="aheader.jsp"%>
<%@page import="databaseconnection.*,java.sql.*,DSA.*,java.io.*, java.security.*,java.security.spec.*"%>
<%
String msg = request.getParameter("msg1");
if(msg != null){
out.println("<script>alert('File Uploaded into Cloud Successfully ')</script>");
}
%>
<!-- about -->
	<div class="forms" align="center">
				
					<table>
					<tr><td><font color="orange" size="6"><b><u>Requested Files:</u></b></font></td></tr>
					<tr><td><br></td></tr>
					<%!
Connection con;
Statement stmt,stmt1,stmt2;
ResultSet rs,rs1,rs2;
String fileid,uploadfile,email;
int count;
%>

<%
try{
con = databasecon.getconnection();
Statement st=con.createStatement();
ResultSet r=st.executeQuery("select  *from requesttoauditor");%>

<table align="center" cellspacing=20 width="525">
	<tr><td><h2>Filename</h2><td><h2>ClientId</h2><td><h2>FileData</h2><br></tr>
	<%
	while(r.next())	
	 {%>
		<tr bgcolor="#1bcf8b"><td ><font size="3" color="white"><h1><%=r.getString(1)%></td><td ><font size="3" color="white"><h1><%=r.getString(3)%></td><td ><a href="viewReq.jsp?fnm=<%=r.getString(1)%>&unm=<%=r.getString(3)%>"><font size="3" color="white"><h1>View</a></td></tr>
	 <%
	}
  }
  catch(Exception e){
   }
  %>

</table>

		</div><br><br><br><br><br><br><br>
		
<!-- about -->

<%@include file="footer.jsp"%>