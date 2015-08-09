package com.gty.module.records.service;

import java.util.List;

import com.gty.module.records.beanfactory.BeanFactory;
import com.gty.module.records.dao.BankDAO;
import com.gty.module.records.domain.Bank;

public final class BankService {
	private BankService() {
	}

	public static Bank getBankById(int id) {
		BankDAO dao = BeanFactory.getBankDAO();
		return dao.getBankById(id);
	}

	public static Bank getBankByBankName(String name) {
		BankDAO dao = BeanFactory.getBankDAO();
		return dao.getBankByBankName(name);
	}

	public static List<Bank> getAllBanks() {
		BankDAO dao = BeanFactory.getBankDAO();
		return dao.getAllBanks();
	}

	public static String addBank(Bank bank) {
		String validationResult = validateNewBank(bank);

		if (validationResult.equalsIgnoreCase("success")) {
			BankDAO dao = BeanFactory.getBankDAO();
			dao.addBank(bank);
		}

		return validationResult;
	}

	public static String updateBank(Bank bank) {
		String validationResult = validateBankUpdate(bank);

		if (validationResult.equalsIgnoreCase("success")) {
			BankDAO dao = BeanFactory.getBankDAO();
			dao.updateBank(bank);
		}

		return validationResult;
	}

	private static String validateNewBank(Bank bank) {
		String validationResult = "success";

		BankDAO dao = BeanFactory.getBankDAO();
		Bank existingBank = dao.getBankByBankName(bank.getName());
		if (existingBank != null) {
			validationResult = "Bank name already exists. ";
		} else if ("".equalsIgnoreCase(bank.getName())) {
			validationResult = "Bank name is mandatory. ";
		}

		return validationResult;
	}

	private static String validateBankUpdate(Bank bank) {
		String validationResult = "success";

		BankDAO dao = BeanFactory.getBankDAO();
		Bank existingBank = dao.getBankByBankName(bank.getName());
		if ((existingBank != null) && (existingBank.getId() != bank.getId())) {
			validationResult = "Bank name already exists. ";
		} else if ("".equalsIgnoreCase(bank.getName())) {
			validationResult = "Bank name is mandatory. ";
		}

		return validationResult;
	}
}
