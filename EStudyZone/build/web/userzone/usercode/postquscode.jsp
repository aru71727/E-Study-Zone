<%@page import="java.sql.ResultSet"%>
<%@page import="MyPackage.ConnectionManager"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
String qus=request.getParameter("qus");
String userid=session.getAttribute("username").toString();
String username=session.getAttribute("username").toString();
SimpleDateFormat df=new SimpleDateFormat("dd/MM/yyyy");
String currentdate=df.format(new Date());
ConnectionManager cm=new ConnectionManager();
ResultSet rs=cm.selectQuery("select nvl(max(quid),0)+1 from qus");
rs.next();
int id=rs.getInt(1);
String query="insert into qus values("+id+",'"+qus+"','"+userid+"','"+username+"','"+currentdate+"')";
cm.executeNonQuery(query);
response.sendRedirect("../postqus.jsp");


%>