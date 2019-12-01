package web.dao.face;

import web.dto.Recommend;

public interface RecommendDao {
	
	/**
	 * 게시글 추천상태를 위한 COUNT 조회
	 * 
	 * @param recommend - 추천상태 정보 저장 객체
	 * @return int - 추천상태 확인 값
	 */
	public int selectCntRecommend(Recommend recommend);

	/**
	 * 추천 기록
	 * 
	 * @param recommend - 추천 정보
	 */
	public void insertRecommend(Recommend recommend);
	
	/**
	 * 추천 삭제
	 * 
	 * @param recommend - 추천 정보
	 */
	public void deleteRecommend(Recommend recommend);
	
	/**
	 * 총 추천 수 구하기
	 *  
	 * @param board - 추천 대상 게시글 번호 객체
	 * @return int - 게시글의 총 추천 수
	 */
	public int selectTotalCntRecommend(Recommend recommend);
}
