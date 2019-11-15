<%@page import="MyPackage.ConnectionManager"%>
<%
String id=request.getParameter("id");
ConnectionManager cm=new ConnectionManager();
String q="delete from review where id='"+id+"'";
String msg=(cm.executeNonQuery(q)==true)?"Review is deleted":"Review is not deleted";

%>
<script>
    alert('<%=msg%>');
    window.location.href="../reviewmanagement.jsp";
    </script>