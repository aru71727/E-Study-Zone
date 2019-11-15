<%@page import="MyPackage.ConnectionManager"%>
<%
String fid=request.getParameter("fid");
ConnectionManager cm=new ConnectionManager();
String q="delete from feedback where id='"+fid+"'";
String msg=(cm.executeNonQuery(q)==true)?"Feedback is deleted":"Feedback is not deleted";

%>
<script>
    alert('<%=msg%>');
    window.location.href="../feedbackmanagement.jsp";
    </script>