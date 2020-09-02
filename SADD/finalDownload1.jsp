<%@ page import="java.sql.*"%>
<%@ page import="databaseconnection.*,java.io.*"%>

<%
    String fid=request.getParameter("id");
String pkey=request.getParameter("pkey");
	String fname=null;
	 
	     try{
		 
		 Connection con=databasecon.getconnection();
		 PreparedStatement ps =con.prepareStatement("select AES_DECRYPT(block1,'"+pkey+"'),AES_DECRYPT(block2,'"+pkey+"'),AES_DECRYPT(block3,'"+pkey+"'),filename from cloud where fileid ='"+fid+"'");
		 ResultSet rs = ps.executeQuery();
		 while(rs.next())
		 {
		 fname=rs.getString(4);
	
			String filename =fname;
		String fnm[]=filename.split("\\.");
			byte[] ba = rs.getBytes(1);
			byte[] ba1 = rs.getBytes(2);
			byte[] ba2 = rs.getBytes(3);
		
			response.setContentType("application/notepad");
			response.setHeader("Content-Disposition","attachment; filename=\""+fnm[0]+".txt\"");
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.write(ba1);
			os.write(ba2);
			os.close();
			ba = null;
		ba1 = null;
		ba2 = null;
			//session.removeAttribute("file");
			}
	
			}
			catch(Exception e)
			{
				e.printStackTrace();
			out.println("Exception :"+e);
			}
		
		
		
%>