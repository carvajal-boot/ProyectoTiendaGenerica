package com.grupo38.tiendagenerica.DAO;

import java.sql.*;
import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.grupo38.tiendagenerica.DTO.ClienteVO;
import com.grupo38.tiendagenerica.DTO.ReporteVO;
import com.grupo38.tiendagenerica.DTO.UsuarioVO;


public class ReporteDAO {
	
	public ArrayList<ReporteVO> consultarReporte(Integer cliente) {

		// lista que contendra el o los usuarios obtenidos
		ArrayList<ReporteVO> listausuarios = new ArrayList<ReporteVO>();

		// instancia de la conexión
		Conexion conex = new Conexion();

		try {
			// prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection()
					.prepareStatement("SELECT * FROM ventas where cedula_cliente = ? ");

			// se cambia el comodin ? por el dato que ha llegado en el parametro de la
			// funcion
			consulta.setInt(1, cliente);

			// ejecute la sentencia
			ResultSet res = consulta.executeQuery();

			// cree un objeto basado en la clase entidad con los datos encontrados
			if (res.next()) {
				ReporteVO Usuario = new ReporteVO();
				Usuario.setCodigo_venta(Integer.parseInt(res.getString("codigo_venta")));
				Usuario.setCedula_cliente(Integer.parseInt(res.getString("cedula_cliente")));
				Usuario.setCedula_usuario(Integer.parseInt(res.getString("cedula_usuario")));
				Usuario.setIva_venta(Float.parseFloat(res.getString("iva_venta")));
				Usuario.setTotal_venta(Float.parseFloat(res.getString("correo_cliente")));
				Usuario.setValor_venta (Float.parseFloat(res.getString("correo_cliente")));
				listausuarios.add(Usuario);
			}

			// cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();
			
		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar el cliente");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar el cliente");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}
		return listausuarios;
	}
	
	
}






	
	
