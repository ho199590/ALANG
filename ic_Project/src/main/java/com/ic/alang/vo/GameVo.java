package com.ic.alang.vo;

import java.util.Date;

public class GameVo {

	private int game_no;
	private int game_win_point;
	private Date game_start_time;
	private Date game_end_time;
	
	public GameVo() {
		super();
	}

	public GameVo(int game_no, int game_win_point, Date game_start_time, Date game_end_time) {
		super();
		this.game_no = game_no;
		this.game_win_point = game_win_point;
		this.game_start_time = game_start_time;
		this.game_end_time = game_end_time;
	}

	public int getGame_no() {
		return game_no;
	}

	public void setGame_no(int game_no) {
		this.game_no = game_no;
	}

	public int getGame_win_point() {
		return game_win_point;
	}

	public void setGame_win_point(int game_win_point) {
		this.game_win_point = game_win_point;
	}

	public Date getGame_start_time() {
		return game_start_time;
	}

	public void setGame_start_time(Date game_start_time) {
		this.game_start_time = game_start_time;
	}

	public Date getGame_end_time() {
		return game_end_time;
	}

	public void setGame_end_time(Date game_end_time) {
		this.game_end_time = game_end_time;
	}
	
	
}
