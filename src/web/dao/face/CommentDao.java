package web.dao.face;

import java.util.List;

import util.Paging;
import web.dto.BBoard;
import web.dto.BUser;
import web.dto.Bcomment;

public interface CommentDao {

	void insertComment(Bcomment comment);

	List<Bcomment> selectComment(BBoard list);

	void deleteComment(Bcomment comment);

	int countComment(Bcomment comment);

	List<Bcomment> selectMycomment(Paging paging, BUser userno);

	void deleteCommentList(String names);

}
