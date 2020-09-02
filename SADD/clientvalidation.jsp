<%@page import="databaseconnection.*,java.sql.*"%>
<%!
Connection con;
Statement stmt;
ResultSet rs;
%>
<%
String uname = request.getParameter("uname");
//session.setAttribute("uname",uname);
String password = request.getParameter("password");

con = databasecon.getconnection();
stmt = con.createStatement();
rs = stmt.executeQuery("select username,password from clients where username='"+uname+"' and password='"+password+"' ");

if(rs.next()){
session.setAttribute("uname",uname);
response.sendRedirect("clienthome.jsp?msg=succ");
}else{
response.sendRedirect("cloudclient.jsp?msg2=unsucc");
}
%>