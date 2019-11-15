
<%@page import="java.sql.ResultSet"%>
<%@page import="MyPackage.ConnectionManager"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/consultantstyle.css" rel="stylesheet"/>
          <link href="css/menu.css" rel="stylesheet"/>
    </head>
    <body style="background-image:url('images/back.jpg'); background-repeat:no-repeat;background-size: cover; ">
        <form>
            <%
            if(session.getAttribute("username")=="" ||session.getAttribute("username")==null)
            {
                response.sendRedirect("../login.jsp");
            }
            else
            {
            %>
        <div id="wrapper">
            <div id="header">
               
                        <img src="images/logo1.png" width="998" height="150"/>
                </div>
               
            <div id="contain1">
                <div id="date">
                    Current Date:
                     <%
                    SimpleDateFormat df=new SimpleDateFormat("dd/MM/yyyy");
                     String dt=df.format(new Date());
                     out.print(dt);%>
                </div>
                <div id="name">Hello,
                    <%
                     String username=session.getAttribute("username").toString();
                     ConnectionManager cm=new ConnectionManager();
                     String query="select consultant_name from consultant_registration where username='"+username+"'"; 
                             ResultSet rs=cm.selectQuery(query);
                             if(rs.next()==true)
                             {
                                 out.print(rs.getString(1));
                                 session.setAttribute("name", rs.getString(1));
                             }
                    %>
                </div>
            </div>
                <div id="menu">
                    <ul>
                        <li><a href="consultanthome.jsp">HOME</a></li>
                          <li><a href="../userzone/download.jsp">DOWNLOAD</a></li>
                          <li><a href="../adminzone/studymaterialupload.jsp">UPLOAD</a></li>
                        <li><a href="../userzone/postqus.jsp">DISCUSSION BOARD</a></li>
                        <li><a href="#">RESPONSE</a><ul>
                        <li><a href="../userzone/feedback.jsp">FEEDBACK</a></li>
                        <li><a href="../userzone/complain.jsp">COMPLAIN</a></li>
                            <li><a href="../userzone/review.jsp">REVIEW</a></li></ul></li>
                            <li><a href="#">SETTINGS</a><ul>
                          <li><a href="consultantchangepassword.jsp">CHANGE PASSWORD</a></li>
                            <li><a href="../userzone/logout.jsp">LOGOUT</a></li>
                                </ul></li></ul>
                </div>
            <div id="main" style="background-image:url('images/umain.jpg'); background-repeat:no-repeat;background-size: cover; "></div>
            <div id="footer">
                <div id="lfooter">
                    Copyright &copy; to E-Study Zone
                </div>
                <div id="rfooter">
                    Developed By:Aradhana Kushwaha
                </div>
            </div>
        </div>
       
                <%
            }
                %>
                 </form>
    </body>
</html>
