
<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.swing.JOptionPane"%>
		<%@ include file="ccheader.jsp"%>
		<form>

<h1>Audit&nbsp;Result</h1>
<center>
          <table bgcolor="" cellpadding="5" cellspacing="5" width="825" border="0" align="center">
            <tr  bgcolor="#db288a"> 
            <tr bgcolor="#db288a"> 
              <td align="center"><font color="#110022"><strong><font size="" color="#fff">File Id</font></strong></font></td>
              <td align="center"> <font color="#110022"><strong><font size="" color="#fff">ClientId</strong></font></td>
              <td align="center"> <font color="#110022"><strong><font size="" color="#fff">Status</strong></font></td>
        </tr>
            <%
ResultSet rs=null;
String all="allowed";
try
{
	Connection con = databasecon.getconnection();
	Statement st = con.createStatement();	

    String qry="select * from verify where clientid='"+uname+"' ";

		rs =st.executeQuery(qry);
		String owner=null,name=null,fid=null;
	int sno=0;
	while(rs.next())
	{
	sno++;
	fid=rs.getString("fileid");


	


	
	 
%>
            <tr bgcolor="#e388c1"> 
            
               <td align="center"> <strong><font size="3" color="#6300C6"> <%=fid%> </font></strong></td>
               <td align="center"> <strong><font size="3" color="#6300C6"> <%=rs.getString(2)%></font></strong></td>

			   <td align="center"> <strong><font size="3" color="#6300C6"> <%=rs.getString(3)%> </font></strong></td>


              
            <%
	   }
	   }
	   catch(Exception e1)
	   {
	     out.println(e1);

	   }
 %>
          </table>
        </form>
		<br><br><br><br><br><br><br>
<%@ include file="footer.jsp"%>