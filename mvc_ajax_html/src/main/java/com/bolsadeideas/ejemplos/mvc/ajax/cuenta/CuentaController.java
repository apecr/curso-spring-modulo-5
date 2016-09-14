package com.bolsadeideas.ejemplos.mvc.ajax.cuenta;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/cuenta")
public class CuentaController {

	@Autowired
	private ICuentaService cuentaService;

	@RequestMapping
	@ModelAttribute("cuentas")
	public List<Cuenta> listar() {
		return cuentaService.listar();
	}

	@RequestMapping(value = "/buscar", method = RequestMethod.POST)
	@ModelAttribute("cuentas")
	public List<Cuenta> buscar(@RequestParam String buscarTexto) {
		return cuentaService.buscarPorNombre(buscarTexto);
	}

}
