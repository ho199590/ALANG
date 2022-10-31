package com.ic.alang.freebord.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ic.alang.freebord.mapper.FreeBoardSQLMapper;
import com.ic.alang.member.mapper.MemberSQLMapper;
import com.ic.alang.vo.FreeBoardVo;
import com.ic.alang.vo.FreeImageBoardVo;
import com.ic.alang.vo.FreeReplyBoardVo;
import com.ic.alang.vo.MemberVo;

@Service
public class FreeBoardServiceImpl {
	
	@Autowired
	private FreeBoardSQLMapper freeBoardSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	public void freeWriteContent(FreeBoardVo vo , ArrayList<FreeImageBoardVo> freeimageVoList) {
	
		int free_no = freeBoardSQLMapper.createFreePK();
		vo.setFree_no(free_no);
		freeBoardSQLMapper.freeWriteContent(vo);
		
		//이미지 insert
		for(FreeImageBoardVo freeimageVo : freeimageVoList) {
			freeimageVo.setFree_no(free_no);
			freeBoardSQLMapper.registerFreeImage(freeimageVo);
			
		}
		
	}

	public ArrayList<HashMap<String, Object>> getFreeBoardList() {
		
		ArrayList <HashMap<String, Object>> freelist = new ArrayList <HashMap<String, Object>>();
		
		ArrayList<FreeBoardVo> freeBoardList = freeBoardSQLMapper.getFreeList();
		
		for(FreeBoardVo freeBoardVo :freeBoardList) {
			int member_no = freeBoardVo.getMember_no();
			
			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("freeBoardVo", freeBoardVo);
		
			freelist.add(map);
			
			}
		
		return freelist;
		
	}
	
	public HashMap<String, Object> getFreeBoard(int free_no) {
		
		freeBoardSQLMapper.freeviewcount(free_no);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		FreeBoardVo freeboardVo = freeBoardSQLMapper.getFreeBoardByNo(free_no);
		int member_no = freeboardVo.getMember_no();
		MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
		
		ArrayList<FreeImageBoardVo>freeimageVoList = 
				freeBoardSQLMapper.getFreeBoardImageByFreeNo(free_no);
		
		
		map.put("freeboardVo", freeboardVo);
		map.put("memberVo", memberVo);
		map.put("freeimageVoList", freeimageVoList);
	
		return map;
		
		
	}
	
	public void deleteContent(int free_no) {
		freeBoardSQLMapper.deleteByNo(free_no);
	}
	
	public void updateContent(FreeBoardVo vo) {
		freeBoardSQLMapper.update(vo);
	}
	
	
	
	//댓글
	public void freeReplyWriteContent(FreeReplyBoardVo vo) {
		
		freeBoardSQLMapper.freeReplyWriteContent(vo);
	}
	
	public void deleteReply(FreeReplyBoardVo no) {
		freeBoardSQLMapper.deleteReplyByNo(no);
	}
	
	public void updateReply(FreeReplyBoardVo vo) {
		
		freeBoardSQLMapper.updateReply(vo);
	}
	
	public ArrayList<HashMap<String, Object>> getFreeReplyListByBoardNo(int replyNo){
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		ArrayList<FreeReplyBoardVo> replylist = freeBoardSQLMapper.getFreeReplyListByBoardNo(replyNo);
				
		for(FreeReplyBoardVo freeReplyBoardVo: replylist) {
			int memberNo = freeReplyBoardVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.getMemberByNo(memberNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("freeReplyBoardVo", freeReplyBoardVo);
			list.add(map);
		
		}
			return list;

		}
		
	}

