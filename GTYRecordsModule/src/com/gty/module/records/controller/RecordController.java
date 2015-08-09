package com.gty.module.records.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.gty.module.records.domain.Bank;
import com.gty.module.records.domain.Branch;
import com.gty.module.records.domain.Discrepancy;
import com.gty.module.records.domain.Record;
import com.gty.module.records.service.BankService;
import com.gty.module.records.service.BranchService;
import com.gty.module.records.service.DiscrepancyService;
import com.gty.module.records.service.RecordService;
import com.gty.module.records.utility.BankComparator;
import com.gty.module.records.utility.BranchComparator;
import com.gty.module.records.utility.DiscrepancyComparator;
import com.gty.module.records.utility.JSONUtility;

@Controller
public class RecordController {
	@RequestMapping("/")
	public ModelAndView showIndex() {
		ModelAndView modelAndView = new ModelAndView("record");

		List<Record> records = RecordService.getAllRecords();
		modelAndView.addObject("records", records);

		List<Branch> branches = BranchService.getAllBranches();
		Collections.sort(branches, new BranchComparator());
		modelAndView.addObject("branches", branches);

		List<Bank> banks = BankService.getAllBanks();
		Collections.sort(banks, new BankComparator());
		modelAndView.addObject("banks", banks);

		List<Discrepancy> discrepancies = DiscrepancyService.getAllDiscrepancies();
		Collections.sort(discrepancies, new DiscrepancyComparator());
		modelAndView.addObject("discrepancies", discrepancies);

		return modelAndView;
	}
	@RequestMapping("/records")
	public ModelAndView showRecords() {
		ModelAndView modelAndView = new ModelAndView("record");

		List<Record> records = RecordService.getAllRecords();
		modelAndView.addObject("records", records);

		List<Branch> branches = BranchService.getAllBranches();
		Collections.sort(branches, new BranchComparator());
		modelAndView.addObject("branches", branches);

		List<Bank> banks = BankService.getAllBanks();
		Collections.sort(banks, new BankComparator());
		modelAndView.addObject("banks", banks);

		List<Discrepancy> discrepancies = DiscrepancyService.getAllDiscrepancies();
		Collections.sort(discrepancies, new DiscrepancyComparator());
		modelAndView.addObject("discrepancies", discrepancies);

		return modelAndView;
	}

	@RequestMapping(value = "/addNewRecord", method = RequestMethod.POST)
	public @ResponseBody String addNewRecord(@ModelAttribute("record") Record record) throws IOException {
		return RecordService.addRecord(record);
	}

	@RequestMapping(value = "/getRecordByBranchAndDate", method = RequestMethod.POST)
	public @ResponseBody String getRecordByBranchAndDate(@RequestParam("branch") String branch, @RequestParam("date") Date date) throws JsonProcessingException {
		Record record = RecordService.getRecordByBranchAndDate(branch, date);
		return JSONUtility.parseJSON(record);
	}

	@RequestMapping(value = "/updateRecord", method = RequestMethod.POST)
	public @ResponseBody String updateRecord(@ModelAttribute("record") Record record) throws IOException {
		return RecordService.updateRecord(record);
	}
}
