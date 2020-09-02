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


Connection con=databasecon.getconnection();
Statement st1 = con.createStatement();Statement st11 = con.createStatement();

String sss1 = "select  *from cloud  where fileid='"+fid+"' and clientid='"+uname +"' and stats='SecCloud' ";
ResultSet rs=st1.executeQuery(sss1);
if(rs.next())
{
%>	
	<tr>
		<td><h3><font size="" color="">File Name</h3>
		<input type="text"  name="b1"  value=<%=rs.getString(3)%> readonly></textarea></td>
	</tr><tr>
		<td><h3><font size="" color="">File Block1</h3>
		<textarea name="b1" rows="3" cols="50" readonly><%=rs.getString(5)%></textarea></td>
	</tr>
<tr>
		<td><h3><font size="" color="">File Block2</h3>
		<textarea name="b2" rows="3" cols="50" readonly><%=rs.getString(6)%></textarea></td>
	</tr>

<tr>
		<td><h3><font size="" color="">File Block3</h3>
		<textarea name="b3" rows="3" cols="50" readonly><%=rs.getString(7)%></textarea></td>
	</tr>

<form name="f1" method="post">	
	<tr><td align="center"><br>
	
<input type="hidden" name="fid" value="<%=fid%>">
	<input type="submit" name="submit" Value=" Download" onclick="f1Submit()" />  


<%
}
else{
	String sss2 = "select  *from cloud  where fileid='"+fid+"' and clientid='"+uname +"' and stats='SecCloud1' ";
ResultSet rs1=st11.executeQuery(sss2);
if(rs1.next()){
	%>
	<form action="getPkey.jsp?id=<%=fid%>" method="post">
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
		<input type="text" name="ck" value=" "  readonly/></td>
	</tr>

<tr>
<!-- <td><input type="hidden" name="id" value="<%=fid%>"></td> -->
<td><input type="submit" value="Get Client PrivateKey">&nbsp;&nbsp;&nbsp;</td>
</tr>
</form>

<%}}
	%>

</table>

</form>
<br><br><br>

            <%@include file="footer.jsp"%> 