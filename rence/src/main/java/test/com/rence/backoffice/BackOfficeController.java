/**
 * 
 * @author 최진실
 *
 */
package test.com.rence.backoffice;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import test.com.rence.sendemail.AuthVO;
import test.com.rence.sendemail.BackOfficeSendEmail;
import test.com.rence.sendemail.EmailVO;

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
	BackOfficeSendEmail authSendEmail;

	@Autowired
	OperatingTime operatingTime;
	
	@Autowired
	HttpSession session;
	
//	@Autowired
//	HttpServletResponse response;
	
	/**
	 * 백오피스 랜딩
	 */
	@RequestMapping(value = "/backoffice_landing", method = RequestMethod.GET)
	public String backoffice_landing() {

		return ".landing/landing";
	}
	
	/**
	 * 백오피스 신청 폼 출력
	 */
	@RequestMapping(value = "/backoffice_insert", method = RequestMethod.GET)
	public String backoffice_insert() {
		
		return ".landing/insert";
	}

	/**
	 * 백오피스 신청 처리
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/backoffice_insertOK", method = RequestMethod.POST)
	public String backoffice_insertOK(BackOfficeVO vo, BackOfficeOperationgTimeVO ovo) throws ParseException {
		logger.info("vo::::::::::::::::::::::::::{}",vo);
		
		//백오피스 이미지
		logger.info("{} byte", vo.getMultipartFile().getSize());

		if (vo.getMultipartFile().getSize() > 0) {
			logger.info("{} byte", vo.getMultipartFile().getOriginalFilename());
			List<String> imgs = new ArrayList<String>();
			String bimg="";
			for (int i = 0; i < imgs.size(); i++) {
				imgs.add(vo.getMultipartFile().getOriginalFilename());
				bimg = imgs.stream().collect(Collectors.joining(","));
			}

			vo.setBackoffice_image(bimg);
		} else {
			vo.setBackoffice_image("img_room_001.jpg"); // null 기본 이미지
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
//		vo.setBackoffice_tag(vo.getBackoffice_tag().replace("%2C", ","));
		
		//공간 옵션
//		vo.setBackoffice_option(vo.getBackoffice_option().replace("%2C",","));
	
		//주변시설
//		vo.setBackoffice_around(vo.getBackoffice_around().replace("%2C", ",")); 
		
		//운영시간
		ovo = operatingTime.operatingTime(ovo);
		
		//회원가입 서비스 동작
		//백오피스 insert
		BackOfficeVO bvo2 = service.backoffice_insertOK(vo);
		logger.info("vo::::::::::::::::::::::::::{}",vo);

		//운영시간 insert
		ovo.setBackoffice_no(bvo2.getBackoffice_no());
		int result = service.backoffice_operating_insert(ovo);
		logger.info("ovo::::::::::::::::::::::::::{}",ovo);

		String rt = "redirect:backoffice_landing";
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
	public JSONObject backoffice_auth(AuthVO avo, BackOfficeVO bvo, EmailVO evo) {
		logger.info("Welcome sendMailOK.do");
		logger.info("{}", bvo);
		
		JSONObject jsonObject = new JSONObject();
		
		//이메일 중복 체크
		BackOfficeVO emailCheck = service.backoffice_email_check(bvo);
		if(emailCheck==null) {
			
			avo.setUser_email(bvo.getBackoffice_email());
			
			//이메일 전송
			avo = authSendEmail.sendEmail(avo,evo);
			if (avo !=null) {
				
				//avo2 = auth 테이블에 정보 저장 후, select 해온 결과값
				AuthVO avo2 = service.backoffice_auth_insert(avo);
				logger.info("successed...");
				logger.info("=============avo2:{}",avo2);
				
				jsonObject.put("result", "1");
				jsonObject.put("auth_code", avo2.getAuth_code());
				jsonObject.put("backoffice_email", avo2.getUser_email());
				jsonObject.put("auth_no", avo2.getAuth_no());
				
			}else {
				logger.info("failed...");
				jsonObject.put("result", "0");
			}
		}else {
			logger.info("failed...");
			jsonObject.put("result", "0");
		}
		
		
		return jsonObject;
	}

	/**
	 * 이메일 인증번호 확인
	 */
	@RequestMapping(value = "/backoffice_authOK", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject backoffice_authOK(AuthVO avo) {
		 
		AuthVO avo2 = service.backoffice_authOK_select(avo);

		JSONObject jsonObject = new JSONObject();

	    if(avo2 != null){
	    	logger.info("successed...");
	    	jsonObject.put("result", "1");
	    	service.backoffice_auth_delete(avo2);

	    }else{
	    	logger.info("failed...");
	    	jsonObject.put("result", "0");
	    }
		return jsonObject;
	}
	
	
	/**
	 * 로그인 처리
	 */
	@RequestMapping(value = "/backoffice_loginOK", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject backoffice_loginOK(BackOfficeVO bvo, HttpServletResponse response) {
		logger.info("backoffice_loginOK()...");
		BackOfficeVO bvo2 = service.backoffice_login(bvo);
		logger.info("result: {}.",bvo2);
		
		JSONObject jsonObject = new JSONObject();
		
		if (bvo2 != null) {
			session.setAttribute("backoffice_no", bvo2.getBackoffice_no());
			Cookie cookie_1 = new Cookie("backoffice_no", bvo2.getBackoffice_no());
			session.setAttribute("backoffice_id", bvo2.getBackoffice_id());
			Cookie cookie_2 = new Cookie("backoffice_id", bvo2.getBackoffice_id());
			session.setAttribute("backoffice_pw", bvo2.getBackoffice_pw());
			Cookie cookie_3 = new Cookie("backoffice_pw", bvo2.getBackoffice_pw());
			jsonObject.put("result", "1");
	    	logger.info("successed...");
	    	response.addCookie(cookie_1);
			response.addCookie(cookie_2);
			response.addCookie(cookie_3);
		} else {
			logger.info("failed...");
			jsonObject.put("result", "0");
		}
		
		return jsonObject;
		
	}
	
	/**
	 * 로그아웃 처리
	 */
	@RequestMapping(value = "/backoffice_logout", method = RequestMethod.GET)
	public String backoffice_logout( HttpServletRequest request, HttpServletResponse response) {
		logger.info("backoffice_logout()...");
		session = request.getSession();
        session.removeAttribute("backoffice_id");
        
        Cookie[] cookies = request.getCookies(); 
		if (cookies != null) { 

			for (int i = 0; i < cookies.length; i++) {

				cookies[i].setMaxAge(0); 

				response.addCookie(cookies[i]); 

			}

		}
		
		return "redirect:/"; //백오피스 랜딩으로 이동
	}
	
	/**
	 * 비밀번호 초기화(찾기), 이메일로 임시 비밀번호 전송
	 */
	@RequestMapping(value = "/backoffice_reset_pw", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject backoffice_reset_pw(BackOfficeVO bvo, EmailVO evo) {
		logger.info("backoffice_reset_pw ()...");
		logger.info("{}", bvo);
		
		JSONObject jsonObject = new JSONObject();
		
		BackOfficeVO bvo2 = service.backoffice_id_email_select(bvo);
		
		if(bvo2!=null) {
			bvo2 = authSendEmail.findPw(bvo2,evo);
			
			
			if (bvo2!=null) {
				service.backoffice_settingOK_pw(bvo2);
				logger.info("successed...");
				jsonObject.put("result", "1");
				
			}else {
				logger.info("update failed...");
				jsonObject.put("result", "0");
			}
		}else {
			logger.info("send failed...");
			jsonObject.put("result", "0");
		}
		
		return jsonObject;
	}
	
	/**
	 * 비밀번호 초기화 페이지
	 */
	@RequestMapping(value = "/backoffice_setting_pw", method = RequestMethod.GET)
	public String backoffice_setting_pw(Model model, BackOfficeVO bvo) {
		model.addAttribute("vo",bvo.getBackoffice_no());
		return "backoffice/setting_pw";
	}
	
	/**
	 * 비밀번호 초기화 완료
	 */
	@RequestMapping(value = "/backoffice_settingOK_pw", method = RequestMethod.POST)
	public String backoffice_settingOK_pw(BackOfficeVO bvo) {
		logger.info("backoffice_settingOK_pw ()...");
		logger.info("{}", bvo);
		
		int result = service.backoffice_settingOK_pw(bvo);
		
		String rt = "";
		if (result==1) {
			logger.info("successed...");
			rt = "redirect:backoffice_landing";
		}
		
		else {
			logger.info("failed...");
			rt = "backoffice/setting_pw";
		}
		
		return rt;
	}
	
	/**
	 * 환경설정 페이지 출력
	 */
	@RequestMapping(value = "/backoffice_setting", method = RequestMethod.GET)
	public String backoffice_setting(BackOfficeVO bvo, Model model) {
		logger.info("backoffice_setting()...");
		BackOfficeVO bvo2 = service.backoffice_setting_selectOne(bvo);
		logger.info("result: {}.",bvo2);
		
		model.addAttribute("vo",bvo2);
		
		return "backoffice/setting";
	}
	
	/**
	 * 환경설정에서 비밀번호 수정
	 */
	@RequestMapping(value = "/backoffice_update_pw", method = RequestMethod.POST)
	public String backoffice_update_pw (BackOfficeVO bvo) {
		logger.info("backoffice_update_pw ()...");
		logger.info("{}", bvo);
		
		//비밀번호 일치 여부 확인
		BackOfficeVO bvo2 = service.backoffice_select_pw(bvo);
		
		String rt = "";
		if (bvo2!=null) {
			logger.info("successed...");
			rt = "redirect:backoffice_setting_pw";
		}
		
		else {
			logger.info("failed...");
			rt = "backoffice/setting";
		}
		
		return rt;
	}
	
	/**
	 * 환경설정에서 업체 탈퇴 요청
	 */
	@RequestMapping(value = "/backoffice_setting_delete", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject backoffice_setting_delete (BackOfficeVO bvo) {
		logger.info("backoffice_setting_delete ()...");
		logger.info("{}", bvo);
		
		JSONObject jsonObject = new JSONObject();
		
		int result = service.backoffice_setting_delete(bvo);
		
		if (result==1) {
			logger.info("successed...");
			jsonObject.put("result", "1");
		}
		
		else {
			logger.info("failed...");
			jsonObject.put("result", "0"); // 남은 예약이 있을 시
		}
		
		return jsonObject;
	}
	
}
