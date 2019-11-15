<%@page import="MyPackage.ConnectionManager"%>
<%
String id=request.getParameter("id");
ConnectionManager cm=new ConnectionManager();
String q="delete from enquiry where id='"+id+"'";
String msg=(cm.executeNonQuery(q)==true)?"Enquiry is deleted":"Enquiry is not deleted";

%>
<script>
    alert('<%=msg%>');
    window.location.href="../enquirymanagement.jsp";
    </script>