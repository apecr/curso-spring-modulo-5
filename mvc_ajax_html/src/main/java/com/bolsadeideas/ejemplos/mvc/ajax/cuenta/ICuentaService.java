package com.bolsadeideas.ejemplos.mvc.ajax.cuenta;

import java.util.List;

public interface ICuentaService
{

	public void init();
	public List<Cuenta> listar();
	public Cuenta getPorId(Long id);
	public List<Cuenta> buscarPorNombre(String searchString);
    // add additional interface methods here

}
