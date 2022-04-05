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
@RequestMapping("/article/paging")
public class ArticlePagingController {
	private static final Logger logger = LoggerFactory.getLogger(ArticlePagingController.class);
	private final ArticleService articleService;

	@Inject
	public ArticlePagingController(ArticleService articleService) {
		this.articleService = articleService;
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET() {
		logger.info("paging writeGET() called...");
		return "article/paging/write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(ArticleVO articleVO, RedirectAttributes redirectAttributes) throws Exception {
		logger.info("paging writePOST() called...");
		articleService.create(articleVO);
		redirectAttributes.addFlashAttribute("msg", "regSuccess");
		return "redirect:/article/paging/list";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, Criteria criteria) throws Exception {
		logger.info("paging list() called ...");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(articleService.countArticles(criteria));
		
		model.addAttribute("articles", articleService.listCriteria(criteria));
		model.addAttribute("pageMaker", pageMaker);
		return "article/paging/list";
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	/*public String read(@RequestParam(value="article_no", required=false) int article_no, @ModelAttribute("criteria") Criteria criteria,*/
	public String read(@RequestParam("article_no") int article_no, @ModelAttribute("criteria") Criteria criteria,			
			Model model) throws Exception {
		logger.info("paging read() called ...");
		model.addAttribute("article", articleService.read(article_no));
		return "article/paging/read";
	}	
	

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("article_no") int article_no, @ModelAttribute("criteria") Criteria criteria,
			Model model) throws Exception {
		logger.info("paging modifyGet() called ...");
		model.addAttribute("article", articleService.read(article_no));
		return "article/paging/modify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(ArticleVO articleVO, Criteria criteria, RedirectAttributes redirectAttributes)
			throws Exception {
		logger.info("paging modifyPOST() called ...");
		articleService.update(articleVO);
		redirectAttributes.addAttribute("page", criteria.getPage());
		redirectAttributes.addAttribute("perPageNum", criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "modSuccess");
		return "redirect:/article/paging/list";
	}

	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("article_no") int article_no, Criteria criteria,
			RedirectAttributes redirectAttributes) throws Exception {
		logger.info("paging remove() called ...");
		articleService.delete(article_no);
		redirectAttributes.addAttribute("page", criteria.getPage());
		redirectAttributes.addAttribute("perPageNum", criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "delSuccess");
		return "redirect:/article/paging/list";
	}
}
