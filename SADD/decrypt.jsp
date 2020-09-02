<%@include file="ccheader.jsp"%>
<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%
String fid=request.getParameter("id");
%>
<center><br><br>
<span class=""><font color="#663300" size="5"><u><b>File Download</b></u></font></span><br></font></h1>
<br><br>
<head>
<script type="text/javascript">  
function f1Submit() {  
document.f1.action="finalDownload.jsp";  
document.f1.submit();  

	}  
</script>
</head>
<table align="center">

<%								

String pkey=null;
Connection con=databasecon.getconnection();
Statement st1 = con.createStatement();Statement st11 = con.createStatement();
ResultSet rs2=st1.executeQuery("select prikey1,pubkey1 from clients where username='"+uname +"' ");
if(rs2.next()){
pkey=rs2.getString(2);
}

	String sss2 = "select  filename ,AES_DECRYPT(block1,'"+pkey+"'),AES_DECRYPT(block2,'"+pkey+"'),AES_DECRYPT(block3,'"+pkey+"') from cloud  where fileid='"+fid+"' and clientid='"+uname +"'  ";
ResultSet rs1=st11.executeQuery(sss2);
if(rs1.next()){
	%>
	<form action="finalDownload1.jsp?id=<%=fid%>" method="post">
	<tr>
		<td><h3><font size="" color="">File Name</h3>
		<input type="text"  name="b1"  value=<%=rs1.getString(1)%> readonly></textarea></td>
	</tr>
<tr>
		<td><h3><font size="" color="">File Block1</h3>
		<textarea name="b1" rows="3" cols="50" readonly><%=rs1.getString(2)%></textarea></td>
	</tr>
<tr>
		<td><h3><font size="" color="">File Block2</h3>
		<textarea name="b2" rows="3" cols="50" readonly><%=rs1.getString(3)%></textarea></td>
	</tr>

<tr>
		<td><h3><font size="" color="">File Block3</h3>
		<textarea name="b3" rows="3" cols="50" readonly><%=rs1.getString(4)%></textarea></td>
	</tr>


<tr>

<td><input type="hidden" name="pkey" value="<%=pkey%>"><input type="submit" value="Download">&nbsp;&nbsp;&nbsp;</td>
</tr>
</form>

<%}
	%>

</table>

</form>
<br><br><br>

            <%@include file="footer.jsp"%> 