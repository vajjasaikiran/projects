<%@page import="databaseconnection.*,java.sql.*,java.io.*,Hash.*"%>
<%@include file="ccheader.jsp"%>
<%!
Connection con;
Statement stmt,stmt1,stmt2;
ResultSet rs,rs1,rs2;
String fileid,uploadfile,email;
int count;
%>

<%!String  thisLine = null;
StringBuffer sb1=null;
String filename=null,unm=null,fid=null,fnm=null;
int i=0;
%>
 <% java.util.Enumeration e = request.getParameterNames();
 while(e.hasMoreElements()){
         // String e=names.nextElement();
		   String name = (String)e.nextElement();  
		   System.out.println("nm="+name);  }
	   String saveFile="";
//String contentType=request.getAttribute("file");
String contentType = request.getContentType();
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while(totalBytesRead < formDataLength){
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
File ff = new File(saveFile);
FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();
File f=new File(saveFile);
FileInputStream fis=new FileInputStream(saveFile);
session.setAttribute("fis",fis);
 fnm=f.getName();
         // open input stream test.txt for reading purpose.
		 try{
         BufferedReader br = new BufferedReader(new FileReader(f));
		 StringBuffer sb=new StringBuffer();
         while ((thisLine = br.readLine()) != null) {
          //  System.out.println(thisLine);
			
                sb1=sb.append(thisLine);
				
         }
		 } catch(Exception e1){ }
		 unm=(String)session.getAttribute("unm");
		 session.setAttribute("data",sb1);

		}
	String sts1=(String)session.getAttribute("sts1");
String hash = SHA.SHA_1(sb1.toString(),"SHA-1");
con = databasecon.getconnection();
stmt=con.createStatement();
System.out.println("hash="+hash);
rs = stmt.executeQuery("select fileid from cloud where clientid='"+uname+"' and filehash=AES_ENCRYPT('"+hash+"','"+hash+"') ");
//rs2 = stmt2.executeQuery("select * from requesttoauditor where clientid='"+uname+"' and filedata='"+sb1+"' ");
if(rs.next()){
session.setAttribute("fid",rs.getString(1));
response.sendRedirect("pow1.jsp");
}else{
	stmt1 = con.createStatement();
PreparedStatement ps=con.prepareStatement("insert into requesttoauditor values(?,?,?,?,?)");
ps.setString(1,fnm);
ps.setBytes(2,new String(sb1).getBytes());
ps.setString(3,uname);
ps.setString(4,sts1);
ps.setString(5,hash);
int i = ps.executeUpdate();
if(i>0){
response.sendRedirect("cpfileupload.jsp?msg3=sendtoauditor");
}else{
response.sendRedirect("cpfileupload.jsp?msg4=sendtoauditorfail");
}
}
%>




<!-- <tr>
<td><font size="5">Client Public Key</font></td>
<td><font size="5">:</font></td>
<td><input type="text" name="fname" value=" "  readonly/></td>
<td><a href="fileupload2.jsp?filename=<%=fnm%>&filedata=<%=sb1%>"><font color="green"><b>Get Client Public key</b></font></a></td>
</tr> -->
</table>
</form>

	</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 <%@include file="footer.jsp"%>
