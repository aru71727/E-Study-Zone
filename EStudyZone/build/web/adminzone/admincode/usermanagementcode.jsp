<%@page import="MyPackage.ConnectionManager"%>
<%  
String username=request.getParameter("username");
ConnectionManager cm=new ConnectionManager();
String q="delete from student_registration where username='"+username+"'";
String msg=(cm.executeNonQuery(q)==true)?"Record is deleted":"Record is not deleted";
%>
<script>
    alert('<%=msg%>');
    window.location.href="../usermanagement.jsp";
  </script>