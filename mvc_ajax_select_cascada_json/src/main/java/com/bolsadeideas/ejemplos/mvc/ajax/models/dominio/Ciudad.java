package com.bolsadeideas.ejemplos.mvc.ajax.models.dominio;

import java.util.concurrent.atomic.AtomicLong;

public class Ciudad {

	private Long id;

	private String nombre;

	public Ciudad() {
	}

	public Ciudad(Long id, String nombre) {
		super();
		this.id = id;
		this.nombre = nombre;
	}

	public Long getId() {
		return id;
	}

	void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Long asignarId() {
		this.id = idSequencia.incrementAndGet();
		return id;
	}

	private static final AtomicLong idSequencia = new AtomicLong();

}