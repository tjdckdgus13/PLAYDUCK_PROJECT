package com.duck.playduck.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duck.playduck.mypage.model.dao.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDAO mypageDao;
	
}
