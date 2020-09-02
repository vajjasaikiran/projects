<%@include file="ccheader.jsp"%>
<%@ page  import="java.sql.*" import="java.util.Date"  import="java.text.*" import="databaseconnection.*" import="javax.swing.JOptionPane"%>
		<%
		String sno=request.getParameter("id"); 
		ResultSet rs=null;
		
try
{
	Connection con = databasecon.getconnection();
	Statement st = con.createStatement();	

    String qry="insert into verify(fileid, clientid, vstatus) values('"+sno+"','"+uname+"','Request Sent') ";

		System.out.println("qry="+qry);
	
		int d =st.executeUpdate(qry);

	if(d>0)
	{
			response.sendRedirect("viewData.jsp?msg3=sent");
	}}catch(Exception e){
			response.sendRedirect("viewData.jsp?msg3=alsent");
	}
 %>
 