package com.ic.alang.freebord.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ic.alang.freebord.service.FreeBoardServiceImpl;
import com.ic.alang.vo.FreeBoardVo;
import com.ic.alang.vo.FreeImageBoardVo;
import com.ic.alang.vo.FreeReplyBoardVo;
import com.ic.alang.vo.MemberVo;

@Controller
@RequestMapping("/board/*")
public class FreeBoardController {
	
	@Autowired
	private FreeBoardServiceImpl freeBoardService;
	
	@RequestMapping("freeboardPage.do")
	public String freeboardPage(Model model, MemberVo memverVo) {
		
		ArrayList<HashMap<String, Object>> freelist = freeBoardService.getFreeBoardList();
		
		int memberVo = memverVo.getMember_no();
		
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("freelist", freelist);
		
		return "board/freeboardPage";
		
	}
	@RequestMapping("freeWriteContentPage.do")
	public String freeWriteContentPage() {
		
		return "board/freeWriteContentPage";
		
	}
	@RequestMapping("freeWriteContentProcess.do")
	public String freeWriteContentProcess(FreeBoardVo param, MultipartFile [] freefile, HttpSession session) {
		
		String rootUploadFileFolderName = "C:/uploadFiles";
		
		ArrayList<FreeImageBoardVo> freeimageVoList = new ArrayList<FreeImageBoardVo>();
		
		
		//파일 업로드 
		for(MultipartFile file : freefile) {
			
			if(file.isEmpty()) {
				continue;
			}
			
			String originalFileName = file.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			
			UUID uuid = UUID.randomUUID();

			long currentTime = System.currentTimeMillis();
			
			String randomFileName = uuid.toString() + currentTime + ext;
			
			//날짜별 폴더생성 
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); 
			String todayFolderName = sdf.format(today);
						
			File todayFolder = new File(rootUploadFileFolderName + "/" + todayFolderName);
			
			if(!todayFolder.exists()) {
				todayFolder.mkdirs();
			}
			
			String uploadFilePath = rootUploadFileFolderName+"/" 
			+ todayFolderName + "/" +  randomFileName;
			
			try {
			file.transferTo(new File(uploadFilePath));
			}catch(Exception e ) {
				e.printStackTrace();
			}
			
			FreeImageBoardVo freeBoardVo = new FreeImageBoardVo();
			freeBoardVo.setFraa_file_name(originalFileName);
			freeBoardVo.setFree_file_path(todayFolderName + "/" + randomFileName);
			
			freeimageVoList.add(freeBoardVo);
			


	}
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		
		param.setMember_no(member_no);
		
		freeBoardService.freeWriteContent(param, freeimageVoList);
		
		return "redirect:./freeboardPage.do";
				
	}
	@RequestMapping("freeReadContentPage.do")
	public String freeReadContentPage(int free_no, Model model) {
		
		HashMap<String, Object> data = freeBoardService.getFreeBoard(free_no);
		ArrayList<HashMap<String, Object>> replylist = freeBoardService.getFreeReplyListByBoardNo(free_no);
		
		model.addAttribute("data", data);
		
		model.addAttribute("replylist", replylist);
	
		
		return "board/freeReadContentPage";
		
	}
	
	@RequestMapping("freedeleteContentProcess.do")
	public String freedeleteContentProcess(int free_no) {
		
		freeBoardService.deleteContent(free_no);
				
		return "redirect:./freeboardPage.do";
		
	}
	@RequestMapping("freeupdateContentPage.do")
	public String freeupdateContentPage(int free_no, Model model) {
		
		HashMap<String, Object> data = freeBoardService.getFreeBoard(free_no);
		
		model.addAttribute("data", data);
		
		return "board/freeupdateContentPage";
		
	}
	@RequestMapping("freeupdateContentprocess.do")
	public String freeupdateContentprocess(FreeBoardVo vo) {
		
		freeBoardService.updateContent(vo);
		
		return "redirect:./freeboardPage.do";
		
	}

	
	//댓글
	@RequestMapping("freeReplyWriteContentProcess.do")
	public String freeReplyWriteContentProcess(FreeReplyBoardVo param ,HttpSession session, FreeBoardVo freeboardVo) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		
		int free_no = freeboardVo.getFree_no();
		
		
		param.setMember_no(member_no);
		param.setFree_no(free_no);
		
		freeBoardService.freeReplyWriteContent(param);

		return "redirect:./freeReadContentPage.do?free_no="+free_no;
		
	}
	@RequestMapping("deleteReplyProcess.do")
	public String deleteReplyProcess(FreeReplyBoardVo vo, HttpSession session, FreeBoardVo freeboardVo) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		int free_no = freeboardVo.getFree_no();
		
		vo.setMember_no(member_no);
		vo.setFree_no(free_no);
	
		freeBoardService.deleteReply(vo);
		
				
		return "redirect:./freeReadContentPage.do?free_no="+free_no;
	}
	@RequestMapping("updateReplyProcess.do")
	public void updateReplyProcess(FreeReplyBoardVo param) {
		
		freeBoardService.updateReply(param);
	}
	
	public HashMap<String, Object> getreplylist(int replyNo){
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		ArrayList<HashMap<String, Object>> replylist = 
				freeBoardService.getFreeReplyListByBoardNo(replyNo);
		data.put("replylist", replylist);
				
		return data;
		
	}

}
