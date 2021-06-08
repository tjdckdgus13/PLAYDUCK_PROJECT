package com.duck.playduck.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.duck.playduck.curation.model.vo.Curation;
import com.duck.playduck.member.model.vo.Member;
import com.duck.playduck.mypage.model.service.MypageService;
import com.duck.playduck.review.model.vo.Review;




@Controller
public class MypageController {
	
	@Autowired
	MypageService mypageService;
	
	// 마이페이지 불러오기
	@RequestMapping("/mypage/mypage.do")
	public String mypage(Model model) {
		
		return "myPage";
	}
	
	// 프로필 이미지 DB에 INSERT
	@RequestMapping("/board/profileImg.do")
	public String profileImg(Model model, HttpServletRequest req, @RequestParam(value="upFile", required=false) MultipartFile[] upFiles) {
		
		// 1. 파일 저장 경로 및 파일 정보를 담을 객체 생성
			String savePath = req.getServletContext().getRealPath("/resources/profileImg");
			List<Member> attach = new ArrayList<>();
						
		// 2. 파일 업로드
			for(MultipartFile f : upFiles) {
				
				if(f.isEmpty() == false) {
					// 파일이 비어있지 않다면(파일이 존재한다면)
							
				// 3. 파일 이름 변경
					String originName = f.getOriginalFilename(); // 파일 원래 이름
					String changeName = fileNameChanger(originName); // 파일 이름 변경
									
					try {	// 파일이 존재하지 않거나 깨진 파일일 수 있으므로 트라이캐치!
							f.transferTo(new File(savePath + "/" + changeName));
									
					} catch (IllegalStateException | IOException e) {
		
							e.printStackTrace();
					}
									
				// 4. list에 담기
					Member img = (Member)model.getAttribute("member");
					
					img.setM_pic(originName);
					img.setM_picRenamed(changeName);
							
					attach.add(img);
					
				
					
				}
						
			}
		
			// 5. Member DB에 저장
			int result = mypageService.insertPfImg(attach);
			
			return "mypage";
			
	}

	public String fileNameChanger(String oldFileName) {

			String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd = (int)(Math.random() * 1000);

			return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
			
		}


}
