package com.ic.alang.freebord.mapper;

import java.util.ArrayList;

import com.ic.alang.vo.FreeBoardVo;
import com.ic.alang.vo.FreeImageBoardVo;
import com.ic.alang.vo.FreeReplyBoardVo;

public interface FreeBoardSQLMapper {
	
	public int createFreePK();
	
	public void freeWriteContent(FreeBoardVo vo);
	
	public ArrayList<FreeBoardVo> getFreeList();
	
	public FreeBoardVo getFreeBoardByNo(int no);
	
	public void deleteByNo(int no);
	
	public void update(FreeBoardVo vo);
	
	public void freeviewcount(int no);
	//댓글
	public void freeReplyWriteContent(FreeReplyBoardVo vo);
	
	public void deleteReplyByNo(FreeReplyBoardVo no);
	
	public void updateReply(FreeReplyBoardVo vo);
	
	public ArrayList<FreeReplyBoardVo> getFreeReplyListByBoardNo(int free_no);
	
	//이미지
	public void registerFreeImage(FreeImageBoardVo vo);
	
	public ArrayList<FreeImageBoardVo> getFreeBoardImageByFreeNo(int free_no);
	

}
