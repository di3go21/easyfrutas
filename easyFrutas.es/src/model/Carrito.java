package model;

import java.util.HashMap;

public class Carrito {

	private HashMap<Integer, Double> carrito;

	public HashMap<Integer, Double> getCarrito() {
		return carrito;
	}

	public void setCarrito(HashMap<Integer, Double> carrito) {
		this.carrito = carrito;
	}

	public Carrito(HashMap<Integer, Double> carrito) {
		super();
		this.carrito = carrito;
	}

	public void addCantidad(int k, double cant) {
		Double anterior = 0.0;
		try {
			anterior = this.carrito.get(k);
		} catch (NullPointerException e) {

		}
		if (anterior == null)
			this.carrito.put(k, (cant));
		else {
			this.carrito.put(k, (cant+anterior));
		}

	}

	@Override
	public String toString() {
		return "Carrito [carrito=" + carrito + "]";
	}

	public Carrito() {
		super();
		this.carrito = new HashMap<Integer, Double>();

	}


}
