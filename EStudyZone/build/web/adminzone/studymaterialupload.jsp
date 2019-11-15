

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
          
            <%
            if(session.getAttribute("adminid")=="" ||session.getAttribute("adminid")==null)
            {
                response.sendRedirect("../login.jsp");
            }
           
            else
            {
            %>
            <form action="../upload" method="post" enctype="multipart/form-data">
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
            <div id="main" style="background-image:url('images/1.jpg'); background-repeat:no-repeat;background-size: cover; ">
                <center><br/>
                    <br/><br/><br/>
                    <h2 style="color:navy;font-weight: bold;">    <u>    UPLOAD STUDY MATERIAL</u></h2><br/><br/>
                </center>
                
                
                <table  cellspacing="8px;" cellpadding="8px;" style="margin:0 auto;"><tr><th>Subject</th>
                    <td><input type="text" name="subject" required=""/></td>
               </tr>
               <tr><th>Description</th>
                   <td><textarea name="description" required=""></textarea></td></tr>
               <tr><th>Upload File</th>
                   <td><input type="file" name="file" required=""/></td></tr>
               <tr><td colspan="2" align="center"><input type="submit" value="Upload"/>
                   </td></tr>
                </table>  
                        <br/><br/><br/>
                        <table  cellspacing="8px;" cellpadding="8px;" style="margin:0 auto;">
                            <tr>
                                <th>S.NO.</th>
                                <th>Subject</th>                                
                                <th>Description</th>
                                <th>Upload Date</th>
                                <th>Download</th>
                                <th>Delete</th>
                            </tr>
                            <%
                            ConnectionManager cm=new ConnectionManager();
                            String q="select * from studymaterial";
                           ResultSet rs=cm.selectQuery(q);
                           int n=1;
                           while(rs.next())
                           {
                            %>
                            <tr>
                                <td><%=n%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <th><%=rs.getString(5)%></th>
                                <td><a target="_blank" href="<%=request.getContextPath()+"/upload/"+rs.getString(4)%>">Download</a></td>
                                <td><a href="admincode/deluploadcode.jsp?id=<%=rs.getString(1)%>">Delete</a>                             
                            </tr>
                            <%
                            n++;
                             }
                            %>
                        </table>
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
