package test.com.rence.backoffice;

import test.com.rence.sendemail.AuthVO;

public interface BackOfficeDAO {

	public int backoffice_auth_insert(AuthVO vo);
	
	public int backoffice_insertOK(BackOfficeVO bvo);

	public int backoffice_operating_insert(BackOfficeOperationgTimeVO ovo);

	public AuthVO backoffice_auth_select(BackOfficeVO vo);
	
}
