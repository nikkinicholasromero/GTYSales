package com.gty.module.records.domain;

import java.sql.Date;

public class Record {
	private int id;
	private String branch;
	private String bank;
	private Date date;
	private int consignment;
	private int overdue;
	private int advanced;
	private int openConsignment;
	private int dueConsignment;
	private int newConsignment;
	private Double sales;
	private Double expense;
	private Double deposit;
	
	public Record() {
	}

	public int getId() {
		return id;
	}
	public String getBranch() {
		return branch;
	}
	public String getBank() {
		return bank;
	}
	public Date getDate() {
		return date;
	}
	public int getConsignment() {
		return consignment;
	}
	public int getOverdue() {
		return overdue;
	}
	public int getAdvanced() {
		return advanced;
	}
	public int getOpenConsignment() {
		return openConsignment;
	}
	public int getDueConsignment() {
		return dueConsignment;
	}
	public int getNewConsignment() {
		return newConsignment;
	}
	public Double getSales() {
		return sales;
	}
	public Double getExpense() {
		return expense;
	}
	public Double getDeposit() {
		return deposit;
	}

	public void setId(int id) {
		this.id = id;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public void setConsignment(int consignment) {
		this.consignment = consignment;
	}
	public void setOverdue(int overdue) {
		this.overdue = overdue;
	}
	public void setAdvanced(int advanced) {
		this.advanced = advanced;
	}
	public void setOpenConsignment(int openConsignment) {
		this.openConsignment = openConsignment;
	}
	public void setDueConsignment(int dueConsignment) {
		this.dueConsignment = dueConsignment;
	}
	public void setNewConsignment(int newConsignment) {
		this.newConsignment = newConsignment;
	}
	public void setSales(Double sales) {
		this.sales = sales;
	}
	public void setExpense(Double expense) {
		this.expense = expense;
	}
	public void setDeposit(Double deposit) {
		this.deposit = deposit;
	}
}
