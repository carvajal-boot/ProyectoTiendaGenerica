package com.grupo38.tiendagenerica.BO;

import java.util.ArrayList;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo38.tiendagenerica.DAO.VentaDAO;
import com.grupo38.tiendagenerica.DTO.VentasVO;


@RestController
public class VentaController {
	
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */

	@PostMapping("/registrarventa")
	public void registrarVenta(VentasVO venta) {
		VentaDAO Dao = new VentaDAO();
		Dao.registrarVenta(venta);
	}

	@GetMapping("/listarventas")
	public ArrayList<VentasVO> listaDeVentas() {
		VentaDAO Dao = new VentaDAO();
		return Dao.listaDeVentas();
	}

	@DeleteMapping("/eliminarventa")
	public void eliminarVenta(Integer codigo_venta) {
		VentaDAO Dao = new VentaDAO();
		Dao.eliminarVenta(codigo_venta);
	}

	@PutMapping("/actualizarventa")
	public void actualizarVenta(VentasVO venta) {
		VentaDAO Dao = new VentaDAO();
		Dao.actualizarVenta(venta);
	}
	
	
	@GetMapping("/contadorventa")
	public Integer contadorVentas() {
		VentaDAO Dao = new VentaDAO();
		return Dao.contadorVentas();
	}
	
	

}
