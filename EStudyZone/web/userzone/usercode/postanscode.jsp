<%@page import="java.sql.ResultSet"%>
<%@page import="MyPackage.ConnectionManager"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
    String qid=request.getParameter("qid");
String atext=request.getParameter("atext");
String userid=session.getAttribute("username").toString();
String username=session.getAttribute("username").toString();
SimpleDateFormat df=new SimpleDateFormat("dd/MM/yyyy");
String currentdate=df.format(new Date());
ConnectionManager cm=new ConnectionManager();
ResultSet rs=cm.selectQuery("select nvl(max(aid),0)+1 from ans");
rs.next();
int id=rs.getInt(1);
String query="insert into ans values("+id+","+qid+"'"+atext+"','"+userid+"','"+username+"','"+currentdate+"')";
cm.executeNonQuery(query);
response.sendRedirect("../postqus.jsp");


%>