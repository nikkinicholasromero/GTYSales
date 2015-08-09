package com.gty.module.records.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.gty.module.records.domain.Record;

public class RecordDAO implements RowMapper<Record> {
	private JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public Record getRecordById(int id) {
		String SQL = "select * from record where id = ?";
		Record record = jdbcTemplate.queryForObject(SQL, new Object[] { id }, this);
		return record;
	}

	public List<Record> getAllRecords() {
		String SQL = "select record.id as 'id', record.branch_id as 'branch_id', branch.branch_name as 'branch_name', record.transaction_date as 'transaction_date', record.record_date as 'record_date', record.sales as 'sales', record.expense as 'expense', record.overdue as 'overdue', record.advanced_payment as 'advanced_payment', record.new_members as 'new_members', record.open_consignment as 'open_consignment', record.new_consignment as 'new_consignment', record.due_consignment as 'due_consignment', record.consignment as 'consignment', record.cash_on_hand as 'cash_on_hand', record.cash_deposit as 'cash_deposit', record.cash_on_hand_difference as 'cash_on_hand_difference', record.additional_cash as 'additional_cash' from record, branch where record.branch_id = branch.id";
		List<Record> records = jdbcTemplate.query(SQL, this);
		return records;
	}

	public void addRecord(Record record) {
		String SQL = "insert into record (branch_id, transaction_date, record_date, sales, expense, overdue, advanced_payment, new_members, open_consignment, new_consignment, due_consignment, consignment, cash_on_hand, cash_deposit, cash_on_hand_difference, additional_cash) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(SQL, record.getBranchId(), record.getTransactionDate(), record.getRecordDate(), record.getSales(), record.getExpense(), record.getOverdue(), record.getAdvancedPayments(), record.getNewMembers(), record.getOpenConsignment(), record.getNewConsignment(), record.getDueConsignment(), record.getConsignment(), record.getCashOnHand(), record.getCashDeposit(), record.getCashOnHandDifference(), record.getAdditionalCash());
	}

	public void deleteRecordById(int id) {
		String SQL = "delete from record where id = ?";
		jdbcTemplate.update(SQL, id);
	}

	@Override
	public Record mapRow(ResultSet rs, int rowNum) throws SQLException {
		Record record = new Record();
		record.setId(rs.getInt("id"));
		record.setBranchId(rs.getInt("branch_id"));
		record.setBranchName(rs.getString("branch_name"));
		record.setTransactionDate(rs.getDate("transaction_date"));
		record.setRecordDate(rs.getDate("record_date"));
		record.setSales(rs.getDouble("sales"));
		record.setExpense(rs.getDouble("expense"));
		record.setOverdue(rs.getDouble("overdue"));
		record.setAdvancedPayments(rs.getDouble("advanced_payment"));
		record.setNewMembers(rs.getInt("new_members"));
		record.setOpenConsignments(rs.getInt("open_consignment"));
		record.setNewConsignment(rs.getInt("new_consignment"));
		record.setDueConsignment(rs.getInt("due_consignment"));
		record.setConsignment(rs.getInt("consignment"));
		record.setCashOnHand(rs.getDouble("cash_on_hand"));
		record.setCashDeposit(rs.getDouble("cash_deposit"));
		record.setCashOnHandDifference(rs.getDouble("cash_on_hand_difference"));
		record.setAdditionalCash(rs.getDouble("additional_cash"));
		return record;
	}
}
