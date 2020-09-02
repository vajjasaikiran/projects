<%@include file="cheader.jsp"%>
<%                                                       String message=request.getParameter("id");
                                                       if(message!=null && message.equalsIgnoreCase("succ"))
                                                       {
											                out.println("<script type=text/javascript>alert('Update Done..'); </script>  ");
                                                       }
                                               %>
<br><br><br>
<center><img src="images/saddc1.png" width="800" height="250" border="0" alt="">		</center>	
<br><br><br><br><br><br>
<%@include file="footer.jsp"%>