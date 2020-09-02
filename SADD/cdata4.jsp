     <%@include file="cheader.jsp"%>
<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%
String fid=request.getParameter("fid");
String b1=request.getParameter("b1");
String b2=request.getParameter("b2");
String b3=request.getParameter("b3");
System.out.println("b1="+b1);
System.out.println("b2="+b2);
System.out.println("b3="+b3);
%>

<%								

Connection con=databasecon.getconnection();
Statement st1 = con.createStatement();
PreparedStatement psmt1=con.prepareStatement("update cloud  set block1=? ,block2=? ,block3=? where fileid=? ");
psmt1.setString(1,b1);
psmt1.setString(2,b2);
psmt1.setString(3,b3);
psmt1.setString(4,fid);
psmt1.executeUpdate();
response.sendRedirect("cloudhome.jsp?id=succ");

%>

            <%@include file="footer.jsp"%> 