package com.duck.playduck.md.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duck.playduck.md.model.dao.MdDAO;
import com.duck.playduck.md.model.vo.Md;
import com.duck.playduck.play.model.vo.Play;

@Service
public class MdServiceImpl implements MdService {

	@Autowired
	MdDAO mdDAO;

	//연극별 MD 리스트
	@Override
	public List<Md> mdPlayList() {
		
		return mdDAO.mdPlayList();
	}

	// Md 한개 정보 가져오기
	@Override
	public Md selectOneMd(int dno) {
		
		return mdDAO.selectOneMd(dno);
	}

	// reward 값 가져오기
	@Override
	public int getReward(int mno) {
		
		return mdDAO.getReward(mno);
	}

	// basket에 담기
	@Override
	public int addBasket(int dno, int mno, int num) {
		
		return mdDAO.addBasket(dno, mno, num);
	}

	// 장바구니 리스트 불러오기
	@Override
	public List<Md> getbasketList(int mno) {
		
		return mdDAO.getbasketList(mno);
	}

	// basket 숫자 업데이트
	@Override
	public int updateBasket(int dno, int mno, int num) {
		
		return mdDAO.updateBasket(dno,mno,num);
	}

	// basket 하나 선택해오기
	@Override
	public Md selectOneBasket(int dno, int mno, int num) {
		
		return mdDAO.selectOneBasket(dno, mno, num);
	}
	

	


}
