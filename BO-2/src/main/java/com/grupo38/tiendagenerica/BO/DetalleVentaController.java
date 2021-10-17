package com.grupo38.tiendagenerica.BO;

import java.util.ArrayList;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo38.tiendagenerica.DAO.DetalleVentaDAO;
import com.grupo38.tiendagenerica.DTO.Detalle_ventasVO;


@RestController
public class DetalleVentaController {
	
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */

	@PostMapping("/registrardetalleventa")
	public void registrarVenta(Detalle_ventasVO venta) {
		DetalleVentaDAO Dao = new DetalleVentaDAO();
		Dao.registrarDetalleVenta(venta);
	}

	@GetMapping("/listardetalleventas")
	public ArrayList<Detalle_ventasVO> listaDeVentas() {
		DetalleVentaDAO Dao = new DetalleVentaDAO();
		return Dao.listaDeDetalleVenta();
	}

	@DeleteMapping("/eliminardetalleventa")
	public void eliminarVenta(Integer codigo_venta) {
		DetalleVentaDAO Dao = new DetalleVentaDAO();
		Dao.eliminarDetalleVenta(codigo_venta);
	}

	@PutMapping("/actualizardetalleventa")
	public void actualizarVenta(Detalle_ventasVO venta) {
		DetalleVentaDAO Dao = new DetalleVentaDAO();
		Dao.actualizarDetalleVenta(venta);
	}
	
	
	@GetMapping("/contadordetalleventa")
	public Integer contadorVentas() {
		DetalleVentaDAO Dao = new DetalleVentaDAO();
		return Dao.contadorDetalleVenta();
	}
	
	

}
