package com.kosta.serocar.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.serocar.bean.Advertisement;
import com.kosta.serocar.bean.PageInfo;
import com.kosta.serocar.service.AdvertisementService;

@Controller
public class AdvertisementController {

	@Autowired
	AdvertisementService advertisementService;

	@Autowired
	HttpSession session;

	@Autowired
	ServletContext servletContext;
	
	// 홍보글 호출
		@RequestMapping(value = "/advertisementList", method = { RequestMethod.POST, RequestMethod.GET })
		public ModelAndView advertisementList(
				@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, @RequestParam(value="keyword", required = false) String keyword, HttpServletRequest request, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			PageInfo pageInfo = new PageInfo();
			try {
				List<Advertisement> articleList = advertisementService.getAdvertisementList(page, keyword, pageInfo);
				mav.addObject("articleList2", articleList);
				mav.addObject("pageInfo2", pageInfo);
				mav.setViewName("community/comlistform_ad.tiles");
				session.setAttribute("searchKeyword", keyword);
				System.out.println("멤버이메일:" + request.getParameter("memberEmail"));
			} catch (Exception e) {
				e.printStackTrace();
				mav.addObject("err", e.getMessage());
				mav.setViewName("community/err.tiles");
			}
			return mav;
		}
}