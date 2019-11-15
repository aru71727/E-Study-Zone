

package MyPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Aradhana
 */
public class ConnectionManager {
  Connection con=null;
  PreparedStatement ps=null;
  ResultSet rs=null;
  
  private void getConnection()throws ClassNotFoundException, SQLException
   {
    Class.forName("oracle.jdbc.OracleDriver");   
 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","abc","abc");
 
  }
   public boolean executeNonQuery(String query) 
   {
     try
     {
         getConnection();
     ps=con.prepareStatement(query);
     ps.executeUpdate();
     return true;
     }
    catch(SQLException | ClassNotFoundException ex1)
     {
         
         return false;
     }
 }
 public ResultSet selectQuery(String query) throws SQLException, ClassNotFoundException
 {
  getConnection();
    ps=con.prepareStatement(query);
    rs=ps.executeQuery();
    return rs;
 }
}
