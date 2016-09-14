package com.bolsadeideas.ejemplos.cuenta.controllers;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;


@ControllerAdvice
public class ExceptionHandlingController {

	@ExceptionHandler(Exception.class)
	public ModelAndView handleGenericError(Exception exception) {
		ModelAndView model = new ModelAndView("error");
		model.addObject("exception", exception);
		return model;
	}
	
	@ExceptionHandler(RecursoNoEncontradoException.class)
	public ModelAndView cuentaNotExisteError(RecursoNoEncontradoException exception) {
		ModelAndView model = new ModelAndView("cuentaNotExiste");
		model.addObject("exception", exception);
		return model;
	}
}
