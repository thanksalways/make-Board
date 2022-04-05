package com.cameldev.mypage.controller;

import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET() {
		logger.info("write GET...");
		return "/article/write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(ArticleVO articleVO, RedirectAttributes redirectAttributes) throws Exception {
		logger.info("write POST...");
		logger.info(articleVO.toString());
		articleService.create(articleVO);		
		//Flash가 휘발성이라는 의미
		redirectAttributes.addFlashAttribute("msg", "regSuccess");
		return "redirect:/article/list";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		logger.info("list ...");
		model.addAttribute("articles", articleService.listAll());
		return "/article/list";
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam("article_no") int article_no, Model model) throws Exception {
		logger.info("read ...");
		model.addAttribute("article", articleService.read(article_no));
		return "/article/read";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("article_no") int article_no, Model model) throws Exception {
		logger.info("modifyGet ...");
		model.addAttribute("article", articleService.read(article_no));
		return "/article/modify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(ArticleVO articleVO, RedirectAttributes redirectAttributes) throws Exception {
		logger.info("modifyPOST ...");
		articleService.update(articleVO);
		redirectAttributes.addFlashAttribute("msg", "modSuccess");
		return "redirect:/article/list";
	}

	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("article_no") int article_no, RedirectAttributes redirectAttributes)
			throws Exception {
		logger.info("remove ...");
		articleService.delete(article_no);
		redirectAttributes.addFlashAttribute("msg", "delSuccess");
		return "redirect:/article/list";
	}

	@RequestMapping(value = "/listCriteria", method = RequestMethod.GET)
	public String listCriteria(Model model, Criteria criteria) throws Exception {
		logger.info("listCriteria ...");
		model.addAttribute("articles", articleService.listCriteria(criteria));
		return "/article/list_criteria";
	}

	@RequestMapping(value = "/listPaging", method = RequestMethod.GET)
	public String listPaging(Model model, Criteria criteria) throws Exception {
		logger.info("listPaging ...");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(1000);
		
		model.addAttribute("articles", articleService.listCriteria(criteria));
		model.addAttribute("pageMaker", pageMaker);
		
		return "/article/list_paging";
	}

	@RequestMapping(value = "/readPaging", method = RequestMethod.GET)
	public String readPaging(@RequestParam("article_no") int article_no, @ModelAttribute("criteria") Criteria criteria,
			Model model) throws Exception {
		model.addAttribute("article", articleService.read(article_no));
		return "/article/read_paging";
	}

	@RequestMapping(value = "/modifyPaging", method = RequestMethod.GET)
	public String modifyGETPaging(@RequestParam("article_no") int article_no,
			@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception {
		logger.info("modifyGetPaging ...");
		model.addAttribute("article", articleService.read(article_no));
		return "/article/modify_paging";
	}

	@RequestMapping(value = "/modifyPaging", method = RequestMethod.POST)
	public String modifyPOSTPaging(ArticleVO articleVO, Criteria criteria, RedirectAttributes redirectAttributes)
			throws Exception {
		logger.info("modifyPOSTPaging ...");
		articleService.update(articleVO);
		redirectAttributes.addAttribute("page", criteria.getPage());
		redirectAttributes.addAttribute("perPageNum", criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "modSuccess");
		return "redirect:/article/listPaging";
	}

	@RequestMapping(value = "/removePaging", method = RequestMethod.POST)
	public String removePaging(@RequestParam("article_no") int article_no, Criteria criteria,
			RedirectAttributes redirectAttributes) throws Exception {
		logger.info("remove ...");
		articleService.delete(article_no);
		redirectAttributes.addAttribute("page", criteria.getPage());
		redirectAttributes.addAttribute("perPageNum", criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "delSuccess");
		return "redirect:/article/listPaging";
	}

	

}

// ��ó: https://cameldev.tistory.com/55 [��Ÿ�� �����ϱ� - CamelDev]