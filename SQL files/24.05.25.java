package connection;

import java.sql.*;

public class DB_CLASS {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vit","root","Siddharth14");
			Statement stmt =con.createStatement();
			
			ResultSet rs=stmt.executeQuery("select * from worker");
			while(rs.next())
				
			System.out.println(rs.getInt(1) + "  " +rs.getString(2)+ "  " +rs.getString(3));
			con.close();
		}
		catch(Exception e){
			System.out.println("sorry");
		}
		ackage crud_operation;

		import java.sql.Connection;
		import java.sql.DriverManager;

		public class DB_connection {

			public static void main(String[] args) {
				DB_connection obj_DB_Connection=new DB_connection();
				System.out.println(obj_DB_Connection.get_connection());
				

			}
			public Connection get_connection(){
				Connection connection = null;
				try{
					Class.forName("com.mysql.cj.jdbc.Driver");
					connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/vit","root","Siddharth14");
					
				}
				catch(Exception e){
					System.out.println(e);
				}
				return connection;
			}
		}

	}


