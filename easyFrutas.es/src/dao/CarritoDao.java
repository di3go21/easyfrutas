package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import model.Carrito;

public class CarritoDao {

	private DbConnection conn;

	public CarritoDao(DbConnection conn) {
		super();
		this.conn = conn;
	}

	public Carrito recuperaCarrito(int k) {

		String consulta = "select * from ecarrito where xusuario=?";
		try {
			PreparedStatement ps = this.conn.getConnection().prepareStatement(consulta);
			ps.setInt(1, k);
			ResultSet rs = ps.executeQuery();
			Carrito cart = new Carrito();
			while (rs.next()) {
				cart.addCantidad(rs.getInt(2), rs.getDouble(3));
			}

			return cart;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

	public void guardaCarrito(Carrito cart, int k) {

		String consultaBorrar = "delete from ecarrito where xusuario=?";
		String consultaAddCarrito = "insert into ecarrito values (?,?,?)";

		try {
			PreparedStatement ps = this.conn.getConnection().prepareStatement(consultaBorrar);
			ps.setInt(1, k);
			ps.execute();

			ps = this.conn.getConnection().prepareStatement(consultaAddCarrito);
			ps.setInt(1, k);

			for (Map.Entry<Integer, Double> entry : cart.getCarrito().entrySet()) {
				ps.setInt(2, entry.getKey());

				ps.setDouble(3, entry.getValue());
				ps.execute();
				System.out.println("insert "+k+" "+entry.getKey()+" "+entry.getValue());
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	

}
