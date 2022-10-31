package com.ic.alang.message.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ic.alang.member.mapper.MemberSQLMapper;
import com.ic.alang.message.mapper.MessageSQLMapper;
import com.ic.alang.vo.MemberVo;
import com.ic.alang.vo.MessageVo;

@Service
public class MessageServiceImpl {
	
	@Autowired
	private MessageSQLMapper messageSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	public void writeMessage(MessageVo vo) {
		messageSQLMapper.writeMessage(vo);
	}
	
	public ArrayList<HashMap<String, Object>> getRecvMessageList(){
		
		ArrayList<HashMap<String, Object>>  msg = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<MessageVo> messagelist = messageSQLMapper.getRecvMessageList();
		
		for(MessageVo messageVo : messagelist) {
			
			int message_send = messageVo.getMessage_send();
			MemberVo memberVosend= memberSQLMapper.getMemberByNo(message_send);
			System.out.println(message_send);
//			int message_recv = messageVo.getMessage_recv();
//			MemberVo memberVorecv = memberSQLMapper.getMemberByNo(message_recv);
			
			HashMap<String, Object> messageMap = new HashMap<String, Object>();
			
			messageMap.put("messageVo", messageVo);
//			messageMap.put("memberVorecv", memberVorecv);
			messageMap.put("memberVosend", memberVosend);
			 
			msg.add(messageMap);
		
		}
		return msg;
	}
	public HashMap<String, Object> getMessage(int message_no){
		
		HashMap<String,Object> map = new HashMap<String, Object>();
	
		MessageVo messageVo = messageSQLMapper.getMessageByNo(message_no);
		int message_send = messageVo.getMessage_send();
		MemberVo memberVo = memberSQLMapper.getMemberByNo(message_send);
		map.put("messageVo", messageVo);
		map.put("memberVo", memberVo);
		
		return map;
	}
	
	public MessageVo sendMessageByNo(int message_send) {
		MessageVo messageVo = messageSQLMapper.sendMessageListByNo(message_send);
		
		return messageVo;
	}
	
	public void deleteMessageByNo(int message_no) {
		messageSQLMapper.deleteMessageByNo(message_no);
	}
	
	public MemberVo getMemberInfoByID (String id) {
		
	 return	memberSQLMapper.getMemberByID(id);
	}
}
	
	
	
//	@Autowired
//	private MessageSQLMapper messageSQLMapper;
//	
//	@Autowired
//	private MemberSQLMapper memberSQLMapper;
//	
//	public void 
//	
//	public ArrayList<MessageVo> messageList(){
//		ArrayList<MessageVo> list = messageSQLMapper.messageList();
//		
//		String 
//		return null;
		
		
		
//			
//		String member_name = vo.getMember_name();
//		
//		//메세지 리스트에 나타낼것들 불러오기 -
//		ArrayList<MessageVo> list = messageSQLMapper.messageList(vo);
//		
//		for(MessageVo messageVo : list) {
//			messageVo.setMember_name(member_name);
//			//현 사용자가 해당 message_room에서 안읽은 메세지의 갯수를 가져옴 
//			int unread = messageVo.getUnread();
//			messageVo=messageSQLMapper.countUnRead(unread);
//			//현 사용자가 메세지를 주고 받는 상대 id를 가져옴 
//			String member_id = messageVo.getMember_id();
//			messageVo=messageSQLMapper.getOtherID(member_id);
//			//안읽은 메세지 갯수를 messageVo에 set하기 
//			messageVo.setUnread(unread);
//			//메세지 상대 id를 messageVo에 set하기
//			messageVo.setMember_id(member_id);
//			//메세지 상대  id을 세팅하기 other_name 
//			if(member_id.equals(messageVo.getSend_name())) {
//				messageVo.setOther_member_name(messageVo.getRecv_name());
//			}else {
//				messageVo.setOther_member_name(messageVo.getSend_name());
//			}
//			
//		}
//		
//		return list;
//	}
//	//message_room 별로 메세지 내용을 가져온다.
//	public ArrayList<MessageVo> roomContentList(MessageVo vo){
//			
//		System.out.println("message_room:"+vo.getMessage_room());
//		System.out.println("recv_name:"+vo.getRecv_name());
//		System.out.println("member_name:"+vo.getMember_name());
//		
//		//메세지 내역을 가져옴
//		ArrayList<MessageVo> clist = messageSQLMapper.roomContentList(vo);
//		
//		//해당 방의 메세지들 중 받는 사람이 현재 사용자의 name인 메세지를 모두 읽음 처리 시킴
//		messageSQLMapper.messageReadChk(vo);
//		return clist;
//	}
//	//메세지 list에 메세지를 보낸다.몰르것네 
//	public void messageSendInList(MessageVo vo) {
//	
//		messageSQLMapper.messageSendInList(vo);	
//			
//		}
		
			
//	}
	

	
	
