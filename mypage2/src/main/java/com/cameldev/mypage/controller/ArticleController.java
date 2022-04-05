package com.cameldev.mypage.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cameldev.mypage.commons.paging.Criteria;
import com.cameldev.mypage.commons.paging.PageMaker;
import com.cameldev.mypage.domain.ArticleVO;
import com.cameldev.mypage.service.ArticleService;

@Controller
@RequestMapping("/article")
public class ArticleController {
	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);

	private final ArticleService articleService;

	@Inject
	public ArticleController(ArticleService articleService) {
		this.articleService = articleService;
	}

//	등록페이지로 이동
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET() {
		logger.info("write GET...");

		return "/article/write";
	}

//	등록처리 write
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(ArticleVO articleVO, RedirectAttributes redirectAttributes) throws Exception {
		logger.info("write POST...");
		logger.info(articleVO.toString());
		articleService.create(articleVO);
		redirectAttributes.addFlashAttribute("msg", "regSuccess");

		return "redirect:/article/list";
	}

//	목록페이지로 이동 list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		logger.info("list...");
		model.addAttribute("articles", articleService.listAll());

		return "/article/list";
	}

//	조회 페이지 이동 read	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam("article_no") int article_no, Model model) throws Exception {
		logger.info("read...");
//		Model addAttribute(String name, Object value)
//		value 객체를 name 이름으로 추가한다
		model.addAttribute("article", articleService.read(article_no));

		return "/article/read";
	}

//	수정 페이조 이동 modify
	public String modifyGET(@RequestParam("article_no") int article_no, Model model) throws Exception {
		logger.info("modifyGET...");
		model.addAttribute("article", articleService.read(article_no));

		return "/article/modify";
	}

//	수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(ArticleVO articleVO, RedirectAttributes redirectAttributes) throws Exception {
		logger.info("modifyPOST...");
		articleService.update(articleVO);
		redirectAttributes.addFlashAttribute("msg", "modSuccess");

		return "/article/modify";
	}

//	삭제 처리 delete
	@RequestMapping(value = "/delete")
	public String remove(@RequestParam("article_no") int article_no, RedirectAttributes redirectAttributes)
			throws Exception {
		logger.info("remove...");
		articleService.delete(article_no);
		redirectAttributes.addFlashAttribute("msg", "delSuccess");

		return "redirect:/article/list";
	}

	@RequestMapping(value = "listCriteria", method = RequestMethod.GET)
	public String listCriteria(Model model, Criteria criteria) throws Exception {
		logger.info("criteria...");
		model.addAttribute("articles", articleService.listCriteria(criteria));
		return "/article/list_criteria";
	}

	@RequestMapping(value = "/listPaging", method = RequestMethod.GET)
	public String listPaging(Model model, Criteria criteria) throws Exception {
		logger.info("listPaging...");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(1000);
		
		model.addAttribute("articles", articleService.listCriteria(criteria));
		model.addAttribute("pageMaker", pageMaker);
		
		return "/article/list_paging";
	}

}
