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

	/**
	 * 페이징 대상 회원목록 조회
	 * 
	 * @param Paging - 페이징 정보
	 * @return List - 조회된 회원목록
	 */
	public List selectAll(Paging paging);
	
	/**
	 * 총 회원 수 조회
	 * 
	 * @return int - 총 회원 수
	 */
	public int selectCntAll();

	public BUser selectMemberByUserno(BUser viewBoard);
	
	/**
	 * 회원정보 수정
	 * 
	 * @param buser - 수정할 내용을 담은 객체
	 */
	public void updateUser(BUser buser);

	/**
	 * 회원 삭제
	 * 
	 * @param buser - 삭제할 회원번호를 담은 객체
	 */
	public void delete(BUser buser);

	/**
	 * 리스트에서 회원 삭제하기
	 * 
	 * @param names - 삭제할 회원번호 목록들 문자열
	 */
	public void deleteMemberList(String names);

	/**
	 * 검색을 이용한 회원 조회
	 * 
	 * @param search
	 * 
	 * @return int - 총 회원 수
	 */
	public int selectCntAll(String search);
		
}
