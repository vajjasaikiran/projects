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
ResultSet rs2=st1.executeQuery("select prikey1 from clients where username='"+uname +"' ");
if(rs2.next()){
pkey=rs2.getString(1);
}

	String sss2 = "select  *from cloud  where fileid='"+fid+"' and clientid='"+uname +"'  ";
ResultSet rs1=st11.executeQuery(sss2);
if(rs1.next()){
	%>
	<form action="decrypt.jsp?id=<%=fid%>" method="post">
	<tr>
		<td><h3><font size="" color="">File Name</h3>
		<input type="text"  name="b1"  value=<%=rs1.getString(3)%> readonly></textarea></td>
	</tr>
<tr>
		<td><h3><font size="" color="">File Block1</h3>
		<textarea name="b1" rows="3" cols="50" readonly><%=rs1.getString(5)%></textarea></td>
	</tr>
<tr>
		<td><h3><font size="" color="">File Block2</h3>
		<textarea name="b2" rows="3" cols="50" readonly><%=rs1.getString(6)%></textarea></td>
	</tr>

<tr>
		<td><h3><font size="" color="">File Block3</h3>
		<textarea name="b3" rows="3" cols="50" readonly><%=rs1.getString(7)%></textarea></td>
	</tr>
<tr>
		<td><h3><font size="" color="">Client PrivateKey</h3>
			<textarea name="b3" rows="3" cols="50" readonly><%=pkey%></textarea></td></td>
	</tr>

<tr>
<input type="hidden" name="fid" value="<%=fid%>">
<td><input type="submit" value="Decrypt">&nbsp;&nbsp;&nbsp;</td>
</tr>
</form>

<%}
	%>

</table>

</form>
<br><br><br>

            <%@include file="footer.jsp"%> 