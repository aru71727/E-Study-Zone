
<%@page import="MyPackage.ConnectionManager"%>
<%
String oldpassword=request.getParameter("oldpassword");
String newpassword=request.getParameter("newpassword");
String confirmpassword=request.getParameter("confirmpassword");
if(newpassword.equals(confirmpassword))
{
String userid=session.getAttribute("username").toString();
String query1="update login set passwd='"+newpassword+"' where userid='"+userid+"' and passwd='"+oldpassword+"'";

ConnectionManager cm=new ConnectionManager();
if(cm.executeNonQuery(query1))
{
   
        out.print("<script>alert('Password Updated');window.location.href='../adminchangepassword.jsp';</script>");
    }
   

else
{
  out.print("<script>alert('Database Error');window.location.href='../adminchangepassword.jsp';</script>"); 
}


%>