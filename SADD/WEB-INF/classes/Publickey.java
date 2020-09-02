 package RSA;
import java.math.*;
import java.util.*;
import java.security.SecureRandom;
import java.security.*;
import java.security.spec.*;
import org.apache.commons.lang3.RandomStringUtils;
public class Publickey
{
 public void generateKeys()
 {
 KeyPairGenerator kpg;
 try{
 kpg = KeyPairGenerator.getInstance("EC","SunEC");
 ECGenParameterSpec ecsp;
 ecsp = new ECGenParameterSpec("sect163k1");
 kpg.initialize(ecsp);
 KeyPair kp = kpg.genKeyPair();
 PrivateKey privKey = kp.getPrivate();
 PublicKey pubKey = kp.getPublic();
 }catch(Exception e){}
 }
public String getPublicKey(){
RandomStringUtils.random(16, "0123456789abcdef");
return new String(Long.toHexString(Double.doubleToLongBits(Math.random())));
}
 public String getPrivateKey(){
RandomStringUtils.random(16, "0123456789abcdef");
return new String(Long.toHexString(Double.doubleToLongBits(Math.random())));
 }
 public static void main(String[] args) throws Exception
{
 Publickey e=new  Publickey();
e.generateKeys();
String pubkey=e.getPublicKey();
String privatekey=e.getPrivateKey();
System.out.println("pk="+pubkey);
System.out.println("prik="+privatekey);
}

}