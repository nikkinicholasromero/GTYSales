package com.gty.module.records.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gty.module.records.domain.Record;
import com.gty.module.records.service.RecordService;

@Controller
public class RecordsController {
	@RequestMapping("/records")
	public ModelAndView showRecords() {
		ModelAndView modelAndView = new ModelAndView("records");

		List<Record> records = RecordService.getAllRecords();
		modelAndView.addObject("records", records);

		return modelAndView;
	}
}
