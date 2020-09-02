<%@page import="databaseconnection.*,java.sql.*,DSA.*,java.io.*, java.security.*,java.security.spec.*"%>
<%@include file="ccheader.jsp"%>
<br><br>
<%!
Connection con;
Statement stmt,stmt1,stmt2;
ResultSet rs,rs1,rs2;
String fileid,uploadfile,email;
int count;
%>
<%
String fileid = request.getParameter("fileid");
String fname = request.getParameter("fname");
String block1 = request.getParameter("block1");
String block2 = request.getParameter("block2");
String block3 = request.getParameter("block3");

String filehash = session.getAttribute("hash").toString();


con = databasecon.getconnection();

PreparedStatement p=con.prepareStatement("insert into cloud(fileid,filename,filehash,sigb1,sigb2,sigb3,clientid) values(?,?,?,?,?,?,?)");
p.setString(1,fileid);
p.setString(2,fname);
p.setString(3,filehash);
p.setBytes(4,block1.getBytes());
p.setBytes(5,block2.getBytes());
p.setBytes(6,block3.getBytes());
p.setString(7,uname);
int i =p.executeUpdate();
if(i>0){
response.sendRedirect("fileupload.jsp?msg=suc");
}else{
response.sendRedirect("fileupload.jsp?msg1=fail");
}
%>
