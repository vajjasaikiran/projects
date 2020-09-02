<%@page import="databaseconnection.*,java.sql.*,DSA.*,java.io.*, java.security.*,java.security.spec.*"%>
<%@include file="aheader.jsp"%>
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
String fname = request.getParameter("filename");
String block1 = request.getParameter("block1");
String block2 = request.getParameter("block2");
String block3 = request.getParameter("block3");
String unm=(String)session.getAttribute("unm");
String filehash = session.getAttribute("hash").toString();


con = databasecon.getconnection();
stmt2=con.createStatement();
PreparedStatement p=con.prepareStatement("insert into cloud(fileid,filename,filehash,block1,block2,block3,clientid,stats) values(?,?,?,?,?,?,?,'SecCloud')");
p.setString(1,fileid);
p.setString(2,fname);
p.setString(3,filehash);
p.setBytes(4,block1.getBytes());
p.setBytes(5,block2.getBytes());
p.setBytes(6,block3.getBytes());
p.setString(7,unm);
int i =p.executeUpdate();
if(i>0){
PreparedStatement p1=con.prepareStatement("insert into auditor(fileid,filename,filehash,block1,block2,block3,clientid) values(?,?,?,?,?,?,?)");
p1.setString(1,fileid);
p1.setString(2,fname);
p1.setString(3,filehash);
p1.setBytes(4,block1.getBytes());
p1.setBytes(5,block2.getBytes());
p1.setBytes(6,block3.getBytes());
p1.setString(7,unm);
p1.executeUpdate();
stmt2.executeUpdate("delete from requesttoauditor");
response.sendRedirect("viewrequest.jsp?msg1=suc");

}
%>
