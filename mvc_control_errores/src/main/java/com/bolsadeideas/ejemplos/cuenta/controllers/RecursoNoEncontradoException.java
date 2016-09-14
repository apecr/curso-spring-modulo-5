package com.bolsadeideas.ejemplos.cuenta.controllers;

import java.util.Date;

public class RecursoNoEncontradoException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	private Long recursoId;
	private Date fecha;

	public RecursoNoEncontradoException(Long recursoId) {
		this.recursoId = recursoId;
		fecha = new Date();
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Long getRecursoId() {
		return recursoId;
	}

}
