package com.bolsadeideas.ejemplos.mvc.ajax.models.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;

import com.bolsadeideas.ejemplos.mvc.ajax.models.dominio.Ciudad;
import com.bolsadeideas.ejemplos.mvc.ajax.models.dominio.Pais;

@Service
public class GeoLocalizacionService implements IGeoLocalizacionService {

	private Map<Long, Pais> paises = new ConcurrentHashMap<Long, Pais>();
	private Map<Long, Ciudad[]> ciudades = new ConcurrentHashMap<Long, Ciudad[]>();

	@Override
	@PostConstruct
	public void init() {
		Pais pais = new Pais(new Long(1L), "Chile");
		paises.put(new Long(1L), pais);
		ciudades.put(new Long(1L), new Ciudad[] { new Ciudad(1L, "Santiago"), new Ciudad(2L, "Viña del Mar"), new Ciudad(3L, "Concepción") });

		pais = new Pais(new Long(2L), "España");
		paises.put(new Long(2L), pais);
		ciudades.put(new Long(2L), new Ciudad[] { new Ciudad(1L, "Madrid"), new Ciudad(2L, "Barcelona"), new Ciudad(3L, "Sevilla") });

		pais = new Pais(new Long(3L), "México");
		paises.put(new Long(3L), pais);
		ciudades.put(new Long(3L), new Ciudad[] { new Ciudad(1L, "Ciudad de México"), new Ciudad(2L, "Puebla"), new Ciudad(3L, "Guadalajara") });

		pais = new Pais(new Long(4L), "Argentina");
		paises.put(new Long(4L), pais);
		ciudades.put(new Long(4L), new Ciudad[] { new Ciudad(1L, "Buenos Aires"), new Ciudad(2L, "Córdoba"), new Ciudad(3L, "Mendoza") });

		pais = new Pais(new Long(5L), "Perú");
		paises.put(new Long(5L), pais);
		ciudades.put(new Long(5L), new Ciudad[] { new Ciudad(1L, "Lima"), new Ciudad(2L, "Arequipa"), new Ciudad(3L, "Cuzco") });

		pais = new Pais(new Long(6L), "Colombia");
		paises.put(new Long(6L), pais);
		ciudades.put(new Long(6L), new Ciudad[] { new Ciudad(1L, "Bogotá"), new Ciudad(2L, "Medellín"), new Ciudad(3L, "Cali") });
		
		pais = new Pais(new Long(7L), "Uruguay");
		paises.put(new Long(7L), pais);
		ciudades.put(new Long(7L), new Ciudad[] { new Ciudad(1L, "Montevideo"), new Ciudad(2L, "Colonia"), new Ciudad(3L, "San José") });
	}

	@Override
	public List<Pais> listarPaises() {
		return new ArrayList<Pais>(paises.values());
	}

	@Override
	public Pais getPaisPorId(Long id) {
		return this.paises.get(id);
	}

	@Override
	public List<Ciudad> buscarCiudadesPorPaisId(Long paisId) {
		return Arrays.asList(this.ciudades.get(paisId));
	}
}