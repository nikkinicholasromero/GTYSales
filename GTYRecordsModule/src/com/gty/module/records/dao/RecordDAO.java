package com.gty.module.records.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
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

	public Record getRecordByBranchAndDate(String branch, Date date) {
		try {
			String SQL = "select * from record where branch = ? and date = ?";
			Record record = jdbcTemplate.queryForObject(SQL, new Object[] { branch, date }, this);
			return record;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public Record getLatestRecordByBranchId(int id) {
		String SQL = "select * from record order by date desc limit 1";
		Record record = jdbcTemplate.queryForObject(SQL, new Object[] { id }, this);
		return record;
	}
	
	public List<Record> getAllRecords() {
		String SQL = "select * from record";
		List<Record> records = jdbcTemplate.query(SQL, this);
		return records;
	}

	public void addRecord(Record record) {
		String SQL = "insert into record (branch, bank, date, consignment, overdue, advanced, open_consignment, due_consignment, new_consignment, sales, expense, deposit) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(SQL, record.getBranch(), record.getBank(), record.getDate(), record.getConsignment(), record.getOverdue(), record.getAdvanced(), record.getOpenConsignment(), record.getDueConsignment(), record.getNewConsignment(), record.getSales(), record.getExpense(), record.getDeposit());
	}

	public void updateRecord(Record record) {
		String SQL = "update record set branch = ?, bank = ?, date = ?, consignment = ?, overdue = ?, advanced = ?, open_consignment = ?, due_consignment = ?, new_consignment = ?, sales = ?, expense = ?, deposit = ? where id = ?";
		jdbcTemplate.update(SQL, record.getBranch(), record.getBank(), record.getDate(), record.getConsignment(), record.getOverdue(), record.getAdvanced(), record.getOpenConsignment(), record.getDueConsignment(), record.getNewConsignment(), record.getSales(), record.getExpense(), record.getDeposit(), record.getId());
	}

	@Override
	public Record mapRow(ResultSet rs, int rowNum) throws SQLException {
		Record record = new Record();
		record.setId(rs.getInt("id"));
		record.setBranch(rs.getString("branch"));
		record.setBank(rs.getString("bank"));
		record.setDate(rs.getDate("date"));
		record.setConsignment(rs.getInt("consignment"));
		record.setOverdue(rs.getInt("overdue"));
		record.setAdvanced(rs.getInt("advanced"));
		record.setOpenConsignment(rs.getInt("open_consignment"));
		record.setDueConsignment(rs.getInt("due_consignment"));
		record.setNewConsignment(rs.getInt("new_consignment"));
		record.setSales(rs.getBigDecimal("sales"));
		record.setExpense(rs.getBigDecimal("expense"));
		record.setDeposit(rs.getBigDecimal("deposit"));
		return record;
	}
}
