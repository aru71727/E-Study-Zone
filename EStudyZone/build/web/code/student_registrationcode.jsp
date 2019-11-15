<%@page import="MyPackage.ConnectionManager"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
    String capcode=request.getParameter("capcode");
    String captchacode=request.getParameter("captchacode");
    if(capcode.equals(captchacode))
    {
String stu_name=request.getParameter("stu_name");
String gender=request.getParameter("gender");
String address=request.getParameter("address");
String qualification=request.getParameter("qualification");
String training_type=request.getParameter("training_type");
String college_name=request.getParameter("college_name");
long contactno=Long.parseLong(request.getParameter("contactno"));
String emailaddress=request.getParameter("emailaddress");
long gcontactno=Long.parseLong(request.getParameter("gcontactno"));
String username=request.getParameter("username");
String password=request.getParameter("password");
SimpleDateFormat df=new SimpleDateFormat("dd/MM/yyyy");
String registration_dt=df.format(new Date());
String usertype="student";
String status="no";
ConnectionManager cm=new ConnectionManager();
String query1="insert into student_registration values('"+stu_name+"','"+gender+"','"+address+"','"+qualification+"','"+training_type+"','"+college_name+"',"+contactno+",'"+emailaddress+"',"+gcontactno+",'"+username+"','"+password+"','"+registration_dt+"')";
String query2="insert into login values('"+username+"','"+password+"','"+usertype+"','"+status+"')";
 
if(cm.executeNonQuery(query1)==true)
{
if(cm.executeNonQuery(query2)==true)
{
out.println("<script>alert('Registration Successfull');window.location.href='../registration.jsp';</script>");

}
else   
{
out.println("<script>alert('Registration is done but login details are not saved');window.location.href='../registration.jsp';</script>");
}
}
else
{
out.println("<script>alert('Database Error');window.location.href='../registration.jsp';</script>");
}
}
else
{
out.println("<script>alert('Invalid Captcha Code');window.location.href='../registration.jsp';</script>");
}

%>