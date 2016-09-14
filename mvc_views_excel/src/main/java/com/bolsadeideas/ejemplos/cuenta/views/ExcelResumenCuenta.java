package com.bolsadeideas.ejemplos.cuenta.views;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.RichTextString;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import com.bolsadeideas.ejemplos.cuenta.domain.Cuenta;

public class ExcelResumenCuenta extends AbstractXlsxView {

	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		List<Cuenta> cuentas = (List<Cuenta>) model.get("cuentas");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Sheet sheet = workbook.createSheet();

        Row header = sheet.createRow(0);
        
        header.createCell((short) 0).setCellValue(workbook.getCreationHelper().createRichTextString("Id"));
        header.createCell((short) 1).setCellValue(workbook.getCreationHelper().createRichTextString("Nombre"));
        header.createCell((short) 2).setCellValue(workbook.getCreationHelper().createRichTextString("Saldo"));
        header.createCell((short) 3).setCellValue(workbook.getCreationHelper().createRichTextString("Nivel Endeudamiento"));
        header.createCell((short) 4).setCellValue(workbook.getCreationHelper().createRichTextString("Fecha Renovacion"));

        int rowNum = 1;
        for (Cuenta cuenta : cuentas) {
            Row row = sheet.createRow(rowNum++);
            row.createCell((short) 0).setCellValue(workbook.getCreationHelper().createRichTextString(Long.toString(cuenta.getId())));
            row.createCell((short) 1).setCellValue(workbook.getCreationHelper().createRichTextString(cuenta.getNombre()));
            BigDecimal bigDecimal = cuenta.getSaldo();
            row.createCell((short) 2).setCellValue(bigDecimal.doubleValue());
            bigDecimal = cuenta.getNivelEndeudamiento();
            row.createCell((short) 3).setCellValue(bigDecimal.doubleValue());
            
            RichTextString fechaRenovacion = workbook.getCreationHelper().createRichTextString(dateFormat.format(cuenta.getFechaRenovacion()));
            row.createCell((short) 4).setCellValue(fechaRenovacion);
        }
		
	}
}
