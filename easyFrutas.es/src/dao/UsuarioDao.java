package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Usuario;

public class UsuarioDao {
	private DbConnection conn;

	public UsuarioDao(DbConnection conn) {
		super();
		this.conn = conn;
	}
	
	public Usuario logueo(String email, String pass) {
		String sql= "select * from eusuario where asemail=? and ascontrasenia=md5(?) ";
		try {
			PreparedStatement ps = conn.getConnection().prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
			Usuario user = new Usuario(rs.getString(1));
			user.setNombre(rs.getString(2));
			user.setApellido(rs.getString(3));
			user.setEmail(email);
			return user;
			}
			else {
				System.out.println("log erroneo");
				return null;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("error en la consulta de log");
			return null;
		}
		
	}
	
	

}
