package com.ic.alang.requestboard.mapper;

import java.util.ArrayList;

import com.ic.alang.vo.RequestBoardVo;
import com.ic.alang.vo.RequestReplyVo;

public interface RequestBoardSQLMapper {

	public void requestBoardWrite(RequestBoardVo vo);
	
	public ArrayList<RequestBoardVo> getRequestBoardList();
	
	public RequestBoardVo getRequestBoardByNo(int no);
	
	public void deleteRequestByNo(int no);
	
	public void updateRequestBoard(RequestBoardVo vo);
	
	public void requestReplyWrite(RequestReplyVo vo);
	
	public void deleteRequestReplyByNo(int no);
	
	public void updateRequestReply(RequestReplyVo vo);
	
	public ArrayList<RequestReplyVo> getRequestReplyList(int no);
	
}
