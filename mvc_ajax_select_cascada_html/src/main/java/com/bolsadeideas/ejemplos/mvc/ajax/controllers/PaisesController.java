package com.bolsadeideas.ejemplos.mvc.ajax.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bolsadeideas.ejemplos.mvc.ajax.models.dominio.GeoLocalizacionForm;
import com.bolsadeideas.ejemplos.mvc.ajax.models.services.IGeoLocalizacionService;

@Controller
@RequestMapping(value = "/paises")
public class PaisesController {

	@Autowired
	private IGeoLocalizacionService geoService;

	@RequestMapping
	public Model listar(Model model) {
		model.addAttribute("paises", geoService.listarPaises());
		model.addAttribute("geoLocalizacionForm", new GeoLocalizacionForm());
		return model;
	}

	@RequestMapping(value = "/cascada", method = RequestMethod.POST)
	public Model cascada(Model model, GeoLocalizacionForm form) {
		model.addAttribute("ciudades", geoService.buscarCiudadesPorPaisId(form.getPais()));
		model.addAttribute("geoLocalizacionForm", new GeoLocalizacionForm());
		return model;
	}
}
