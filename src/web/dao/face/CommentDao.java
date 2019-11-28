package web.dao.face;

import java.util.List;

import web.dto.BBoard;
import web.dto.Bcomment;

public interface CommentDao {

	void insertComment(Bcomment comment);

	List<Bcomment> selectComment(BBoard list);

	void deleteComment(Bcomment comment);

	int countComment(Bcomment comment);

}
