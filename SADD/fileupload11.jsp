<%@page import="databaseconnection.*,java.sql.*,java.io.*,Hash.*"%>
<%@include file="aheader.jsp"%>
<%!
Connection con;
Statement stmt,stmt1,stmt2;
ResultSet rs,rs1,rs2;
String fileid,uploadfile,email;
int count;
%>

<%!String  thisLine = null;
StringBuffer sb1=null;
String filename=null,unm=null,fid=null,fnm=null;
int i=0;
%>
<%
String fname = request.getParameter("fname");
String filedata = request.getParameter("data");
String unm=(String)session.getAttribute("unm");
//String hash = SHA.SHA_1(filedata,"SHA-1");
//System.out.println("hash============="+hash);
//session.setAttribute("hash",hash);

int len = filedata.length()/3;
String block1 = filedata.substring(len);
String block2 = block1.substring(len);
%>
<br><br><br>
        <div align="center">
<form action="fileupload2.jsp" method="post">
<table>
<tr><td colspan="3"><font size="6" color="orange"><b><u>File Upload</u></b></font></td></tr>
<tr><td><br></td></tr>
<tr>
<td><font size="5">File Name</font></td>
<td><font size="5">:</font></td>
<td><input type="text" name="fname" value="<%=fname%>"  readonly/></td>
</tr>
<tr><td>&nbsp;<br></td></tr>
<tr>
<td><font size="5">Block1</font></td>
<td><font size="5">:</font></td>
<td><textarea name="block1" cols="25" rows="2"><%=filedata.replace(block1,"")%></textarea></td>
</tr>
<tr><td>&nbsp;<br></td></tr>
<tr>
<td><font size="5">Block2</font></td>
<td><font size="5">:</font></td>
<td><textarea name="block2" cols="25" rows="2"><%=block1.replace(block2,"")%></textarea></td>
</tr>
<tr><td>&nbsp;<br></td></tr>
<tr>
<td><font size="5">Block3</font></td>
<td><font size="5">:</font></td>
<td><textarea name="block3" cols="25" rows="2"><%=block2%></textarea></td>
</tr>
<tr><td>&nbsp;<br></td></tr>
<tr>
<td><font size="5">Client  PublicKey</font></td>
<td><font size="5">:</font></td>
<td><input type="text" name="ck" value=" "  readonly/></td></tr>
<!-- <tr>
<td><a href="fileupload2.jsp?filename=<%=fname%>&block1=<%=filedata.replace(block1,"")%>&block2=<%=block1.replace(block2,"")%>&block3=<%=block2%>"><font color="green"><b>Get Client Public key</b></font></a></td>
</tr> -->
<tr>
<td></td>
<td></td>
<td><input type="submit" value="Get Client Public key">&nbsp;&nbsp;&nbsp;</td>
</tr>

</table>
</form>
	</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 <%@include file="footer.jsp"%>
