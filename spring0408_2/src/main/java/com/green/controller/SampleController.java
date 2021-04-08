package com.green.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.vo.SampleDTO;
import com.green.vo.SampleDTOList;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/sample/*")
@Slf4j
public class SampleController {
	@RequestMapping("")
	public void basic() {
		log.info("basic................");
	}
	@RequestMapping("/ex01")
	public String ex01(SampleDTO dto) {	// 입력시 자동으로 setter가 호출되어 입력한 [dto.setName("강아지"), dto.setAge(15)] 값이 url을 타고 들어옴
		System.out.println(("나이는  : "+ dto.getAge()+ " 이름은 : " +dto.getName()));
		log.info(("나이는  : "+ dto.getAge()+ " 이름은 : " +dto.getName()));
		
		return "ex01";
	}
	@RequestMapping("/ex02List")
	public String ex02List(@RequestParam("ids") ArrayList<String> ids) {
		log.info("ids: "+ids);
		return "ex02List";	//String을 void로 바꾸면 알아서  sample folder 밑에 url이 들어감
	}
	@RequestMapping("t")
	public void tt() {
		System.out.println("여기가 들어오나");
		
		
	}
	@RequestMapping("/ex02Bean")
	public String ex02Bean(SampleDTO list, Model model) {
		
//		for(SampleDTO i : list.getList()) {
//			log.info("이름은 : "+ i.getName()+ " 나이는 : "+i.getAge());
//		}
		
//			log.info("list dtos: "+ list.getList().get(0).getName());
		
//		log.info("list dtos: "+ list);
		
		model.addAttribute("m", list);
		return "/sample/ex02Bean";
	}
	
}
