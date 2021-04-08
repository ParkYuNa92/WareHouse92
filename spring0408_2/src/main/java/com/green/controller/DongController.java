package com.green.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.mapper.DongMapper;
import com.green.vo.DVo;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/*")
public class DongController {

	@Setter(onMethod_=@Autowired)
	DongMapper dmapper;
	
	@RequestMapping("/list")
	public String list(Model model) {
		ArrayList<DVo> list = dmapper.list();
		log.info(" "+list);
		model.addAttribute("list", list);
		return "list";
	}
	@RequestMapping("/insert")
	public String insert() {//기본이 get방식 
		return "insertForm";
	}
	@PostMapping("/insert")
	public String  insert2(DVo vo) {
		System.out.println("입력하는 컨트롤러 post로 들어오나 ");
		dmapper.insertDong(vo);
		return "redirect:/list";
	}

}
