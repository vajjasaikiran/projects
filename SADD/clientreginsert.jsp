<%@page import="databaseconnection.*,java.sql.*,java.math.BigInteger,java.security.*,java.security.spec.*,javax.crypto.KeyAgreement,RSA.*"%>
<%!
Connection con;
Statement stmt;
%>
<%
String name = request.getParameter("name");
String uname = request.getParameter("uname");
String password = request.getParameter("password");
String email = request.getParameter("email");
String contact = request.getParameter("contact");

KeyPairGenerator kpg;
kpg = KeyPairGenerator.getInstance("EC","SunEC");
ECGenParameterSpec ecsp;
ecsp = new ECGenParameterSpec("secp192k1");
kpg.initialize(ecsp);
KeyPair kpU = kpg.genKeyPair();
PrivateKey privKeyU = kpU.getPrivate();
PublicKey pubKeyU = kpU.getPublic();
System.out.println("User U: " + privKeyU.toString());
System.out.println("User U: " + pubKeyU.toString());
Publickey e=new Publickey();
e.generateKeys();
String pubkey=e.getPublicKey();
String privatekey=e.getPrivateKey();
con = databasecon.getconnection();
PreparedStatement p=con.prepareStatement("insert into clients(name,username,password,email,contact,pubkey,prikey,status,pubkey1,prikey1) values(?,?,?,?,?,?,?,?,?,?)");
p.setString(1,name);
p.setString(2,uname);
p.setString(3,password);
p.setString(4,email);
p.setString(5,contact);
p.setBytes(6,pubKeyU.getEncoded());
p.setBytes(7,privKeyU.getEncoded());
p.setString(8,"normal");
p.setString(9,pubkey);
p.setString(10,privatekey);
 int i = p.executeUpdate();
if(i>0){
response.sendRedirect("cloudclient.jsp?msg=succ");
}else{
response.sendRedirect("cloudclient.jsp?msg1=fail");
}
%>
