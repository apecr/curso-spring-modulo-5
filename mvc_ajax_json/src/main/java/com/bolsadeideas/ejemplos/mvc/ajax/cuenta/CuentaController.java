package com.bolsadeideas.ejemplos.mvc.ajax.cuenta;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/cuenta")
public class CuentaController {
	
	private Map<Long, Cuenta> cuentas = new ConcurrentHashMap<Long, Cuenta>();
	
	// Metodo handler formulario, para crear la cuenta
	@RequestMapping(method=RequestMethod.GET)
	public String crearCuentaForm(Model model) {
		model.addAttribute("cuenta", new Cuenta());
		return "cuenta/crearForm";
	}

	@RequestMapping(value="/obtener-disponibilidad", method=RequestMethod.GET)
	public @ResponseBody AvailabilityStatus getDisponibilidad(@RequestParam String nombre) {
		for (Cuenta a : cuentas.values()) {
			if (a.getNombre().equals(nombre)) {
				return AvailabilityStatus.notAvailable(nombre);
			}
		}
		return AvailabilityStatus.available();
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> crearCuenta(@Valid @RequestBody Cuenta cuenta, BindingResult result, HttpServletResponse response) {
		List<ObjectError> errores =result.getAllErrors();
		
		if (!errores.isEmpty()) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return mensajesValidacion(errores);
		} else {
			cuentas.put(cuenta.asignarId(), cuenta);
			return Collections.singletonMap("id", cuenta.getId());
		}
	}
	
	@RequestMapping(value="{id}", method=RequestMethod.GET)
	public @ResponseBody Cuenta verDetalle(@PathVariable Long id) {
		Cuenta cuenta = this.cuentas.get(id);
		if (cuenta == null) {
			throw new RecursoNoEncontradoException(id);
		}
		return cuenta;
	}

	private Map<String, String> mensajesValidacion(List<ObjectError> errores) {
		Map<String, String> mensajesErrores = new HashMap<String, String>();

		for (ObjectError fieldError : errores) {
		        mensajesErrores.put( ((FieldError) fieldError).getField(), fieldError.getDefaultMessage());
		}
		return mensajesErrores;
	}
}

