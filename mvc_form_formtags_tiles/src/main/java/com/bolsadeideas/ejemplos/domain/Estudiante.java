package com.bolsadeideas.ejemplos.domain;

public class Estudiante{
	
	private String userName;	
	private String direccion;	
	private String password;
	private String confirmarPassword;
	private boolean recibeNewsletter;
	private String[] temas;
	private String numeroFavorito;
	private String genero;

	private String pais;
	private String experienciaSpring;
	
	//valor oculto
	private String valorSecreto;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmarPassword() {
		return confirmarPassword;
	}

	public void setConfirmarPassword(String confirmarPassword) {
		this.confirmarPassword = confirmarPassword;
	}

	public boolean isRecibeNewsletter() {
		return recibeNewsletter;
	}

	public void setRecibeNewsletter(boolean reciveNewsletter) {
		this.recibeNewsletter = reciveNewsletter;
	}

	public String[] getTemas() {
		return temas;
	}

	public void setTemas(String[] temas) {
		this.temas = temas;
	}

	public String getNumeroFavorito() {
		return numeroFavorito;
	}

	public void setNumeroFavorito(String numeroFavorito) {
		this.numeroFavorito = numeroFavorito;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getExperienciaSpring() {
		return experienciaSpring;
	}

	public void setExperienciaSpring(String experienciaSpring) {
		this.experienciaSpring = experienciaSpring;
	}

	public String getValorSecreto() {
		return valorSecreto;
	}

	public void setValorSecreto(String valorSecreto) {
		this.valorSecreto = valorSecreto;
	}
	
	
}