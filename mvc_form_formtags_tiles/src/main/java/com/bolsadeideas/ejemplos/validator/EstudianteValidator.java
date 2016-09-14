package com.bolsadeideas.ejemplos.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.bolsadeideas.ejemplos.domain.Estudiante;;

public class EstudianteValidator implements Validator{

	public boolean supports(Class<?> clazz) {
		return Estudiante.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName",
				"required.userName", "El campo nombre es requerido.");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "direccion",
				"required.direccion", "El campo direccion es requerido.");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password",
				"required.password", "El campo password es requerido.");
			
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmarPassword",
				"required.confirmarPassword", "El campo confirmarPassword es requerido.");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "genero", 
				"required.genero", "El campo genero es requerido.");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "numeroFavorito", 
				"required.numeroFavorito", "El campo numeroFavorito es requerido.");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(
				errors, "experienciaSpring", "required.experienciaSpring","El campo experienciaSpring es requerido.");
		
		Estudiante cust = (Estudiante)target;
		
		if(!(cust.getPassword().equals(cust.getConfirmarPassword()))){
			errors.rejectValue("password", "notmatch.password");
		}
		
		if(cust.getTemas().length==0){
			errors.rejectValue("temas", "required.temas");
		}

		if("NONE".equals(cust.getPais())){
			errors.rejectValue("pais", "required.pais");
		}
		
	}
	
}