package model;

public class Articulo {
	
	private String articulo;
	private double cantidad;
	private double precio;
	
	
	public Articulo(String articulo, double cantidad, double precio) {
		super();
		this.articulo = articulo;
		this.cantidad = cantidad;
		this.precio = precio;
	}
	public String getArticulo() {
		return articulo;
	}
	public void setArticulo(String articulo) {
		this.articulo = articulo;
	}
	public double getCantidad() {
		return cantidad;
	}
	public void setCantidad(double cantidad) {
		this.cantidad = cantidad;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	@Override
	public String toString() {
		return "Articulo [articulo=" + articulo + ", cantidad=" + cantidad + ", precio=" + precio + "]";
	}
	
	
	
	

}
