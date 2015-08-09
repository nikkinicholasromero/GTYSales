package com.gty.module.records.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.gty.module.records.domain.Bank;
import com.gty.module.records.domain.Branch;
import com.gty.module.records.service.BankService;
import com.gty.module.records.service.BranchService;
import com.gty.module.records.utility.BankComparator;
import com.gty.module.records.utility.JSONUtility;

@Controller
@RestController
public class BranchController {
	@RequestMapping(value = "/branches")
	public ModelAndView showBraches() {
		ModelAndView modelAndView = new ModelAndView("branch");

		List<Branch> branches = BranchService.getAllBranches();
		modelAndView.addObject("branches", branches);

		List<Bank> banks = BankService.getAllBanks();
		Collections.sort(banks, new BankComparator());
		modelAndView.addObject("banks", banks);

		return modelAndView;
	}

	@RequestMapping(value = "/addNewBranch", method = RequestMethod.POST)
	public @ResponseBody String addNewBranch(@ModelAttribute("branch") Branch branch) throws IOException {
		return BranchService.addBranch(branch);
	}

	@RequestMapping(value = "/getBranchByBranchName", method = RequestMethod.POST)
	public @ResponseBody String getBranchByBranchName(@RequestParam("name") String name) throws JsonProcessingException {
		Branch branch = BranchService.getBranchByBranchName(name);
		return JSONUtility.parseJSON(branch);
	}

	@RequestMapping(value = "/updateBranch", method = RequestMethod.POST)
	public @ResponseBody String updateBranch(@ModelAttribute("branch") Branch branch) throws IOException {
		return BranchService.updateBranch(branch);
	}
}