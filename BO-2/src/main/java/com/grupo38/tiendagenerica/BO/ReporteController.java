package com.grupo38.tiendagenerica.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo38.tiendagenerica.DAO.ReporteDAO;
import com.grupo38.tiendagenerica.DTO.ReporteVO;

@RestController
public class ReporteController {

	/*
	 * @GetMapping obtener o buscar
	 * 
	 * @PostMapping insertar o agregar
	 * 
	 * @PutMapping modificar o actualizar
	 * 
	 * @DeleteMapping eliminar o borrar
	 */

	@GetMapping("/listarreportes")
	public ArrayList<ReporteVO> consultarReporte(int cliente) {
		ReporteDAO Dao = new ReporteDAO();
		return Dao.consultarReporte(cliente);
	}

}
