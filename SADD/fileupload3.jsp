<%@page import="databaseconnection.*,java.sql.*,DSA.*,java.io.*, java.security.*,java.security.spec.*,Hash.*"%>
<%@include file="aheader.jsp"%>
<br><br>
<%!
Connection con;
Statement stmt,stmt1,stmt2;
ResultSet rs,rs1,rs2;
String fileid,uploadfile,email;
int count;
String hash;String pk;
%>
<%
String fileid = request.getParameter("fileid");
String fname = request.getParameter("fname");
String block1 = request.getParameter("block1");
String block2 = request.getParameter("block2");
String block3 = request.getParameter("block3");

String unm=(String)session.getAttribute("unm");
con = databasecon.getconnection();
Statement st=con.createStatement();

Statement sttt=con.createStatement();
ResultSet rrr=sttt.executeQuery("select pubkey1 from clients where username='"+unm+"'");
if(rrr.next()){
pk=rrr.getString(1);
}


 hash =(String)session.getAttribute("hash");

System.out.println("sha="+hash);
PreparedStatement p=con.prepareStatement("insert into cloud(fileid,filename,filehash,block1,block2,block3,clientid,stats) values(?,?,AES_ENCRYPT(?,'"+hash+"'),AES_ENCRYPT(?,'"+pk+"'),AES_ENCRYPT(?,'"+pk+"'),AES_ENCRYPT(?,'"+pk+"'),?,'SecCloud1')");
p.setString(1,fileid);
p.setString(2,fname);
p.setString(3,hash);
p.setString(4,block1);
p.setString(5,block2);
p.setString(6,block3);
p.setString(7,unm);
int i =p.executeUpdate();
if(i>0){
PreparedStatement p1=con.prepareStatement("insert into auditor(fileid,filename,filehash,block1,block2,block3,clientid) values(?,?,AES_ENCRYPT(?,'"+hash+"'),AES_ENCRYPT(?,'"+pk+"'),AES_ENCRYPT(?,'"+pk+"'),AES_ENCRYPT(?,'"+pk+"'),?)");
p1.setString(1,fileid);
p1.setString(2,fname);
p1.setString(3,hash);
p1.setString(4,block1);
p1.setString(5,block2);
p1.setString(6,block3);
p1.setString(7,unm);
int i1 =p1.executeUpdate();
if(i1>0){

Statement stt=con.createStatement();Statement stt1=con.createStatement();
ResultSet rst=stt.executeQuery("select block1,block2,block3 from cloud where fileid='"+fileid+"'"); 
if(rst.next()){
stt1.executeUpdate("delete from requesttoauditor where filename='"+fname+"'");
%>
<div align="center">
<form action="viewrequest.jsp?msg1=suc" method="post">
<table>
<tr><td colspan="3"><font size="6" color="orange"><b><u>EncryptedData</u></b></font></td></tr>
<tr><td>&nbsp;<br></td></tr>
<tr>
<td><font size="5">File Id</font></td>
<td><font size="5">:</font></td>
<td><input type="text" name="fileid" value="<%=fileid%>"  readonly/></td>
</tr>
<tr><td>&nbsp;<br></td></tr>
<tr>
<td><font size="5">File Name</font></td>
<td><font size="5">:</font></td>
<td><input type="text" name="fname" value="<%=fname%>"  readonly/></td>
</tr>
<tr><td>&nbsp;<br></td></tr>
<tr>
<td><font size="5">Block1 </font></td>
<td><font size="5">:</font></td>
<td><textarea name="block1" cols="25" rows="2"><%=rst.getString(1)%></textarea></td>
</tr>
<tr><td>&nbsp;<br></td></tr>
<tr>
<td><font size="5">Block2 </font></td>
<td><font size="5">:</font></td>
<td><textarea name="block2" cols="25" rows="2"><%=rst.getString(2)%></textarea></td>
</tr>
<tr><td>&nbsp;<br></td></tr>
<tr>
<td><font size="5">Block3 </font></td>
<td><font size="5">:</font></td>
<td><textarea name="block3" cols="25" rows="2"><%=rst.getString(3)%></textarea></td>
</tr>
<tr><td>&nbsp;<br></td></tr>
<tr>
<tr><td>&nbsp;<br></td></tr>
<td></td><td></td>
<td align="left"><input type="submit" value="UPLOAD"></td>
</tr>
</table>
</form>
<%}}}%>
	</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 <%@include file="footer.jsp"%>