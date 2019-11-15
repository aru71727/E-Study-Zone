
<%-- 
    Document   : userhome
    Created on : 25-Jul-2017, 10:51:13
    Author     : Aradhana
--%>

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
         <link href="css/userstyle.css" rel="stylesheet"/>
          <link href="css/menu.css" rel="stylesheet"/>
    </head>
    <body style="background-image:url('images/background.jpg'); background-repeat:no-repeat;background-size: cover; ">
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
                 <img src="images/logo1.png" width="1000" height="150"/>
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
                     String query="select student_name from student_registration where username='"+username+"'"; 
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
                        <li><a href="userhome.jsp">HOME</a></li>
                         <li><a href="download.jsp">DOWNLOAD</a></li>
                        <li><a href="postqus.jsp">DISCUSSION BOARD</a></li>
                        <li><a href="#">RESPONSE</a><ul>
                        <li><a href="review.jsp">REVIEW</a></li>
                        <li><a href="feedback.jsp">FEEDBACK</a></li>
                        <li><a href="complain.jsp">COMPLAIN</a></li></ul></li>
                        
                          <li><a href="changepassword.jsp">CHANGE PASSWORD</a></li>
                          <li><a href="logout.jsp">LOGOUT</a></li>
                    </ul>
                </div>
            <div id="main" style="background-image:url('images/umain.jpg'); background-repeat:no-repeat;background-size: cover; "> <br/><br/><br/><br/><br/>
                        <div style="width:560px;height:460px;background-color:#ccccff; background-image:url('images/download.jpg');background-repeat:no-repeat;background-size: cover; margin:0 auto">
                          <br/><br/><br/><br/> <center>
                        <h2 style="color:navy; font-weight: bold">SHOW MATERIAL</h2>
                        <br/><br/><br/>
                        <table  cellspacing="4px;" cellpadding="4px;" style="margin:0 auto;">
                            <tr>
                                <th>S.NO.</th>
                                <th>Subject</th>                                
                                <th>Description</th>
                                <th>Upload Date</th>
                                <th>Download</th>
                              
                            </tr>
                            <%
                            String q="select * from studymaterial";
                           ResultSet r=cm.selectQuery(q);
                           int n=1;
                           while(r.next())
                           {
                            %>
                            <tr>
                                <td><%=n%></td>
                                <td><%=r.getString(2)%></td>
                                <td><%=r.getString(3)%></td>
                                <th><%=r.getString(5)%></th>
                                <td><a target="_blank" href="<%=request.getContextPath()+"/upload/"+r.getString(4)%>">Download</a></td>
                           
                            </tr>
                            <%
                            n++;
                             }
                            %>
                        </table>
                    </center>
                        </div></div>
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
