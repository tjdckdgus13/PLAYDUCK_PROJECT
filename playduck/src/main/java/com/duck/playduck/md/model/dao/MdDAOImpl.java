package com.duck.playduck.md.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.duck.playduck.md.model.vo.Basket;
import com.duck.playduck.md.model.vo.Md;
import com.duck.playduck.play.model.vo.Play;

@Repository
public class MdDAOImpl implements MdDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	//연극별 MD 리스트
	@Override
	public List<Md> mdPlayList() {
	
		return sqlSession.selectList("md2-mapper.mdPlayList");
	}

	// Md 한개 정보 가져오기
	@Override
	public Md selectOneMd(int dno) {
		
		return sqlSession.selectOne("md2-mapper.selectOneMd", dno);
	}

	// reward 값 가져오기
	@Override
	public int getReward(int mno) {
		
		return sqlSession.selectOne("md2-mapper.getReward",mno);
	}

	// basket에 담기
	@Override
	public int addBasket(int dno, int mno, int num) {
		
		Basket basket = new Basket(mno,dno,num);
		
		System.out.println(num);
		return sqlSession.insert("md2-mapper.addBasket",basket);
	}

	// 장바구니 리스트 불러오기
	@Override
	public List<Md> getbasketList(int mno) {
		
		return sqlSession.selectList("md2-mapper.getbasketList", mno);
	}

	// basket 숫자 업데이트
	@Override
	public int updateBasket(int dno, int mno, int num) {
	
		Basket basket = new Basket(mno,dno,num);
		
		return sqlSession.update("md2-mapper.updateBasket", basket);
	}

	// basket 하나 선택해오기
	@Override
	public Md selectOneBasket(int dno, int mno, int num) {
		
		Basket basket = new Basket(mno,dno,num);
		
		return sqlSession.selectOne("md2-mapper.selectOneBasket", basket);
	}
	



}
