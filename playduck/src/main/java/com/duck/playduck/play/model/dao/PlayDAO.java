package com.duck.playduck.play.model.dao;

import java.util.List;

import com.duck.playduck.play.model.vo.Play;
import com.duck.playduck.play.model.vo.PlayAll;
import com.duck.playduck.play.model.vo.PlayElement;

public interface PlayDAO {

	int selectTotalContents();
	List<PlayAll> selectPlayList(int cPage, int numPerPage);
	


}
