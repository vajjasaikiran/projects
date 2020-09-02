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

if((uname.equals("auditor")) && (password.equals("auditor"))){
session.setAttribute("uname",uname);
response.sendRedirect("auditorhome.jsp?msg=succ");
}else{
response.sendRedirect("auditor.jsp?msg2=unsucc");
}
%>