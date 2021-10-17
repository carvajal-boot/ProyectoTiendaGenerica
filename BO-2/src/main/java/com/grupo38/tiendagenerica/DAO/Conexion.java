package com.grupo38.tiendagenerica.DAO;

import java.sql.*;
public class Conexion {
	
	/** Parametros de conexion */
	static String nombre_base_datos = "tiendaGenerica";
	static String usuariobd = "root";
	static String clavebd = "Camilo.84$";
//	jdbc:mysql://tiendasgenericasdr-g9-g38-53.czo3ixoe3xoe.us-east-1.rds.amazonaws.com
	static String url = "jdbc:mysql://127.0.0.1/" + nombre_base_datos;
	
	//objeto sin inicializar de la conexión
	Connection connection = null;

	/** Constructor de DbConnection */
	public Conexion() {
		try {
			// obtenemos el driver de para mysql
			Class.forName("com.mysql.cj.jdbc.Driver");
			// obtenemos la conexión
			connection = DriverManager.getConnection(url, usuariobd, clavebd);
			
			//si hay conexión correcta mostrar información en consola
			if (connection != null) {
				System.out.println("Conexión a base de datos " + nombre_base_datos + " OK\n");
			}
		
		} catch (SQLException e) {
			//error de la base de datos
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			//error en carga de clases
			System.out.println(e);
		} catch (Exception e) {
			//cualquier otro error
			System.out.println(e);
		}
	}

	/** Permite retornar la conexión */
	public Connection getConnection() {
		return connection;
	}
	
	//cerrando la conexión
	public void desconectar() {
		connection = null;
	}

}
