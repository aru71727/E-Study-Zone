/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package MyPackage;
import java.net.*;
import java.io.*;

public class SmsSender 
{
 public static String user,key,senderid,accusage,retval="";
 public SmsSender()
 {
     user = "BRIJESH";
        key = "8620e45a26XX";
        senderid = "SPILKO";
     accusage="1";
 }
 public boolean SendSms(String mobile,String msg)
 {
     try
     {
  String smsurl="http://sms.bulkssms.com/submitsms.jsp";
  String data=URLEncoder.encode("user", "UTF-8")+"="+URLEncoder.encode(user, "UTF-8");
  data +="&"+URLEncoder.encode("key", "UTF-8")+"="+URLEncoder.encode(key, "UTF-8");
  data +="&"+URLEncoder.encode("mobile", "UTF-8")+"="+URLEncoder.encode(mobile, "UTF-8");
  data +="&"+URLEncoder.encode("message", "UTF-8")+"="+URLEncoder.encode(msg, "UTF-8");
  data +="&"+URLEncoder.encode("senderid", "UTF-8")+"="+URLEncoder.encode(senderid, "UTF-8");
  data +="&"+URLEncoder.encode("accusage", "UTF-8")+"="+URLEncoder.encode(accusage, "UTF-8");
  URL url=new URL(smsurl);
  URLConnection con=url.openConnection();
  con.setDoOutput(true);
  //Push the Message
  OutputStreamWriter wr=new OutputStreamWriter(con.getOutputStream());
  wr.write(data);
  wr.flush();
  //Get the response
  BufferedReader rd=new BufferedReader(new InputStreamReader(con.getInputStream()));
  String line;
  while((line=rd.readLine())!=null)
  {
      retval+=line;
  }
  wr.close();
  rd.close();
  return true;
     }
     catch(Exception ex)
     {
         return false;
     }
}
}