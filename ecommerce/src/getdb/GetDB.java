package getdb;
import java.sql.*;
public class GetDB 
{
	static Connection cn=null;
	static String driver="com.mysql.jdbc.Driver";
	static String url="jdbc:mysql://localhost:3306/ecommerce?useSSL=true";
	static String user="ecommerce";
	static String pass="ecommerce";
	
	public static Connection getCn(){
		try{
			Class.forName(driver);
			cn=DriverManager.getConnection(url,user,pass);
		}catch(Exception e){
			System.out.println(e);
		}
		return cn;
	}
}
