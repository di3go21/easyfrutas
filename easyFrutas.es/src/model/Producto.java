package model;

public class Producto {
	
	private int k;
	private String nombre;
	private double precio;
	private double stock;
	
	public  Producto(int k) {
		super();
		this.k = k;
	}
	
	
	public Producto(String nombre) {
		super();
		this.nombre = nombre;
	}


	public int getK() {
		return k;
	}
	public void setK(int k) {
		this.k = k;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public double getStock() {
		return stock;
	}
	public void setStock(double strock) {
		this.stock = strock;
	}
	@Override
	public String toString() {
		return "Producto [k=" + k + ", nombre=" + nombre + ", precio=" + precio + ", stock=" + stock + "]";
	}
	
	
	
	
	
	

}
