package com.grupo38.tiendagenerica.DTO;

import java.io.Serializable;

public class ReporteVO implements Serializable {

	int codigo_venta;
	int cedula_usuario;
	int cedula_cliente;
	float iva_venta;
	float total_venta;
	float valor_venta;
	

	public int getCodigo_venta() {
		return codigo_venta;
	}

	public void setCodigo_venta(int codigo_venta) {
		this.codigo_venta = codigo_venta;
	}

	public int getCedula_cliente() {
		return cedula_cliente;
	}

	public void setCedula_cliente(int cedula_cliente) {
		this.cedula_cliente = cedula_cliente;
	}

	public int getCedula_usuario() {
		return cedula_usuario;
	}

	public void setCedula_usuario(int cedula_usuario) {
		this.cedula_usuario = cedula_usuario;
	}

	public float getIva_venta() {
		return iva_venta;
	}

	public void setIva_venta(float iva_venta) {
		this.iva_venta = iva_venta;
	}

	public float getTotal_venta() {
		return total_venta;
	}

	public void setTotal_venta(float total_venta) {
		this.total_venta = total_venta;
	}

	public float getValor_venta() {
		return valor_venta;
	}

	public void setValor_venta(float valor_venta) {
		this.valor_venta = valor_venta;
	}

	

}
