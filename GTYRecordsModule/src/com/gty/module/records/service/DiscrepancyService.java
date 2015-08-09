package com.gty.module.records.service;

import java.util.List;

import com.gty.module.records.beanfactory.BeanFactory;
import com.gty.module.records.dao.DiscrepancyDAO;
import com.gty.module.records.domain.Discrepancy;

public final class DiscrepancyService {
	private DiscrepancyService() {
	}

	public static Discrepancy getDiscrepancyById(int id) {
		DiscrepancyDAO dao = BeanFactory.getDiscrepancyDAO();
		return dao.getDiscrepancyById(id);
	}

	public static Discrepancy getDiscrepancyByDiscrepancyType(String type) {
		DiscrepancyDAO dao = BeanFactory.getDiscrepancyDAO();
		return dao.getDiscrepancyByDiscrepancyType(type);
	}

	public static List<Discrepancy> getAllDiscrepancies() {
		DiscrepancyDAO dao = BeanFactory.getDiscrepancyDAO();
		return dao.getAllDiscrepancies();
	}

	public static String addDiscrepancy(Discrepancy discrepancy) {
		String validationResult = validateNewDiscrepancy(discrepancy);

		if (validationResult.equalsIgnoreCase("success")) {
			DiscrepancyDAO dao = BeanFactory.getDiscrepancyDAO();
			dao.addDiscrepancy(discrepancy);
		}

		return validationResult;
	}

	public static String updateDiscrepancy(Discrepancy discrepancy) {
		String validationResult = validateDiscrepancyUpdate(discrepancy);

		if (validationResult.equalsIgnoreCase("success")) {
			DiscrepancyDAO dao = BeanFactory.getDiscrepancyDAO();
			dao.udpateDiscrepancy(discrepancy);
		}

		return validationResult;
	}

	private static String validateNewDiscrepancy(Discrepancy discrepancy) {
		String validationResult = "";

		DiscrepancyDAO dao = BeanFactory.getDiscrepancyDAO();
		Discrepancy existingDiscrepancy = dao.getDiscrepancyByDiscrepancyType(discrepancy.getType());
		if (existingDiscrepancy != null) {
			validationResult += "Discrepancy type already exists. ";
		}
		
		if("".equalsIgnoreCase(discrepancy.getType())) {
			validationResult += "Discrepancy type is mandatory. ";
		}


		if (validationResult.equals("")) {
			return "success";
		} else {
			return validationResult;
		}
	}

	private static String validateDiscrepancyUpdate(Discrepancy discrepancy) {
		String validationResult = "";

		DiscrepancyDAO dao = BeanFactory.getDiscrepancyDAO();
		Discrepancy existingDiscrepancy = dao.getDiscrepancyByDiscrepancyType(discrepancy.getType());
		if ((existingDiscrepancy != null) && (existingDiscrepancy.getId() != discrepancy.getId())) {
			validationResult += "Discrepancy type already exists. ";
		}
		
		if("".equalsIgnoreCase(discrepancy.getType())) {
			validationResult += "Discrepancy type is mandatory. ";
		}

		if (validationResult.equals("")) {
			return "success";
		} else {
			return validationResult;
		}
	}
}
