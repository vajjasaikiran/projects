<%@page import="databaseconnection.*,java.sql.*,java.io.*"%>
<%@include file="aheader.jsp"%>
<br><br>
<%!
Connection con;
Statement stmt,stmt1,stmt2;
ResultSet rs,rs1,rs2;
String fileid,uploadfile,email,pk;
byte[] pubkey=null;
int count;
%>
<%
String filename = request.getParameter("fname");
String block1 = request.getParameter("block1");
String block2 = request.getParameter("block2");
String block3 = request.getParameter("block3");
String unm=(String)session.getAttribute("unm");
con = databasecon.getconnection();
stmt = con.createStatement();stmt1 = con.createStatement();
rs=stmt.executeQuery("select  pubkey1 from clients where username='"+unm+"'");
if(rs.next()){
pk=rs.getString(1);
}
rs1 = stmt1.executeQuery("select max(sno) from cloud");
if(rs1.next()){
count = rs1.getInt(1);
count = count+1;
fileid="file00"+count;
}
%>
<div align="center">
<form action="fileupload3.jsp" method="post">
<table>
<tr><td colspan="3"><font size="6" color="orange"><b><u>File Upload</u></b></font></td></tr>
<tr><td><br></td></tr>
<tr>
<td><font size="5">File Id</font></td>
<td><font size="5">:</font></td>
<td><input type="text" name="fileid" value="<%=fileid%>"  readonly/></td>
</tr>
<tr>
<td><font size="5">File Name</font></td>
<td><font size="5">:</font></td>
<td><input type="text" name="fname" value="<%=filename%>"  readonly/></td>
</tr>
<tr><td>&nbsp;<br></td></tr>
<tr><td>&nbsp;<br></td></tr>
<tr>
<td><font size="5">Block1</font></td>
<td><font size="5">:</font></td>
<td><textarea name="block1" cols="25" rows="2"><%=block1%></textarea></td>
</tr>
<tr><td>&nbsp;<br></td></tr>
<tr>
<td><font size="5">Block2</font></td>
<td><font size="5">:</font></td>
<td><textarea name="block2" cols="25" rows="2"><%=block2%></textarea></td>
</tr>
<tr><td>&nbsp;<br></td></tr>
<tr>
<td><font size="5">Block3</font></td>
<td><font size="5">:</font></td>
<td><textarea name="block3" cols="25" rows="2"><%=block3%></textarea></td>
</tr>
<tr><td>&nbsp;<br></td></tr>
<tr>
<td><font size="5">Client PublicKey</font></td>
<td><font size="5">:</font></td>
<td><textarea name="sk" cols="25" rows="2"><%=pk%></textarea></td>
</tr>
<tr><td>&nbsp;<br></td></tr>
<tr>
<td></td>
<td></td>
<td><input type="submit" value="Encrypt"></td>
</tr>
</table>
</form>
	</div>
<br><br><br><br><br><br><br><br><br><br><br>
 <%@include file="footer.jsp"%>