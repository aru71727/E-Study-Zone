
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
       <form action="usercode/reviewcode.jsp" method="post">
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
                <div id="main" style="background-image:url('images/umain.jpg'); background-repeat:no-repeat;background-size: cover; ">
                     <br/><br/><br/>
                        <div style="width:560px;height:460px;background-color:#ccccff;margin:0 auto">
                          <br/><br/>
                          <h2 style="color:green;text-align:center">Please Give Review</h2>
                           <br/><br/>
                    <table cellspacing="8px;" cellpadding="8px;" style="margin:0 auto;">
                        <tr><td>Select the rating</td><td><select name="rating">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                </select></td></tr>
                        <tr><td>Enter Review Text :</td><td><textarea name="reviewtext"></textarea></td></tr>
                        <tr><td>&nbsp;</td><td><input type="submit" value="SUBMIT REVIEW" style="width:140px; height: 30px; "/></td></tr>
                    </table><br/><br/>
                    <h2 style="text-align: center; color:green;">
                        View All Reviews:</h2><br/><br/>
                    <table  cellspacing="4px;" cellpadding="4px;" style="margin:0 auto;">
                        <tr><th>ID</th>
                        <th>Posted By</th>
                        <th>Review Text</th>
                        <th>Rating</th>
                        <th>Posted Date</th>
                        </tr>
                        <% 
                        query="select * from review";
                        rs=cm.selectQuery(query);
                        while(rs.next())
                        {
                            %><tr>
                        <td><%=rs.getInt(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getInt(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        </tr>
                        <%}%>
                    </table>
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
