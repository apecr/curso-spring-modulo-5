package com.bolsadeideas.ejemplos.mvc.ajax.cuenta;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;

@Service
public class CuentaService implements ICuentaService{
	
	private Map<Long, Cuenta> cuentas = new ConcurrentHashMap<Long, Cuenta>();
	
	@Override
	@PostConstruct
	public void init() {
		Cuenta account = new Cuenta( new Long(0001), 
				"Andres Guzmán", 
				new BigDecimal("5000"), 
				new BigDecimal("0.30"), 
				new Date());
		
		cuentas.put(new Long(0001), account);
		
		account =  new Cuenta( new Long(0002), 
				"Bruce Lee", 
				new BigDecimal("2000"), 
				new BigDecimal("0.60"), 
				new Date());
		
		cuentas.put(new Long(0002), account);
		
		account =  new Cuenta( new Long(0003), 
				"Rod Johnson", 
				new BigDecimal("3000"), 
				new BigDecimal("0.50"), 
				new Date());
		
		cuentas.put(new Long(0003), account);
		
		account =  new Cuenta( new Long(0004), 
				"Linus Torvalds", 
				new BigDecimal("5000"), 
				new BigDecimal("0.20"), 
				new Date());
		
		cuentas.put(new Long(0004), account);
		
		account =  new Cuenta( new Long(0005), 
				"Rasmus Lerdorf", 
				new BigDecimal("4000"), 
				new BigDecimal("0.10"), 
				new Date());
		
		cuentas.put(new Long(0005), account);
		
		account =  new Cuenta( new Long(0006), 
				"Erich Gamma", 
				new BigDecimal("4300"), 
				new BigDecimal("0.00"), 
				new Date());
		
		cuentas.put(new Long(0006), account);
		
		account =  new Cuenta( new Long(0007), 
				"Ralph Johnson", 
				new BigDecimal("1900"), 
				new BigDecimal("0.20"), 
				new Date());
		
		cuentas.put(new Long(0007), account);
		
		account =  new Cuenta( new Long(8L), 
				"Ralph Johnson", 
				new BigDecimal("2700"), 
				new BigDecimal("0.50"), 
				new Date());
		
		cuentas.put(new Long(8L), account);
		
		account =  new Cuenta( new Long(8L), 
				"Martin Fowler", 
				new BigDecimal("8700"), 
				new BigDecimal("0.30"), 
				new Date());
		
		cuentas.put(new Long(8L), account);
		
		account =  new Cuenta( new Long(9L), 
				"Bill Gates", 
				new BigDecimal("100700"), 
				new BigDecimal("0.00"), 
				new Date());
		
		cuentas.put(new Long(9L), account);
		
		account =  new Cuenta( new Long(10L), 
				"Bruce Willis", 
				new BigDecimal("80700"), 
				new BigDecimal("0.00"), 
				new Date());
		
		cuentas.put(new Long(10L), account);
	}
	
	@Override
	public List<Cuenta> listar() {
		return new ArrayList<Cuenta>(cuentas.values());
	}

	@Override
	public Cuenta getPorId(Long id) {
		return this.cuentas.get(id);
	}

	@Override
	public List<Cuenta> buscarPorNombre(String searchString) {
		searchString = searchString == null? "": searchString;
		List<Cuenta> resultado = new ArrayList<Cuenta>();
		for (Cuenta cuenta : cuentas.values()) {
			if (cuenta.getNombre().toUpperCase().contains(searchString.toUpperCase())) {
				resultado.add(cuenta);
            }
		}
		
		return resultado;
	}
}