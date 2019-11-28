package web.dao.face;

import java.util.List;

import util.Paging;
import web.dto.BUser;

public interface AdminDao {

	/**
	 * 회원 전체 조회
	 * 
	 * @return List - 조회된 회원 목록
	 */
	public List selectAll();

	public List selectAll(Paging paging);
	
	public int selectCntAll();

	public BUser selectMemberByUserno(BUser viewBoard);
	
	public void deleteMemberList(String names);
		
}
