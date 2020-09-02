<%@include file="ccheader.jsp"%>
<%@page import="databaseconnection.*,java.sql.*"%>

<% String msg1 = request.getParameter("msg3");
if(msg1 != null){
out.println("<script>alert('Request Sent to  Auditor..!')</script>");
}
%>

<br><br>
<div align="center">
<span class=""><font color="#663300" size="6"><u><b>File Data</b></u></font></span><br><br>
	<table bgcolor="" cellpadding="5" cellspacing="5" width="825" border="0" align="center">
            <tr  bgcolor="#6ce1a2"> 
            <tr bgcolor="#ff9900"> 
              <td align="center"><font color="#110022"><strong><font size="" color="#fff"><h1>S. No</font></strong></font></td>
              <td align="center"><font color="#110022"><strong><font size="" color="#fff"><h1>File Id</font></strong></font></td>
                <td align="center"><font color="#110022"><strong><font size="" color="#fff"><h1>File Name</strong></font></td>


              <td align="center"> <font color="#110022"><strong><font size="" color="#fff"><h1>File Download</strong></font></td>
			  <!-- <td align="center"> <font color="#110022"><strong><font size="" color="#fff">Update Operations</strong></font></td> -->
			  <!-- <td align="center"> <font color="#110022"><strong><font size="" color="#fff">Delete</strong></font></td>	 -->	  
			 
            </tr>
 <%
	String u=(String)session.getAttribute("name");
ResultSet rs=null;
String all="allowed";
try
{
	Connection con = databasecon.getconnection();
	Statement st = con.createStatement();	

    String qry="select * from cloud where clientid='"+uname +"' ";

		rs =st.executeQuery(qry);
		String owner=null,name=null,fid=null;
	int sno=0;
	while(rs.next())
	{
	
%>
            <tr bgcolor="#d2d2d2"> 
              <td align="center"> <strong><font size="3" color="#6300C6"> <h1><%=rs.getString("sno")%> </font></strong></td>
               <td align="center"> <strong><font size="3" color="#6300C6"><h1> <%=rs.getString("fileid")%> </font></strong></td>
              <td align="center"><strong><font size="3" color="#6300C6"> <h1><%=rs.getString("filename")%> </font></strong></td>


              <td align="center"><a href="file_download.jsp?id=<%=rs.getString("fileid")%>"><strong><font color="#6300C6" class="big"> 
                Download</font></strong></a></td>
				  <!-- <td align="center"><a href="delete.jsp?id=<%=fid%>"><strong><font color="#6300C6" class="big"> 
                Delete</font></strong></a></td>
 -->
				  
            </tr>
            <%
	   }
	   }
	   catch(Exception e1)
	   {
	     out.println(e1);

	   }
 %>
          </table>
	
	</div>
<br><br><br><br><br><br><br><br><br><br><br>
 <%@include file="footer.jsp"%>