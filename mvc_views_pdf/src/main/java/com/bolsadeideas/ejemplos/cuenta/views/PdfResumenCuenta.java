package com.bolsadeideas.ejemplos.cuenta.views;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.bolsadeideas.ejemplos.cuenta.domain.Cuenta;

import com.lowagie.text.Document;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfWriter;

public class PdfResumenCuenta extends AbstractPdfView {
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document,
			PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
					throws Exception {

		List<Cuenta> cuentas = (List<Cuenta>) model.get("cuentas");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Table table = new Table(5);

		table.addCell("Id");
		table.addCell("Nombre");
		table.addCell("Saldo");
		table.addCell("Nivel Endeudamiento");
		table.addCell("Fecha Renovacion");

		if (!cuentas.isEmpty()) {
			for (Cuenta cuenta : cuentas) {
				table.addCell(Long.toString(cuenta.getId()));
				table.addCell(cuenta.getNombre());
				BigDecimal bigDecimal = cuenta.getSaldo();
				table.addCell(bigDecimal.toString());
				bigDecimal = cuenta.getNivelEndeudamiento();
				table.addCell(bigDecimal.toString());
				table.addCell(dateFormat.format(cuenta.getFechaRenovacion()));
			}
		}

		document.add(table);
		
	}
	
}
