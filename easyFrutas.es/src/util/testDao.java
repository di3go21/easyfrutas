package util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dao.DbConnection;

public class testDao {
	
public static void main(String[] args) throws SQLException {
	
	DbConnection con = new DbConnection();
	
	Statement st = con.getConnection().createStatement();
	ResultSet rs= st.executeQuery("select * from eproducto");
	
	while (rs.next()) {
		System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4));
	}
	
	con.disconnect();
	
}

}
