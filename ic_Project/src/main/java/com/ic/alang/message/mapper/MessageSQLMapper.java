package com.ic.alang.message.mapper;

import java.util.ArrayList;

import com.ic.alang.vo.MessageVo;

public interface MessageSQLMapper {

	public ArrayList<MessageVo> getRecvMessageList();
	
	public void writeMessage(MessageVo vo);
	
	//거의 안쓸거 
	public MessageVo getMessageByNo(int no);
	
	public MessageVo sendMessageListByNo(int no);
	
	public void deleteMessageByNo(int no);
	
	
	
//	public ArrayList<MessageVo> messageList(MessageVo vo);
//	
//	public MessageVo getOtherID(String no);
//	
//	public MessageVo countUnRead(int no);
//	
//	public ArrayList<MessageVo> roomContentList(MessageVo vo);
//	
//	//update
//	public void messageReadChk(MessageVo vo);
//	
//	//insert
//	public void messageSendInList(MessageVo vo);
//	
//	public MessageVo maxRoom(int vo);
//	
//	public MessageVo existChat(int vo);
//	
//	public MessageVo selectMessageRoom(int no);
	
}	
