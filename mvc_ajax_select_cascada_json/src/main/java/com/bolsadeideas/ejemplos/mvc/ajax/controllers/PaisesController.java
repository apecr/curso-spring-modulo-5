package com.bolsadeideas.ejemplos.mvc.ajax.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bolsadeideas.ejemplos.mvc.ajax.models.dominio.Ciudad;
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
	public @ResponseBody List<Ciudad> cascada(@RequestBody GeoLocalizacionForm form) {
		return geoService.buscarCiudadesPorPaisId(form.getPais());
	}
}
