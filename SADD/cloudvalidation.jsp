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

if((uname.equals("cloud")) && (password.equals("cloud"))){
session.setAttribute("uname",uname);
response.sendRedirect("cloudhome.jsp?msg=succ");
}else{
response.sendRedirect("cloudhome.jsp?msg2=unsucc");
}
%>