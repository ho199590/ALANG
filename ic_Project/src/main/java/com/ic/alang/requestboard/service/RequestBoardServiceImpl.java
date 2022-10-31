package com.ic.alang.requestboard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ic.alang.member.mapper.MemberSQLMapper;
import com.ic.alang.requestboard.mapper.RequestBoardSQLMapper;
import com.ic.alang.vo.MemberVo;
import com.ic.alang.vo.RequestBoardVo;
import com.ic.alang.vo.RequestReplyVo;

@Service
public class RequestBoardServiceImpl {
	
	@Autowired
	private RequestBoardSQLMapper requestBoardSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	public void requestBoardWrite(RequestBoardVo vo) {
		requestBoardSQLMapper.requestBoardWrite(vo);
	}
	public void requestReplyWrite(RequestReplyVo vo) {
		requestBoardSQLMapper.requestReplyWrite(vo);
	}
	
	
	public ArrayList<HashMap<String, Object>> getRequestList() {
		
		ArrayList<HashMap<String, Object>> requestlist = new ArrayList<HashMap<String,Object>>();

		ArrayList<RequestBoardVo>  requestboardlist = requestBoardSQLMapper.getRequestBoardList();
		
		for(RequestBoardVo requestBoardVo : requestboardlist) {
			int member_no = requestBoardVo.getMember_no();
			
			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
			
			HashMap<String, Object> requestMap = new HashMap<String, Object>();
			requestMap.put("memberVo", memberVo);
			requestMap.put("RequestBoardVo", requestBoardVo);
			
			requestlist.add(requestMap);
		}
		return requestlist;
	}
	public HashMap<String, Object> getRequestBoard(int request_no){
		
		HashMap<String, Object> requestMap = new HashMap<String, Object>();
		
		RequestBoardVo requestBoardVo = requestBoardSQLMapper.getRequestBoardByNo(request_no);
		int member_no = requestBoardVo.getMember_no();
		MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
		
		requestMap.put("requestBoardVo", requestBoardVo);
		requestMap.put("memberVo", memberVo);
		
		return requestMap;	
	}
	
	public void deleteRequest(int request_no) {
		requestBoardSQLMapper.deleteRequestByNo(request_no);
	}
	public void deleteRequestReplyByNo(int request_reply_no) {
		requestBoardSQLMapper.deleteRequestReplyByNo(request_reply_no);
	}
	
	public void updateRequest(RequestBoardVo vo) {
		requestBoardSQLMapper.updateRequestBoard(vo);
	}
	public void updateRequestReply(RequestReplyVo vo) {
		requestBoardSQLMapper.updateRequestReply(vo);
	}
	
	public ArrayList<HashMap<String, Object>> getRequestReplyList(int request_no) {
		
		ArrayList<HashMap<String, Object>> replylist = new ArrayList<HashMap<String,Object>>();

		ArrayList<RequestReplyVo>  requestreplylist = requestBoardSQLMapper.getRequestReplyList(request_no);
		
		for(RequestReplyVo requestReplyVo : requestreplylist) {
			int member_no = requestReplyVo.getMember_no();
			
			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
			
			HashMap<String, Object> replyMap = new HashMap<String, Object>();
			replyMap.put("memberVo", memberVo);
			replyMap.put("RequestReplyVo", requestReplyVo);
			
			replylist.add(replyMap);
		}
		return replylist;
}
}
