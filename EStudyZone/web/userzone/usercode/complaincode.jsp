
<%@page import="MyPackage.ConnectionManager"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%
    String name="",emailaddress="";
    long contactno=0;
    ResultSet rs=null;
    String complaintext=request.getParameter("complaintext");
    ConnectionManager cm= new ConnectionManager();
      rs=cm.selectQuery("select nvl(max(id),0)+1 from complain");
      rs.next();
    int id=rs.getInt(1);
    String username=session.getAttribute("username").toString();
    String query="select student_name,contactno,emailaddress from student_registration where username='"+username+"'";
    rs=cm.selectQuery(query);
    if(rs.next())
    {
        name=rs.getString(1);
        contactno=rs.getLong(2);
        emailaddress=rs.getString(3);
    }
    SimpleDateFormat df=new SimpleDateFormat("dd/MM/yyyy");
    String feedbackdt=df.format(new Date());
    query="insert into complain values("+id+",'"+name+"',"+contactno+",'"+emailaddress+"','"+complaintext+"','"+feedbackdt+"')";
    if(cm.executeNonQuery(query))
    {
        out.print("<script>alert('Your complain is Submitted');window.location.href='../complain.jsp'</script>");
    }
    else
    {
        out.print("<script>alert('Database Error');window.location.href='../complain.jsp'</script>");
    }
%>