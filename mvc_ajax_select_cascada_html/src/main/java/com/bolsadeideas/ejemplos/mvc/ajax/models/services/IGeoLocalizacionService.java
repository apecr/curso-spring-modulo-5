package com.bolsadeideas.ejemplos.mvc.ajax.models.services;

import java.util.List;

import com.bolsadeideas.ejemplos.mvc.ajax.models.dominio.Ciudad;
import com.bolsadeideas.ejemplos.mvc.ajax.models.dominio.Pais;

public interface IGeoLocalizacionService {
	public void init();

	public List<Pais> listarPaises();

	public Pais getPaisPorId(Long id);

	public List<Ciudad> buscarCiudadesPorPaisId(Long paisId);
}
