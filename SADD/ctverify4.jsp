

<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%
String fid=request.getParameter("id");
String fblock=null,fdata=null;
boolean status=false;
boolean status2=true;
%>
<%! String pk;
String b1,b2,b3;
%>


<%								
Connection con=databasecon.getconnection();
Statement st2 = con.createStatement();
try{

Statement st21= con.createStatement();

ResultSet r=st21.executeQuery("select prikey1 from clients where username=(select clientid from auditor where fileid='"+fid+"') ");
String sss1 = "select  *from auditor where fileid='"+fid+"' and ";

if(r.next()){
pk=r.getString(1);
}



Statement st22= con.createStatement();
Statement st11= con.createStatement();
ResultSet r2=st22.executeQuery("select *from cloud where fileid='"+fid+"' ");

if(r2.next()){
PreparedStatement psmnt = null;
ResultSet rs11=st11.executeQuery("select  block1,block2,block3 from auditor where fileid='"+fid+"' ");
while(rs11.next())
{
	b1=rs11.getString(1);
	b2=rs11.getString(2);
	b3=rs11.getString(3);
	System.out.println("b1="+b1);
	System.out.println("b2="+b2);
	System.out.println("b3="+b3);

		psmnt = con.prepareStatement("update cloud  set  block1=?,block2=?,block3=? where  fileid=? ");
psmnt.setString(1,b1);
psmnt.setString(2,b2);
psmnt.setString(3,b3);
	psmnt.setString(4,fid);
	psmnt.executeUpdate();
	}



}
else{

PreparedStatement psmnt = null;
String b1=null,b2=null,b3=null;
ResultSet rs=st2.executeQuery("select  AES_DECRYPT(block1,'"+pk+"'),AES_DECRYPT(block2,'"+pk+"'),AES_DECRYPT(block3,'"+pk+"') from auditor where fileid='"+fid+"' ");
while(rs.next())
{
	b1=rs.getString(1);
	b2=rs.getString(2);
	b3=rs.getString(3);
	System.out.println("b1="+b1);
	System.out.println("b2="+b2);
	System.out.println("b3="+b3);

		psmnt = con.prepareStatement("update cloud  set  block1=AES_ENCRYPT(?,'"+pk+"'),block2=AES_ENCRYPT(?,'"+pk+"'),block3=AES_ENCRYPT(?,'"+pk+"')where  fileid=? ");
psmnt.setString(1,b1);
psmnt.setString(2,b2);
psmnt.setString(3,b3);
	psmnt.setString(4,fid);
	psmnt.executeUpdate();
	}

}

}
catch(Exception e){
	e.printStackTrace();
out.println(e);
}

	
			response.sendRedirect("ctverify.jsp?id=succ");

	%>

