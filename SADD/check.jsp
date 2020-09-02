<%@ include file="ccheader.jsp"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%><br><br><br><br>
<%
String u=request.getParameter("uid");
String pkey=request.getParameter("pkey");
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
System.out.println("select  *from clients where username='"+u+"' and prikey1='"+pkey+"'  ");
ResultSet r=st.executeQuery("select  *from clients where username='"+u+"' and prikey1='"+pkey+"'  ");
if(r.next())
	{ 
%>
		<center><font size="" color="#ff3366"><h2><B>Reference FileId of your's Uploading file is&nbsp;</font>:&nbsp;<font size="" color="#99cc33"><B><%=session.getAttribute("fid")%></center>
	
	<%}
	else{
response.sendRedirect("pow.jsp?msg=fail");
	}


%>

<!-- 
<center><img src="images/hybrid-cloud1.png" width=700 height=300>	 -->	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="footer.jsp"%>