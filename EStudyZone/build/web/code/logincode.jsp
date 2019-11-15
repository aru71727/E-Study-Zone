
<%@page import="java.sql.ResultSet"%>
<%@page import="MyPackage.ConnectionManager"%>
<%
String userid=request.getParameter("userid");
String password=request.getParameter("password");
ConnectionManager cm=new ConnectionManager();
String query="select usertype from login where userid='"+userid+"'and passwd='"+password+"'";
ResultSet rs=cm.selectQuery(query);
if(rs.next())
{
   String usertype=rs.getString(1);
   if(usertype.equals("student"))
   {
       session.setAttribute("username", userid);
   
      response.sendRedirect("../userzone/userhome.jsp");
   }
   else if(usertype.equals("consultant"))
   {
       session.setAttribute("username", userid);
   
      response.sendRedirect("../consultantzone/consultanthome.jsp");
   }
   else if(usertype.equals("admin")==true)
   {
       session.setAttribute("adminid",userid);
        response.sendRedirect("../adminzone/adminhome.jsp");
   }
}
else
{
   out.println("<script>alert('Invalid User');window.location.href='../login.jsp';</script>"); 
}

%>