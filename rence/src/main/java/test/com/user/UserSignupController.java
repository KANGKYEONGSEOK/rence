/**
	 *  ȸ�����Կ� ���õ� ��Ʈ�ѷ�
	 */

package test.com.user;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class UserSignupController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserSerivice service;
	@Autowired
	UserFileuploadService fileuploadService;
	@Autowired
	ServletContext context;

	// 회원가입 페이지 요청
	@RequestMapping(value = "/user_insert", method = RequestMethod.GET)
	public String user_insert() {
		logger.info("Welcome! user_insert");
		return "user/signup"; // ȸ������ ��������...
	}

	// 회원가압완료
	@RequestMapping(value = "/insertOK", method = RequestMethod.POST)
	public String insertOK(UserVO uvo) {
		logger.info("Welcome! insertOK");
		logger.info("result: {}", uvo);

		// 사진(파일)업로드
		uvo = fileuploadService.FileuploadOK(uvo);
		logger.info("fileresult: {}", uvo);

		// insert(성공시 1)
		int result = service.user_insertOK(uvo);
		logger.info("result: {}", result);

		return "home"; // 회원가입후 로그인을 위한 홈화면 이동

	}
	
	

	// 아이디 체크
	@RequestMapping(value = "/user_idCheckOK", method = RequestMethod.POST)
		public Map<String, String> user_idCheck(UserVO uvo) {
			logger.info("Welcome! user_idCheckOK");
			logger.info("result: {}", uvo);
			
			
		    uvo.setUser_id(request.getParameter("id"));
			
		    UserVO uvo2 = service.idCheckOK(uvo);
		    
		    Map<String, String> map = new HashMap<String, String>();
		    
		    //uvo가 null이 아니면 아이디 존재
		    if(uvo2 != null){
		    	map.put("result", "0"); //아이디 존재("NOT OK")
		    }else{
		    	map.put("result", "1"); //아이디 사용가능("OK")
		    }
		}

}// end class
