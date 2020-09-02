<%@include file="aheader.jsp"%>
<%
String msg1 = request.getParameter("msg1");
if(msg1 != null){
out.println("<script>alert('Registration Unsuccessfull Please login..!')</script>");
}
%>
<!-- about -->
<%@page import="databaseconnection.*,java.sql.*,java.io.*,Hash.*"%>
<%!
Connection con;
Statement stmt,stmt1,stmt2;
ResultSet rs,rs1,rs2;
String fileid,uploadfile,email;
int count;
%>
<%
con =databasecon.getconnection();
stmt = con.createStatement();
stmt2 = con.createStatement();
String fnm=request.getParameter("fnm");
session.setAttribute("unm",request.getParameter("unm"));
rs = stmt.executeQuery("select *from requesttoauditor where  filename='"+fnm+"' ");
//rs2 = stmt2.executeQuery("select * from requesttoauditor where clientid='"+uname+"' and filedata='"+sb1+"' ");
if(rs.next()){
	System.out.println("ss="+rs.getString(4));
	session.setAttribute("hash",rs.getString(5));
%>
	<div class="forms" align="center">
<%
if(rs.getString(4).trim().equals("SecCloud")){System.out.println("ss1="+rs.getString(4));
	%> 
					<form action="blocks.jsp" method="post">
					<table>
					<tr><td><font color="orange" size="6"><b><u>File Details:</u></b></font></td></tr>
					<tr><td><br></td></tr>
					<tr><td><font color="gray" size="5"><b>FileName:</b></font></td></tr>
					<tr><td><input type="text" name="fname" value=<%=rs.getString(1)%> required=""></td></tr>
					<tr><td><br><font color="gray" size="5"><b>FileData:</b></font></td></tr>
					<tr><td><textarea name="data" rows="5" cols="23"><%=rs.getString(2)%></textarea></td></tr>
					
					<tr><td><input type="submit" value="File-Blocks">&nbsp;&nbsp;&nbsp;</tr>
					</table>
					</form>
					<%}
					else{%>
					<form action="fileupload11.jsp" method="post">
					<table>
					<tr><td><font color="orange" size="6"><b><u>File Details:</u></b></font></td></tr>
					<tr><td><br></td></tr>
					<tr><td><font color="gray" size="5"><b>FileName:</b></font></td></tr>
					<tr><td><input type="text" name="fname" value=<%=rs.getString(1)%> required=""></td></tr>
					<tr><td><font color="gray" size="5"><b>FileData:</b></font></td></tr>
					<tr><td><textarea name="data" rows="5" cols="23"><%=rs.getString(2)%></textarea></td></tr>
					<tr><td><input type="submit" value="File-Blocks">&nbsp;&nbsp;&nbsp;</tr>
					</table>
					</form>
						<%}%>

					</div><br><br><br><br><br><br><br>
		
<!-- about -->
<%}%>
<%@include file="footer.jsp"%>