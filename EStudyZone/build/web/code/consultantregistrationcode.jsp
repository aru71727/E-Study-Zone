<%@page import="MyPackage.ConnectionManager"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
    String capcode=request.getParameter("capcode");
    String captchacode=request.getParameter("captchacode");
    if(capcode.equals(captchacode))
    {
String con_name=request.getParameter("con_name");
String gender=request.getParameter("gender");
String address=request.getParameter("address");
String qualification=request.getParameter("qualification");
long contactno=Long.parseLong(request.getParameter("contactno"));
String emailaddress=request.getParameter("emailaddress");
String username=request.getParameter("username");
String password=request.getParameter("password");
SimpleDateFormat df=new SimpleDateFormat("dd/MM/yyyy");
String registration_dt=df.format(new Date());
String usertype="consultant";
String status="no";
ConnectionManager cm=new ConnectionManager();
String query1="insert into consultant_registration values('"+con_name+"','"+gender+"','"+address+"','"+qualification+"',"+contactno+",'"+emailaddress+"','"+username+"','"+password+"','"+registration_dt+"')";
String query2="insert into login values('"+username+"','"+password+"','"+usertype+"','"+status+"')";
 
if(cm.executeNonQuery(query1)==true)
{
if(cm.executeNonQuery(query2)==true)
{
 out.println("<script>alert('Registration Successfull');window.location.href='../consultantregistration.jsp';</script>");

}
else
{
 out.println("<script>alert('Registration is done but login details are not saved');window.location.href='../consultantregistration.jsp';</script>");
}
}
else
{
out.println("<script>alert('Database Error');window.location.href='../consultantregistration.jsp';</script>");
}
}
    else
    {
 out.println("<script>alert('Invalid Captcha Code');window.location.href='../consultantregistration.jsp';</script>");
    }





%>