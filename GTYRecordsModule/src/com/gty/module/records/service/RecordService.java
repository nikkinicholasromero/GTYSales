package com.gty.module.records.service;

import java.sql.Date;
import java.util.List;

import com.gty.module.records.beanfactory.BeanFactory;
import com.gty.module.records.dao.RecordDAO;
import com.gty.module.records.domain.Record;

public final class RecordService {
	private RecordService() {
	}

	public static Record getRecordById(int id) {
		RecordDAO dao = BeanFactory.getRecordDAO();
		return dao.getRecordById(id);
	}

	public static Record getRecordByBranchAndDate(String branch, Date date) {
		RecordDAO dao = BeanFactory.getRecordDAO();
		return dao.getRecordByBranchAndDate(branch, date);
	}

	public static List<Record> getAllRecords() {
		RecordDAO dao = BeanFactory.getRecordDAO();
		return dao.getAllRecords();
	}

	public static String addRecord(Record record) {
		String validationResult = validateNewRecord(record);

		if (validationResult.equalsIgnoreCase("success")) {
			RecordDAO dao = BeanFactory.getRecordDAO();
			dao.addRecord(record);
		}

		return validationResult;
	}

	public static String updateRecord(Record record) {
		String validationResult = validateRecordUpdate(record);

		if (validationResult.equalsIgnoreCase("success")) {
			RecordDAO dao = BeanFactory.getRecordDAO();
			dao.updateRecord(record);
		}

		return validationResult;
	}

	private static String validateNewRecord(Record record) {
		String validationResult = "";

		RecordDAO dao = BeanFactory.getRecordDAO();
		Record existingRecord = dao.getRecordByBranchAndDate(record.getBranch(), record.getDate());
		if (existingRecord != null) {
			validationResult += "Record for this branch and date already exists. ";
		}
		
		if (validationResult.equals("")) {
			return "success";
		} else {
			return validationResult;
		}
	}

	private static String validateRecordUpdate(Record record) {
		String validationResult = "";

		RecordDAO dao = BeanFactory.getRecordDAO();
		Record existingRecord = dao.getRecordByBranchAndDate(record.getBranch(), record.getDate());
		if ((existingRecord != null) && (existingRecord.getId() != record.getId())) {
			validationResult += "Record for this branch and date already exists. ";
		}
		
		if (validationResult.equals("")) {
			return "success";
		} else {
			return validationResult;
		}
	}
}
