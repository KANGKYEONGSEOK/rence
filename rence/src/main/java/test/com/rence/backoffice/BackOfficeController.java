package test.com.rence.backoffice;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import test.com.rence.sendemail.AuthSendEmail;
import test.com.rence.sendemail.AuthVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BackOfficeController {

	private static final Logger logger = LoggerFactory.getLogger(BackOfficeController.class);

	@Autowired
	ServletContext context;

	@Autowired
	BackOfficeService service;

	@Autowired
	AuthSendEmail authSendEmail;

	@Autowired
	OperatingTime operatingTime;
	
//	@Autowired
//	HttpServletResponse response;
	
	/**
	 * 백오피스 신청 폼 출력
	 */
	@RequestMapping(value = "/backoffice_insert", method = RequestMethod.GET)
	public String backoffice_insert() {

		return "backoffice/insert";
	}

	/**
	 * 백오피스 신청 처리
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/backoffice_insertOK", method = RequestMethod.GET)
	public String backoffice_insertOK(BackOfficeVO vo, BackOfficeOperationgTimeVO ovo) throws ParseException {
		
		//백오피스 이미지
		logger.info("{} byte", vo.getMultipartFile().getSize());

		if (vo.getMultipartFile().getSize() > 0) {
			logger.info("{} byte", vo.getMultipartFile().getOriginalFilename());
			List<String> imgs = new ArrayList<String>();
			imgs.add(vo.getMultipartFile().getOriginalFilename());
			String bimg = imgs.stream().collect(Collectors.joining(","));

			vo.setBackoffice_image(bimg);
		} else {
			vo.setBackoffice_image("img_001.jpg"); // null 기본 이미지
		}
		String dir_path = context.getRealPath("resources/upload");
		logger.info(dir_path);

		File saveFile = new File(dir_path + "/", vo.getBackoffice_image());

//			String formmatName = vo.getBackoffice_image().substring(vo.getBackoffice_image().lastIndexOf(".") + 1);
//			logger.info("formmatName:{}", formmatName);

		try {
			vo.getMultipartFile().transferTo(saveFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//태그
		List<String> tags = new ArrayList<String>();
		tags.add(vo.getBackoffice_tag());
		String btag = tags.stream().collect(Collectors.joining(","));

		vo.setBackoffice_tag(btag);

		//공간 옵션
		List<String> ops = new ArrayList<String>();
		ops.add(vo.getBackoffice_option());
		String bop = ops.stream().collect(Collectors.joining(","));
		
		vo.setBackoffice_option(bop);
		
		//주변시설
		List<String> arounds = new ArrayList<String>();
		arounds.add(vo.getBackoffice_around());
		String baround = arounds.stream().collect(Collectors.joining(","));
		
		vo.setBackoffice_around(baround);
		
		//운영시간
		ovo = operatingTime.operatingTime(ovo);
		 
		//이메일 인증 코드 유효 확인
		//service.backoffice_auth_select(vo);
		
		service.backoffice_insertOK(vo);
		ovo.setBackoffice_no(vo.getBackoffice_no());
		
		int result = service.backoffice_operating_insert(ovo);

		String rt = "redirect:selectAll";
		if(result==0) {
			return "redirect:backoffice_insert";
		}
		
		return rt;
	}

	/**
	 * 이메일 인증번호 요청
	 */
	@RequestMapping(value = "/backoffice_auth", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> backoffice_auth(AuthVO avo, BackOfficeVO bvo) {
		logger.info("Welcome sendMailOK.do");
		logger.info("{}", bvo);
		
		Map<String, String> map = new HashMap<String, String>();
		
		avo.setUser_email(bvo.getBackoffice_email());

		avo = authSendEmail.sendEmail(avo);
		if (avo !=null) {
//			response.addHeader("Access-Control-Allow-Origin", "*");
//			response.addHeader("Access-Control-Allow-Credentials", "true");
			
			service.backoffice_auth_insert(avo);
			logger.info("successed...");
			map.put("result", "1");
			map.put("auth_code", avo.getAuth_code());
			map.put("backoffice_email", avo.getUser_email());
	    	map.put("auth_no", avo.getAuth_no());
			
		}else {
			logger.info("failed...");
			map.put("result", "0");
		}
		
		return map;
	}

	/**
	 * 이메일 인증번호 확인
	 */
	@RequestMapping(value = "/backoffice_authOK", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> backoffice_authOK(BackOfficeVO vo) {
		 
		AuthVO avo = service.backoffice_auth_select(vo);
//		vo.setAuth_no(avo.getAuth_no());
//		model.addAttribute("vo", vo);

		Map<String, String> map = new HashMap<String, String>();
		
//		response.addHeader("Access-Control-Allow-Origin", "*");
//		response.addHeader("Access-Control-Allow-Credentials", "true");
	    if(avo != null){
	    	map.put("result", "1");
	    	logger.info("successed...");
//	    	map.put("auth_code", avo.getAuth_code());
//	    	map.put("backoffice_email", avo.getUser_email());
//	    	map.put("auth_no", avo.getAuth_no());
	    }else{
	    	logger.info("failed...");
	    	map.put("result", "0");
	    }
		return map;
	}

}
