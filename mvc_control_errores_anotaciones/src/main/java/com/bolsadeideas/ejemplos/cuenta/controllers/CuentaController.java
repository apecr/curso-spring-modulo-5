package com.bolsadeideas.ejemplos.cuenta.controllers;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bolsadeideas.ejemplos.cuenta.domain.Cuenta;

@Controller
@RequestMapping(value = "/cuenta")
public class CuentaController {

	private Map<Long, Cuenta> cuentas = new ConcurrentHashMap<Long, Cuenta>();

	// Método handler formulario, para crear la cuenta
	@RequestMapping(method = RequestMethod.GET)
	public String crearCuentaForm(Model model) {
		model.addAttribute("cuenta", new Cuenta());
		return "cuenta/crearForm";
	}

	// Método handler que procesa el envio de datos del form
	@RequestMapping(method = RequestMethod.POST)
	public String crearCuenta(@Valid Cuenta cuenta, BindingResult result) {
		if (result.hasErrors()) {
			return "cuenta/crearForm";
		}

		this.cuentas.put(cuenta.asignarId(), cuenta);
		return "redirect:/cuenta/" + cuenta.getId();
	}

	@RequestMapping(value = "{id}", method = RequestMethod.GET)
	public String verDetalle(@PathVariable Long id, Model model) {
		Cuenta cuenta = this.cuentas.get(id);
		if (cuenta == null) {
			throw new RecursoNoEncontradoException(id);
		}
		model.addAttribute("cuenta", cuenta);
		return "cuenta/detalle";
	}

}
