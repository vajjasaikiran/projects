<%@include file="aheader.jsp"%>
<%@ page  import="java.sql.*" import="databaseconnection.*"%>

<script type="text/javascript">  


//alert('Request Sent to TPA');  

</script>
<table>
<%
String fid=request.getParameter("id");
String cid=request.getParameter("cid");
String s1=null,s2=null;
boolean status=false,status1=false,status2=false,status3=true;
//boolean status2=true;
%>
<br><br><br><br><br>
<center><h2>Data Verifying of File id: <%=fid%></h1><br></center>
<table border=2 align="center">
<%								
Connection con=databasecon.getconnection();
Statement st1 = con.createStatement();
Statement st2 = con.createStatement();
String b1=request.getParameter("block1");
String b2=request.getParameter("block2");
String b3=request.getParameter("block3");
String b11=request.getParameter("block11");
String b22=request.getParameter("block22");
String b33=request.getParameter("block33");
						
						if(b1.trim().equals(b11.trim()))
						{System.out.println("true");
							status=true;
						}
						else{
							System.out.println("false");
							status=false;
							}
	if(b2.equals(b22))
						{
							status1=true;
						}
						else{
							status1=false;
							}
if(b3.equals(b33))
						{
							status2=true;
						}
						else{
							status2=false;
							}

	if(status==true){
	%>
	<tr><td><h2><font size="" color="#00cc33">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;File Block1 Verified, not Modyfied .</h2><br></font>
	<%
	}
		else{
			status3=false;
				%>
	<tr><td>	<h2><font size="" color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;File Block 1 Verified,  Modyfied .</font><br></h2>
	<%}%>

	<%  if(status1==true){
	%>
	<tr><td><h2><font size="" color="#00cc33">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;File Block2 Verified, not Modyfied .</h2><br></font>
	<%
	}
		else{
			status3=false;
				%>
	<tr><td>	<h2><font size="" color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;File Block2 Verified,  Modyfied .</font><br></h2>
		<%}%>
	

	<%  if(status2==true){
	%>
	<tr><td><h2><font size="" color="#00cc33">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;File Block3 Verified, not Modyfied .</h2><br></font>
	<%
	}
		else{
			status3=false;
				%>
	<tr><td>	<h2><font size="" color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;File Block3 Verified,  Modyfied .</font></h2>
		<%}%>
</table><br><br>
<%if(status3==false){
	%>
<center><form method="post" action="tverify4.jsp">
	<input type="hidden" name="id" value="<%=fid%>">
		<input type="hidden" name="cid" value="<%=cid%>">
	<input type="submit" value="Data Replicate">
</form></center>

	<%
}
	%>
<br><br><br><br><br><br>
            <%@include file="footer.jsp"%> 