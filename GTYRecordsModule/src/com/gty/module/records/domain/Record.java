package com.gty.module.records.domain;

import java.sql.Date;

public class Record {
	private int id;
	private int branchId;
	private String branchName;
	private Date transactionDate;
	private Date recordDate;
	private Double sales;
	private Double expense;
	private Double overdue;
	private Double advancedPayments;
	private int newMembers;
	private int openConsignment;
	private int newConsignment;
	private int dueConsignment;
	private int consignment;
	private Double cashOnHand;
	private Double cashDeposit;
	private Double cashOnHandDifference;
	private Double additionalCash;
	
	public Record() {
	}

	public int getId() {
		return id;
	}
	public int getBranchId() {
		return branchId;
	}
	public String getBranchName() {
		return branchName;
	}
	public Date getTransactionDate() {
		return transactionDate;
	}
	public Date getRecordDate() {
		return recordDate;
	}
	public Double getSales() {
		return sales;
	}
	public Double getExpense() {
		return expense;
	}
	public Double getOverdue() {
		return overdue;
	}
	public Double getAdvancedPayments() {
		return advancedPayments;
	}
	public int getNewMembers() {
		return newMembers;
	}
	public int getOpenConsignment() {
		return openConsignment;
	}
	public int getNewConsignment() {
		return newConsignment;
	}
	public int getDueConsignment() {
		return dueConsignment;
	}
	public int getConsignment() {
		return consignment;
	}
	public Double getCashOnHand() {
		return cashOnHand;
	}
	public Double getCashDeposit() {
		return cashDeposit;
	}
	public Double getCashOnHandDifference() {
		return cashOnHandDifference;
	}
	public Double getAdditionalCash() {
		return additionalCash;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setBranchId(int branchId) {
		this.branchId = branchId;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}
	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}
	public void setSales(Double sales) {
		this.sales = sales;
	}
	public void setExpense(Double expense) {
		this.expense = expense;
	}
	public void setOverdue(Double overdue) {
		this.overdue = overdue;
	}
	public void setAdvancedPayments(Double advancedPayments) {
		this.advancedPayments = advancedPayments;
	}
	public void setNewMembers(int newMembers) {
		this.newMembers = newMembers;
	}
	public void setOpenConsignments(int openConsignment) {
		this.openConsignment = openConsignment;
	}
	public void setNewConsignment(int newConsignment) {
		this.newConsignment = newConsignment;
	}
	public void setDueConsignment(int dueConsignment) {
		this.dueConsignment = dueConsignment;
	}
	public void setConsignment(int consignment) {
		this.consignment = consignment;
	}
	public void setCashOnHand(Double cashOnHand) {
		this.cashOnHand = cashOnHand;
	}
	public void setCashDeposit(Double cashDeposit) {
		this.cashDeposit = cashDeposit;
	}
	public void setCashOnHandDifference(Double cashOnHandDifference) {
		this.cashOnHandDifference = cashOnHandDifference;
	}
	public void setAdditionalCash(Double additionalCash) {
		this.additionalCash = additionalCash;
	}
}
