package com.ic.alang.game.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ic.alang.game.mapper.GameSQLMapper;
import com.ic.alang.member.mapper.MemberSQLMapper;
import com.ic.alang.vo.BidVo;
import com.ic.alang.vo.GameVo;
import com.ic.alang.vo.MemberVo;

@Service
public class GameServiceImpl {
	
	@Autowired
	private GameSQLMapper gameSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	
	public void gameMake(GameVo vo) {
		gameSQLMapper.gameMake(vo);
	}
	public ArrayList<HashMap<String, Object>> getGameBoardList(){
		
		ArrayList<HashMap<String, Object>> gamelist = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<GameVo> gameboardlist = gameSQLMapper.getGameBoardList();
		
		for(GameVo gameVo : gameboardlist) {
			
			HashMap<String, Object> gameMap = new HashMap<String, Object>();
			gameMap.put("gameVo", gameVo);
			
			gamelist.add(gameMap);
		}
		
		return gamelist;
		
	}
	public void bidDo(BidVo vo) {
		gameSQLMapper.bidDo(vo);
	}
	public void usePointBid(BidVo vo) {
		gameSQLMapper.usePointBid(vo);
	}
	
	public HashMap<String, Object> showGame(int game_no) {
		
		HashMap<String, Object>showGameMap = new HashMap<String, Object>();
		
		GameVo gameVo = gameSQLMapper.showGameByNo(game_no);
		
		showGameMap.put("gameVo", gameVo);
		
		return showGameMap;
	}
	
	public ArrayList<HashMap<String, Object>> getGameDetailByGameNo(int game_no){
		
		ArrayList<HashMap<String, Object>> bidDetailList = new ArrayList<HashMap<String,Object>>();
		ArrayList<BidVo> bidList = gameSQLMapper.showBidByNo(game_no);
		
		for(BidVo bidVo : bidList ) {
			int member_no = bidVo.getMember_no();
			
			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("bidVo", bidVo);
			bidDetailList.add(map);
		}
		return bidDetailList;
	}
	 public ArrayList<HashMap<String, Object>> getSecondWinnerList(int game_no){
		 
			ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String, Object>>();
			ArrayList<Integer> secondWinner = gameSQLMapper.getSecondWinner(game_no);
			
			for(int memberno : secondWinner) {
				MemberVo secondWinnerInfo = memberSQLMapper.getMemberByNo(memberno);
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("secondWinnerInfo", secondWinnerInfo);
				result.add(map);
				}
			return result;
	 }
}
