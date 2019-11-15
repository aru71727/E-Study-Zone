<%@page import="MyPackage.ConnectionManager"%>
<%
String id=request.getParameter("id");
ConnectionManager cm=new ConnectionManager();
String q="delete from complain where id='"+id+"'";
String msg=(cm.executeNonQuery(q)==true)?"Complain is deleted":"Complain is not deleted";

%>
<script>
    alert('<%=msg%>');
    window.location.href="../complainmanagement.jsp";
    </script>