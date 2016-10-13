package Form1;
import java.sql.*;
public class Jdbc1 {
	public static Connection gettingConnection() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/testDB","root","abracadabra");
		return cn;
	}
	public static boolean addDetail(String name, String password) throws Exception
	{
		PreparedStatement ps=gettingConnection().prepareStatement("insert into UserData(id,name,password)values(null,?,?)");
		ps.setString(1,name);
		ps.setString(2, password);
		int flag=ps.executeUpdate();
		ps.close();
		if(flag>0)
			return true;
		return false;
	}
}
