package com.gty.module.records.beanfactory;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.gty.module.records.dao.BankDAO;
import com.gty.module.records.dao.BranchDAO;
import com.gty.module.records.dao.DiscrepancyDAO;
import com.gty.module.records.dao.RecordDAO;

public final class BeanFactory {
	private static ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");

	private BeanFactory() {
	}

	public static BankDAO getBankDAO() {
		return context.getBean(BankDAO.class, "bankDAO");
	}
	public static BranchDAO getBranchDAO() {
		return context.getBean(BranchDAO.class, "branchDAO");
	}
	public static DiscrepancyDAO getDiscrepancyDAO() {
		return context.getBean(DiscrepancyDAO.class, "discrepancyDAO");
	}
	public static RecordDAO getRecordDAO() {
		return context.getBean(RecordDAO.class, "recordDAO");
	}
}
