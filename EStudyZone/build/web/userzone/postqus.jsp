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
        <form action="usercode/postquscode.jsp" method="post">
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
                 
                    <br/>  <br/>
                    <div style="width:560px;height:460px;background-color: cadetblue;margin:0 auto"><br/><br/>  <h2 style=" color:#003332; text-align:center;"><u>POST FORM</u></h2>
                                    <br/><br/>
                                <table cellspacing="10px" style="margin:0 auto">
                                    <tr><td>Enter Question : </td><td><textarea name="qus" style="height: 125px;width:200px;"></textarea></td></tr>
                           
                            <tr><td>&nbsp;</td><td><input type="submit" value="POST QUESTION" style="width:140px; height: 30px; "/></td></tr>
                                </table>
                                    <br/>`
                                      <table cellspacing="10px" style="margin:0 auto">
                                        <tr><th>S NO.</th>
                                            <th>Question</th>
                                            <th>User ID</th>
                                            <th>User Name</th>
                                            <th>Post Date</th>
                                            <th>Reply</th>
                                            <th>Show</th>
                                        </tr><tr></tr>
                                        <%
                                        int n=1;
                                        String q="select * from qus order by quid desc";
                                       ResultSet qrs= cm.selectQuery(q);
                                       while(qrs.next())
                                       {  %>
                                       <tr>
                                           <td><%=n%></td>
                                           <td><%=qrs.getString("qtext")%></td>
                                             <td><%=qrs.getString("userid")%></td>
                                               <td><%=qrs.getString("username")%></td>
                                                 <td><%=qrs.getString("cdate")%></td>
                                                 <td><a href="postans.jsp?qid=<%=qrs.getInt("quid")%>&qtext">Reply</a></td>
                                                  <td><a href="#">show</a></td>
                                           
                                       </tr>
                                       
                                       <%
                                       n++;
                                       }%>
                                    </table>
                             
                    </div>      
                     </div>     
        
            <div id="footer">
                <div id="lfooter">
                    Copyright &copy; to E-Study Zone
                </div>
                <div id="rfooter">
                    Developed By:Aradhana Kushwaha
                </div>
            </div>
       </div>
        </form>
                <%
            }
                %>
    </body>
</html>
