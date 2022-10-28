package test.com.rence.user;

import test.com.rence.backoffice.BackOfficeVO;

public interface UserDAO {

	public int user_insertOK(UserVO uvo); // 회원가입완료	

	public UserVO idCheckOK(UserVO uvo); //아이디중복체크

	public UserVO emailCheckOK(UserVO uvo); //이메일중복체크
	
	public UserVO authCheckOK(UserVO uvo); //이메일인증

	public UserVO User_loginOK(UserVO uvo); // 로그인
	
	public UserVO user_email_select(UserVO uvo); // 아이디 찾기에서 이메일 확인

	public UserVO user_id_email_select(UserVO uvo); //비밀번호 찾기에서 아이디,이메일 확인

	public int user_pw_updateOK(UserVO uvo); //회원정보(마이페이지)-비밀번호 수정
	
	public int user_img_updateOK(UserVO uvo); ////회원정보(마이페이지)- 프로필 수정

	public int user_secedeOK(UserVO uvo); //회원탈퇴 
	
	
//	public UserVO user_selectOne(UserVO uvo);// 
	
//	public int user_delete(UserVO uvo); //회원탈퇴
//
//	public String selectOne_name(String no);
//



//
//	public UserVO selectOne_mypage(String no); // 마이페이지
	
	
}// end interface
