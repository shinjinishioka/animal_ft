package animal_ft;
import java.sql.*;
import java.time.temporal.ChronoUnit;
import java.time.LocalDate;


public class UranaiDAO {

  private Connection conn;

  public UranaiDAO() throws ClassNotFoundException, SQLException{

    Class.forName("com.mysql.jdbc.Driver");
    String strConn = "jdbc:mysql://localhost/animal_ft"
                   + "?user=Mulder&password=TrustNo1"
                   + "&useUnicode=true&characterEncoding=MS932";
    conn = DriverManager.getConnection(strConn);
  }

 public void close() {
    try{conn.close();}catch(SQLException e){e.printStackTrace();}
  }
  public int kansan(int year,int month,int day){

  	  LocalDate sinceGraduation = LocalDate.of(1985,1,1);
      LocalDate currentDate = LocalDate.of(year,month,day);

      long diffInDays = ChronoUnit.DAYS.between(sinceGraduation,
            currentDate);
 
       System.out.println(diffInDays);
  	  int id = (int)(diffInDays+36)%60+1;

  	  if (id == 0){
  	  	id = 60;
  	  }
  	  
  	  int kansan_id = Math.abs(id);
  	  
  	  return kansan_id; 	  
  }
  
  public UranaiDTO getDetailById(int kansan_id,String sex) throws SQLException{
   UranaiDTO ent = null;
    Statement      stmt = null;
    ResultSet      rs   = null;
    try{
      stmt = conn.createStatement();
 	String strSql = 
 				"SELECT " +
                "details.60id," +
                "details.sex," +
                "60animals.name AS 60name," +
                "12animals.name AS 12name," + 
                "12animals.picture," +
                "details.detail," +

                "details.lover_12id," +
                "lover_12animals.name," +
                "lover_12animals.picture," +
                "details.lover_detail," +

                "details.friend_12id," +
                "friend_12animals.name," +
                "friend_12animals.picture," +
                "details.friend_detail," +

                "details.work_12id," +
                "work_12animals.name," +
                "work_12animals.picture," +
                "details.work_detail" +

                " FROM details" +
                " JOIN 60animals ON details.60id = 60animals.60id" +
                " JOIN 12animals ON 60animals.12id = 12animals.12id" +
                " JOIN 12animals lover_12animals ON details.lover_12id = lover_12animals.12id" +
                " JOIN 12animals friend_12animals ON details.friend_12id = friend_12animals.12id" +
                " JOIN 12animals work_12animals ON details.work_12id = work_12animals.12id" +
                " WHERE details.60id = " + kansan_id +
                " AND details.sex = '" + sex + "'";

      rs=stmt.executeQuery(strSql);

      if(rs.next()){
        ent = new UranaiDTO(      
                    0, rs.getInt("60id"),
                    rs.getString("12name"), rs.getString("60name"), rs.getString("detail"),
                    rs.getString("12animals.picture"),
                    rs.getInt("lover_12id"),rs.getString("lover_detail"),rs.getString("lover_12animals.picture"),
                    rs.getInt("friend_12id"),rs.getString("friend_detail"),rs.getString("friend_12animals.picture"), 
                    rs.getInt("work_12id"), rs.getString("work_detail"),rs.getString("work_12animals.picture"),
                    rs.getString("lover_12animals.name"),rs.getString("friend_12animals.name"),rs.getString("work_12animals.name")
                 );
                 
//        ent = new UranaiDTO(      
//                    rs.getInt("12id"), rs.getInt("60id"),
//                    rs.getString("12name"), rs.getString("60name"), rs.getString("detail"),
//                    rs.getString("12animals.picture"),
//                    rs.getInt("lover_12id"),rs.getString("lover_detail"),rs.getString("lover_12animals.picture"),
//                    rs.getInt("friend_12id"),rs.getString("friend_detail"),rs.getString("friend_12animals.picture"), 
//                    rs.getInt("work_12id"), rs.getString("work_detail"),rs.getString("work_12animals.picture")
//                 );

      }
      
    }catch(SQLException e){
    	System.out.print("ÉGÉâÅ[Åö");
    	
    }finally{
      try{rs.close();}catch(SQLException e){e.printStackTrace();}
      try{stmt.close();}catch(SQLException e){e.printStackTrace();}
    }
    
    return ent;
  }
}
