<%-- 
    Document   : logout
    Created on : 25-Jul-2017, 12:41:26
    Author     : Aradhana
--%>

<%
session.invalidate();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function clear()
            {
                window.history.forward();
                window.setTimeout("window.location.href='../login.jsp'",1000);
            }
            </script>
    </head>
    <body onload="clear()">
        
    </body>
</html>
