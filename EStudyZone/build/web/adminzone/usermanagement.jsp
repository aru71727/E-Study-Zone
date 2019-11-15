

<%@page import="java.sql.ResultSet"%>
<%@page import="MyPackage.ConnectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="css/adminstyle.css" rel="stylesheet"/>
          <link href="css/menu.css" rel="stylesheet"/>
    </head>
    <body style="background-image:url('images/back.jpg'); background-repeat:no-repeat;background-size: cover; ">
        <form action="admincode/usermanagementcode.jsp">
            <%
            if(session.getAttribute("adminid")=="" ||session.getAttribute("adminid")==null)
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
            <div id="menu">
                 <ul>
                     <li title="HOME PAGE"><a href="adminhome.jsp">HOME</a></li>
                        <li><a href="usermanagement.jsp">USER MANAGEMENT</a></li>
                        <li><a href="#">RESPONSE</a>
                       <ul>
     <li title="COMPLAIN MANAGEMENT"><a href="#">COMPLAIN</a></li>
     <li title="FEEDBACK MANAGEMENT"><a href="feedbackmanagement.jsp">FEEDBACK</a></li>
       <li title="ENQUIRY MANAGEMENT"><a href="#">ENQUIRY</a></li>
     <li title="REVIEW MANAGEMENT"><a href="#">REVIEW</a></li>
         </ul></li>
         <li title="UPLOAD MATERIAL"><a href="studymaterialupload.jsp">UPLOAD</a></li>
        <li><a href="#">SETTINGS</a>
         <ul>
             <li><a href="adminchangepassword.jsp">CHANGE PASSWORD</a></li>
     <li><a href="adminlogout.jsp">LOGOUT</a></li>
         </ul>
         </li>            
    </ul>
     
            </div>
            <div id="main" style="background-image:url('images/1.jpg'); background-repeat:no-repeat;background-size: cover; "v>
                 <center> <br/><br/><br/>
                     <h2 style="color:blue;"><u>USER MANAGEMENT</u></h2>
                    <br/><br/><br/>
                    <table>
                        <tr>
                            <th>S.NO.</th>
                            <th>STUDENT NAME</th>
                            <th>GENDER</th>
                            <th>ADDRESS</th>
                            <th>COLLEGE NAME</th>
                            <th>QUALIFICATION</th>
                           
                            <th>CONTACT NO.</th>
                            <th>EMAIL ADDRESS</th>
                            <th>REGISTRATION DATE</th>
                            <th>DELETE</th>
                        </tr>
                <%
                int n=1;
                ConnectionManager cm=new ConnectionManager();
                String q="select * from student_registration";
                ResultSet rs=cm.selectQuery(q);
                while(rs.next())
                {
                %>
                                
              
                
             <tr>
                 <td><%=n%> </td>
                  <td><%=rs.getString(1)%> </td>
                 <td><%=rs.getString(2)%> </td>
                 <td><%=rs.getString(3)%> </td>
                 <td><%=rs.getString(6)%> </td>
                 <td><%=rs.getString(4)%> </td>
                  <td><%=rs.getString(7)%> </td>
                 <td><%=rs.getString(8)%> </td>     
                  <td><%=rs.getString(12)%> </td>
                 <td><a href="admincode/usermanagementcode.jsp?username=<%=rs.getString(10)%>">delete</a></td>
                        </tr>
                 <%
                 n++;
                }
                 %>                               
                    </table>
                    
                </center>
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
        
                <%
            }
                %>
                 </form>
    </body>
</html>
