package com.grupo38.tiendagenerica.DTO;

import java.io.Serializable;

public class ClienteVO implements Serializable {
	
//	Identificar unico de las clases entidades
	private static final long serialVersionUID = 1L;
	
	private Integer cedula_cliente;
	public String direccion_cliente;
	public String nombre_cliente;
	public String telefono_cliente;
	public String correo_cliente;
	
	public Integer getCedula_cliente() {
		return cedula_cliente;		
	}
	public void setCedula_cliente(Integer cedula_cliente) {
		this.cedula_cliente = cedula_cliente;
	}
	public String getDireccion_cliente() {
		return direccion_cliente;
	}
	public void setDireccion_cliente(String direccion_cliente) {
		this.direccion_cliente = direccion_cliente;
	}
	public String getNombre_cliente() {
		return nombre_cliente;
	}
	public void setNombre_cliente(String nombre_cliente) {
		this.nombre_cliente = nombre_cliente;
	}
	public String getTelefono_cliente() {
		return telefono_cliente;
	}
	public void setTelefono_cliente(String telefono_cliente) {
		this.telefono_cliente = telefono_cliente;
	}
	public String getCorreo_cliente() {
		return correo_cliente;
	}
	public void setCorreo_cliente(String correo_cliente) {
		this.correo_cliente = correo_cliente;
	}
	
	
	
	
	
	
}