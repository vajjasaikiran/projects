
<%@include file="header.jsp"%>
<%
String msg = request.getParameter("msg");
if(msg != null){
out.println("<script>alert('Registration Successfull Please login..!')</script>");
}
%>
<!-- about -->
	<div class="forms" align="center">
					<form action="auditorvalidation.jsp" method="post">
					<table>
					<tr><td><font color="orange" size="6"><b>Auditor Login</u></b></font></td></tr>
					<tr><td><br></td></tr>
					<tr><td><!-- <font color="gray" size="5"><b>User Name:</b></font>< --></td></tr>
					<tr><td><input type="text" name="uname" placeholder="User Name" required=""></td><br></tr>
					<tr><td><!-- <font color="gray" size="5"><b>Password:</b></font> --></td></tr>
					<tr><td><br><input type="password" name="password" placeholder="Password" required=""></td></tr>
					
					<tr><td><br><input type="submit" value="LOGIN">&nbsp;&nbsp;&nbsp;<input type="reset" value="RESET"></td></tr>
					</table>
					</form>
		</div><br><br><br><br><br><br><br>
		
<!-- about -->

<%@include file="footer.jsp"%>