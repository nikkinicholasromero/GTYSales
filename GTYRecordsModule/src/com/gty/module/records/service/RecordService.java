package com.gty.module.records.service;

import java.util.List;

import com.gty.module.records.beanfactory.BeanFactory;
import com.gty.module.records.dao.RecordDAO;
import com.gty.module.records.domain.Record;

public final class RecordService {
	private RecordService() {
	}

	public static List<Record> getAllRecords() {
		RecordDAO dao = BeanFactory.getRecordDAO();
		return dao.getAllRecords();
	}
}
