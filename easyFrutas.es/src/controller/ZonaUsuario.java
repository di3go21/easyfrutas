package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CarritoDao;
import dao.DbConnection;
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

			CarritoDao carDao = new CarritoDao(new DbConnection());
			if ((request.getSession().getAttribute("userLoged")) != null) {
				int idUsuario = Integer.valueOf(((Usuario) request.getSession().getAttribute("userLoged")).getK());

				carDao.guardaCarrito(carrito, idUsuario);
			}

			request.getRequestDispatcher("/index.jsp").forward(request, response);

		} else if (accion.contentEquals("verCarrito"))
			request.getRequestDispatcher("/verCarrito.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
