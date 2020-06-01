package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CarritoDao;
import dao.DbConnection;
import dao.UsuarioDao;
import model.Carrito;
import model.Usuario;

/**
 * Servlet implementation class ZonaUsuario
 */
@WebServlet("/ZonaUsuario")
public class ZonaUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ZonaUsuario() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String accion = request.getParameter("accion");

		Carrito carrito = new Carrito();

		if (accion.contentEquals("addProd")) {
			int k = Integer.valueOf(request.getParameter("idprod"));
			double cant = Double.valueOf(request.getParameter("cantidad"));
			if (request.getSession().getAttribute("carrito") != null) {

				carrito = (Carrito) request.getSession().getAttribute("carrito");
				carrito.addCantidad(k, cant);

				request.getSession().setAttribute("carrito", carrito);

			} else {

				carrito.addCantidad(k, cant);
				request.getSession().setAttribute("carrito", carrito);

			}
			if ((request.getSession().getAttribute("userLoged")) != null) {

				DbConnection conn = new DbConnection();
				CarritoDao carDao = new CarritoDao(conn);
				int idUsuario = Integer.valueOf(((Usuario) request.getSession().getAttribute("userLoged")).getK());

				carDao.guardaCarrito(carrito, idUsuario);
				conn.disconnect();
				
			}
			
			request.getRequestDispatcher("/index.jsp").forward(request, response);

		} else if (accion.contentEquals("verCarrito")) {
			request.getRequestDispatcher("/verCarrito.jsp").forward(request, response);
		} else if (accion.contentEquals("personal")) {
			request.getRequestDispatcher("/personal.jsp").forward(request, response);
		} else if (accion.contentEquals("modificarDatos")) {
			request.getRequestDispatcher("/modificarDatos.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getParameter("accion").contentEquals("actualizaDatos")) {
			Usuario user = (Usuario) request.getSession().getAttribute("userLoged");
			user.setNombre(request.getParameter("nombre"));
			user.setApellido(request.getParameter("apellido"));
			user.setDireccion(request.getParameter("direccion"));
			user.setTelefono(request.getParameter("telefono"));
			request.getSession().setAttribute("userLoged", user);
			
			DbConnection conn = new DbConnection();
			UsuarioDao usuDao = new UsuarioDao(conn);
			usuDao.actualizaUsuario(user);
			conn.disconnect();
			
			
		}
		
		
		
		request.getRequestDispatcher("/modificacionOK.jsp").forward(request, response);
	}

}
