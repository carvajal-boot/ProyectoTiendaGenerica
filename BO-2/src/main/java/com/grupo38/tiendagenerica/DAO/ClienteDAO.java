package com.grupo38.tiendagenerica.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.grupo38.tiendagenerica.DTO.ClienteVO;

public class ClienteDAO {
	
	/**
	 * Permite registrar un Usuario nuevo
	 * 
	 * @param user
	 */

	public void registrarCliente(ClienteVO user) {
		// llama y crea una instancia de la clase encargada de hacer la conexión
		Conexion conex = new Conexion();

		try {
			// sentencia que se ejecutara en la base de datos
			Statement estatuto = conex.getConnection().createStatement();

			// String que contiene la sentencia insert a ejecutar
			String sentencia = "INSERT INTO clientes VALUES(" + user.getCedula_cliente() + "," + "'"
					+ user.getDireccion_cliente() + "'," + "'" + user.getNombre_cliente() + "'," + "'" + user.getTelefono_cliente()
					+ "'," + "'" + user.getCorreo_cliente() + "'" + ");";

			// se ejecuta la sentencia en la base de datos
			estatuto.executeUpdate(sentencia);
			// impresión en consola para verificación
			System.out.println("Registrado " + sentencia);
			// cerrando la sentencia y la conexión
			estatuto.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo insertar el cliente");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo insertar el cliente");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

	/**
	 * permite consultar el Usuario asociado al user enviado como parametro
	 * 
	 * @param documento
	 * @return
	 */
	public ArrayList<ClienteVO> consultarCliente(Integer usuario) {

		// lista que contendra el o los usuarios obtenidos
		ArrayList<ClienteVO> listausuarios = new ArrayList<ClienteVO>();

		// instancia de la conexión
		Conexion conex = new Conexion();

		try {
			// prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection()
					.prepareStatement("SELECT * FROM clientes where cedula_cliente = ? ");

			// se cambia el comodin ? por el dato que ha llegado en el parametro de la
			// funcion
			consulta.setInt(1, usuario);

			// ejecute la sentencia
			ResultSet res = consulta.executeQuery();

			// cree un objeto basado en la clase entidad con los datos encontrados
			if (res.next()) {
				ClienteVO Usuario = new ClienteVO();
				Usuario.setCedula_cliente(Integer.parseInt(res.getString("cedula_cliente")));
				Usuario.setDireccion_cliente(res.getString("direccion_cliente"));
				Usuario.setNombre_cliente(res.getString("nombre_cliente"));
				Usuario.setTelefono_cliente(res.getString("telefono_cliente"));
				Usuario.setCorreo_cliente(res.getString("correo_cliente"));
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

	/**
	 * permite consultar la lista de todos los usuarios
	 * 
	 * @return
	 */
	public ArrayList<ClienteVO> listaDeClientes() {
		// lista que contendra el o los usuarios obtenidos
		ArrayList<ClienteVO> listausuarios = new ArrayList<ClienteVO>();

		// instancia de la conexión
		Conexion conex = new Conexion();

		try {
			// prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM clientes");

			// ejecute la sentencia
			ResultSet res = consulta.executeQuery();

			// cree un objeto para cada encontrado en la base de datos basado en la clase
			// entidad con los datos encontrados
			while (res.next()) {
				ClienteVO Usuario = new ClienteVO();
				Usuario.setCedula_cliente(Integer.parseInt(res.getString("cedula_cliente")));
				Usuario.setDireccion_cliente(res.getString("direccion_cliente"));
				Usuario.setNombre_cliente(res.getString("nombre_cliente"));
				Usuario.setTelefono_cliente(res.getString("telefono_cliente"));
				Usuario.setCorreo_cliente(res.getString("correo_cliente"));

				listausuarios.add(Usuario);
			}

			// cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todos los clientes");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todos los clientes");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

		return listausuarios;
	}

	public void eliminarCliente(Integer cedula_cliente) {

		// instancia de la conexion
		Conexion conex = new Conexion();

		try {
			// sentencia inicializada
			Statement consulta = conex.getConnection().createStatement();

			// preparando sentencia a realizar
			String sentencia = "delete from clientes where cedula_cliente=" + cedula_cliente + ";";

			// impresion de verificación
			System.out.println("Registrado " + sentencia);

			// ejecutando la sentencia en la base de datos
			consulta.execute(sentencia);

			// cerrando sentencia y conexión
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar el cliente");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar el cliente");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

	public void actualizarCliente(ClienteVO user) {

		// instancia de conexion
		Conexion conex = new Conexion();

		try {
			// inicializando sentencia
			Statement estatuto = conex.getConnection().createStatement();

			// String con la sentencia a ejecutar			
			String sentencia = "UPDATE clientes " 
			+ "SET direccion_cliente = '" + user.getDireccion_cliente() + "',"
			+ "nombre_cliente = '" + user.getNombre_cliente() + "',"
			+ "telefono_cliente = " + user.getTelefono_cliente() + ","
			+ "correo_cliente = '" + user.getCorreo_cliente() + "'"
		    + "WHERE cedula_cliente = " + user.getCedula_cliente() + ";";

			// ejecuta la sentencia
			estatuto.executeUpdate(sentencia);

			// verificación por consola de la sentencia
			System.out.println("Registrado " + sentencia);

			// cerrando sentencia y conexión
			estatuto.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo actualizar  el cliente");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar el cliente");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

//		

}
