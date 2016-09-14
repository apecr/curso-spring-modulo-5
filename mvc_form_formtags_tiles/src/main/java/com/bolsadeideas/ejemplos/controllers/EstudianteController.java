package com.bolsadeideas.ejemplos.controllers;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.bolsadeideas.ejemplos.domain.Estudiante;
import com.bolsadeideas.ejemplos.validator.EstudianteValidator;

@Controller
@RequestMapping("/estudiante")
public class EstudianteController {

	@Autowired
	EstudianteValidator estudianteValidator;

	// Metodo handler formulario, para crear al estudiante
	@RequestMapping(method = RequestMethod.GET)
	public String getCreateForm(ModelMap model) {

		Estudiante estudiante = new Estudiante();

		estudiante.setDireccion("Av. Keneddy");
		estudiante.setTemas(new String[] { "Matematicas" });
		estudiante.setGenero("H");
		estudiante.setExperienciaSpring("Spring MVC");
		estudiante.setValorSecreto("Algún valor oculto");

		// Guardamos al objeto comando como "estudianteCommand" el cual
		// sera accesible en la vista estudianteForm.
		model.addAttribute("estudianteCommand", estudiante);

		// retornamos la vista form
		return "estudianteForm";
	}

	// Metodo handler que procesa el envio de datos del form
	@RequestMapping(method = RequestMethod.POST)
	public String processSubmit(
			@ModelAttribute("estudianteCommand") Estudiante estudiante,
			BindingResult result, SessionStatus status) {

		// Validamos
		estudianteValidator.validate(estudiante, result);

		if (result.hasErrors()) {
			// Si ocurre un error en la validaci�n retornamos al formulario
			// con los mensajes de error.
			return "estudianteForm";
		} else {
			status.setComplete();
			// Si pasa bien la validacion, retornamos "estudianteOk"
			return "estudianteOk";
		}
	}

	// La anotacion "@ModelAttribute" une o relaciona
	// un parametro de un metodo handler (@RequestMapping) o un valor
	// de retorno en un metodo hacia un "nombrado" atributo del model.
	// El model atributo "listaTemas" podra ser usado en la vista jsp
	// "estudianteForm.jsp".
	@ModelAttribute("listaTemas")
	public List<String> llenarListaTemas() {

		// Data reference de temas para llenar checkboxes
		List<String> listaTemas = new ArrayList<String>();
		listaTemas.add("Matemáticas");
		listaTemas.add("Ciencia");
		listaTemas.add("Arte");
		listaTemas.add("Musica");
		listaTemas.add("Deporte");

		return listaTemas;
	}

	@ModelAttribute("listaNumeros")
	public List<String> llenarListaNumeros() {

		// Data reference de n�meros para radiobuttons
		List<String> numeros = new ArrayList<String>();
		numeros.add("Numero 1");
		numeros.add("Numero 2");
		numeros.add("Numero 3");
		numeros.add("Numero 4");
		numeros.add("Numero 5");
		numeros.add("Numero 6");
		numeros.add("Numero 7");

		return numeros;
	}

	@ModelAttribute("experienciaSpring")
	public Map<String, String> llenarListaExperienciaSpring() {

		// Data reference de experiencias spring para list box
		Map<String, String> experienciaSpring = new LinkedHashMap<String, String>();
		experienciaSpring.put("Spring Core", "Spring Core");
		experienciaSpring.put("Spring MVC", "Spring MVC");
		experienciaSpring.put("Spring Roo", "Spring Roo");
		experienciaSpring.put("Hibernate", "Hibernate");

		return experienciaSpring;
	}

	@ModelAttribute("listaPaises")
	public Map<String, String> llenarPaises() {

		// Data reference de paises para list box
		Map<String, String> paises = new LinkedHashMap<String, String>();
		paises.put("CL", "Chile");
		paises.put("ES", "España");
		paises.put("MX", "México");
		paises.put("US", "United Stated");
		paises.put("AR", "Argentina");

		return paises;
	}

}