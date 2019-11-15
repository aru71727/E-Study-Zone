
<%@page import="MyPackage.CaptchaGenerator"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EStudyZone</title>
        <link href="css/generalStyle.css" rel="stylesheet"/>
          <link href="css/menu.css" rel="stylesheet"/>
        <script>
            
           
var img=['z.jpg','slide3.jpg','slide2.jpg','banner1.jpg','p.jpg'];
var i=0;
function slide()
{

var imgslide=document.getElementById("img1");
imgslide.src="images/"+img[i];
i++;

if(i===img.length)
{
i=0;
}
window.setTimeout("slide()",2000);
}
        </script>
    </head>
    <body onload="slide()" style="background-image:url('images/back.jpg'); background-repeat:no-repeat;background-size: cover;">
        <form action="code/student_registrationcode.jsp" method="post">

       
            <div id="wrapper">
                
                    <div id="banner">
                        <img src="images/logo1.png" width="1000" height="150"/>
                        
                    </div>
                 <div id="slider">
                <img id="img1" style="width:1000px;height:200px;"/>
                </div>
               
                <div id="menu">
                      <ul>
     <li><a href="index.jsp">HOME</a></li>
     
     <li><a href="registration.jsp">STUDENT</a></li>
     <li><a href="consultantregistration.jsp">CONSULTANT</a></li>
     
     <li><a href="login.jsp">LOGIN</a></li>
     <li><a href="enquiry.jsp">ENQUIRY</a></li>
    
 </ul>
                </div>
               
                
                    <div id="main"style="background-color: activecaption;"><br/><br/><br/>
                        <div style="width:560px;height:550px;background-color: buttonhighlight;margin:0 auto">

                          <br/><br/><br/>  <h2 style="text-align:center;"> STUDENT &nbsp;REGISTRATION</h2><br/><br/>
                          <strong>
                                <table cellspacing="5px;" cellpadding="5px;" style="margin:0 auto;">
                                    <tr><td> Student Name;</td><td><input type="text" name="stu_name"/></td></tr>
                             <tr><td>Gender:</td><td><input type="radio" name="gender" value="Male"/>Male
                                <input type="radio" name="gender" value="Female"/>Female</td></tr>
                             <tr><td> Address:</td><td><textarea name="address"></textarea></td></tr>
                              <tr><td>Qualification</td><td>
                                     <select name="qualification">
                                         <option>-Select-</option>
                                          <option>B.C.A</option>
                                          <option>B.TECH</option>
                                          <option>M.TECH</option>
                                          <option>M.C.A</option>
                                          <option>Diploma</option>
                                     </select>
                                     
                                 </td></tr>
                             <tr><td>Training Type</td><td>
                                     <select namme="training_type">
                                         <option>-Select-</option>
                                          <option>Summer Training</option>
                                          <option>Industrial Training</option>
                                          <option>Vocational Training</option>
                                          <option>Winter Training</option>
                                          <option>Apprentiship Training</option>
                                     </select>
                                     
                                </td></tr>
                              <tr><td> College Name:</td><td><input type="text" name="college_name"/></td></tr>
                             <tr><td>Contact No.:</td><td><input type="number" name="contactno"/></td></tr>
                             <tr><td>Email Address: </td><td><input type="text" name="emailaddress"/></td></tr>
                            <tr><td>Guardian Contact No.:</td><td><input type="number" name="gcontactno"/></td></tr>
                            <tr><td>User Name:</td><td><input type="text" name="username"/></td></tr>
                             <tr><td>Password:</td><td><input type="password" name="password"/></td></tr>
                                     <tr><td>Captcha:</td><td>
                                <%
                                 CaptchaGenerator c=new CaptchaGenerator();
                                 String capcode=c.CaptchaCode();
                                %>
                                <h3><strike><%=capcode%></strike></h3>
                               <input type="hidden" name="capcode" value="<%=capcode%>"/>
                                 </td>
                                       </tr>
                              <tr><td>Enter Captcha Code:</td><td><input type="text" name="captchacode"/></td></tr>
                             <tr></tr>
                            <tr><td>&nbsp;</td><td><input type="submit" value="SUBMIT" style="width:100px; height: 28px; "/></td></tr>
                                </table>
                          </strong>
                    </div>
                </div>
               <div id="footer">
                <div id="footer1"><br/>
	  <h3 align="center">Image Gallery</h3>
	 <center>
             <a href="footer4.jpg"><img src="images/footer4.jpg" height="50px" width="60px"/></a>
	 <a href="footer1.jpg"><img src="images/footer1.jpg" height="50px" width="60px"/></a>
	 <a href="footer2.jpg"><img src="images/footer2.jpg" height="50px" width="60px"/></a><br/>
	 <a href="footer3.jpg"><img src="images/footer3.jpg" height="50px" width="60px"/></a>
	 <a href="footer4.jpg"><img src="images/footer4.jpg" height="50px" width="60px"/></a>
         <a href="footer1.jpg"><img src="images/footer1.jpg" height="50px" width="60px"/></a>
	<br/>
	 
	 <a href="">More <a></center>
	  </div>
	 
	  <div id="footer2"><br/>
	 <center> <h3>Developed By: Aradhana Kushwaha</h3>
	  <p style="line-height:25px; text-align:center; ">To contact us kindly
	  email me at <a href="">kush.aradhana007@gmail.com</a><br/>
	  <a href="http//www.google.co.in">Help</a><br/>
	  +917084444893, +919415890009<br/>
	  Lucknow - 226016  <br/>
          Copyright &copy to e-studyzone </p> </center>
	  
	  </div>
            </div>
            </div>
             
        </form>
    </body>
</html>

