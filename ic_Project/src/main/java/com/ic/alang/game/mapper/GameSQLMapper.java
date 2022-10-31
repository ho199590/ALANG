package com.ic.alang.game.mapper;

import java.util.ArrayList;

import com.ic.alang.vo.BidVo;
import com.ic.alang.vo.GameVo;

public interface GameSQLMapper {
	
	public void gameMake(GameVo vo);
	
	public ArrayList<GameVo> getGameBoardList();
	
	public GameVo showGameByNo(int no);
	
	public void bidDo(BidVo vo);
	
	public void usePointBid(BidVo vo);
	
	public ArrayList<BidVo> showBidByNo(int no);
	
	public ArrayList<Integer> getSecondWinner(int no);
	
}
