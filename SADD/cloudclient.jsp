<%@include file="header.jsp"%>
<%
String msg = request.getParameter("msg");
if(msg != null){
out.println("<script>alert('Registration Successfull Please login..!')</script>");
}
String msg1 = request.getParameter("msg1");
if(msg1 != null){
out.println("<script>alert('Registration Unsuccessfull Please login..!')</script>");
}
String msg2 = request.getParameter("msg2");
if(msg2 != null){
out.println("<script>alert('User name (or) Password incorrect please check it..!')</script>");
}
%>
<!-- about -->
	<div class="forms" align="center">
					<form action="clientvalidation.jsp" method="post">
					<table cellpadding="10">
					<tr><td><font color="orange" size="6"><b>Client Login</u></b></font></td></tr>
					<tr><td><br></td></tr>
					<tr><td><font color="gray" size="5"><b><!-- User Name: --></b></font></td></tr>
					<tr><td><input type="text" name="uname" placeholder="User Name" required=""><br></td></tr>
					<tr><td><br><font color="gray" size="5"><b><!-- Password: --></b></font></td></tr>
					<tr><td><input type="password" name="password" placeholder="Password" required=""></td><br></tr>
					
					<tr><td><br><input type="submit" value="LOGIN">&nbsp;&nbsp;&nbsp;<input type="reset" value="RESET"></td><td><!-- <a href="clientregistration.jsp"><img src="images/register.png" width="75px" height="75px" /></a> --></td></tr>
					</table><br><br><br><br>
					<table align="center"><tr> <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;<a href="clientregistration.jsp"><img src="images/register.png" width="75px" height="75px" /></a></td></tr></table>
					</form>
		</div>
		
<!-- about -->

<%@include file="footer.jsp"%>