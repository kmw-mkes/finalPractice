package egovframework.com.board.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.board.service.BoardService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("BoardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService{

	@Resource(name="BoardDAO")
	private BoardDAO boardDAO;

	@Override
	public List<HashMap<String, Object>> selectBoardList(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardList(paramMap);
	}

	@Override
	public int selectBoardListCnt(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardListCnt(paramMap);
	}

	@Override
	public int saveBoard(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		int resultChk = 0;
	
		return resultChk;
	}

	@Override
	public HashMap<String, Object> selectBoardDetail(int boardIdx) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardDetail(boardIdx);
	}

	@Override
	public int deleteBoard(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return boardDAO.deleteBoard(paramMap);
	}

	@Override
	public int insertReply(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return boardDAO.insertReply(paramMap);
	}

	@Override
	public List<HashMap<String, Object>> selectBoardReply(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardReply(paramMap);
	}

	@Override
	public int deleteReply(int replyIdx) {
		// TODO Auto-generated method stub
		return boardDAO.deleteBoardReply(replyIdx);
	}
	
}
