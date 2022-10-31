package com.ic.alang.course.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ic.alang.course.mapper.CourseSQLMapper;
import com.ic.alang.course.service.CourseServiceImpl;
import com.ic.alang.member.service.MemberServiceImpl;
import com.ic.alang.vo.BigCategoryVo;
import com.ic.alang.vo.CourseCategoryNameVo;
import com.ic.alang.vo.CourseNoticeImageVo;
import com.ic.alang.vo.CourseThumnailVo;
import com.ic.alang.vo.CourseVo;
import com.ic.alang.vo.LectureVo;
import com.ic.alang.vo.MemberVo;
import com.ic.alang.vo.MyCourseVo;
import com.ic.alang.vo.NoticeVo;
import com.ic.alang.vo.QnaAnswerVo;
import com.ic.alang.vo.QnaVo;
import com.ic.alang.vo.ReportVo;
import com.ic.alang.vo.ReviewVo;
import com.ic.alang.vo.SmallCategoryVo;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/course/*")
public class CourseController {
	
	@Autowired
	private CourseServiceImpl courseService;
	
	@Autowired
	private CourseSQLMapper courseSQLMapper;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	//강의 개설 페이지로 이동	
	@RequestMapping("courseOpenPage.do")
	public String courseOpenPage(HttpSession session, Model model) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		
		ArrayList<BigCategoryVo> bigcategoryList = courseService.getBigCategory();
				
		
		model.addAttribute("bigcategoryList", JSONArray.fromObject(bigcategoryList));
		
		ArrayList<SmallCategoryVo> smallcategoryList = courseService.getSmallCategory();
		model.addAttribute("smallcategoryList", JSONArray.fromObject(smallcategoryList));
		
		
		
		return "course/courseOpenPage";
	}
	
	
	@RequestMapping("courseOpenProcess.do")
	public String courseOpenProcess(CourseVo param, int smallcategory, HttpSession session) {
		int course_no = courseSQLMapper.createCoursePK();
				
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		param.setMember_no(sessionUser.getMember_no());
				
		courseService.courseOpen(param, smallcategory, course_no);
		return "redirect:./courseManagePage.do?course_no=" + course_no;
	}
	
	//1130변경
	@RequestMapping("courseManagePage.do")
	public String courseManagePage(int course_no, HttpSession session, Model model) {
		
		
		HashMap<String, Object> data= courseService.getCourse(course_no);

		
		CourseThumnailVo thumnail = courseService.getCourseThumnail(course_no);		
		CourseCategoryNameVo categoryName = courseService.getCategoryName(course_no);
		
		System.out.println("categoryName" + categoryName);
				
		model.addAttribute("data", data);
		model.addAttribute("categoryName", categoryName);
		model.addAttribute("thumnail", thumnail);

		
		return "course/courseManagePage";
	}
	
	//강의 올리지 않은 일반 유저 페이지 추가 - 2021-11-11 / 강홍
	@RequestMapping("courseViewerPage.do")
	public String courseViewerPage(int course_no, HttpSession session, Model model, HttpServletRequest request) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		HashMap<String, Object> data= courseService.getCourse(course_no);
								
		MemberVo memberVo = memberService.getMemberByNo(sessionUser.getMember_no());
		
		Map<String, Object> lectureMap = new HashMap<String, Object>();
		lectureMap.put("course_no", course_no);
		lectureMap.put("member_no", memberVo.getMember_no());
		
		//ArrayList<LectureVo> lecture = courseService.getLectureList(lectureMap);
		
		ArrayList<LectureVo> lecture =  courseService.getLectureListManage(course_no);
		
		int pageNum = 1; 
		//마지막 리뷰 불러오기 현제 터지므로 보류
		//HashMap<String, Object> lastReview = courseService.getReviewAyLast(course_no);
		
		//공지사항 리스트 불러오기 (서칭/페이징 영향 없음)
		ArrayList<HashMap<String, Object>> noticeList = courseService.getNoticeList(course_no);
		//후기 리스트 불러오기
		ArrayList<HashMap<String, Object>> reviewList = courseService.getReviewList(course_no, pageNum);
		
		//질문 불러오기
		ArrayList<HashMap<String, Object>> questionList = courseService.getQuestionList(course_no, pageNum);
		
		//강의 개설자 이름 불러오기
		CourseVo tempCourse = (CourseVo) data.get("courseVo");	//위에 course 정보를 불러온 해쉬맵 정보를 tempCourse에 저장 (내부에 있는 키 값이 CourseVo 객체이니 CourseVo 객체생성 후 저장) 
		int creatorNo = tempCourse.getMember_no();				//tempCourse에 있는 회원 번호를 가져와서 creatorNo에 저장
		
		String creatorName = "노진호"; 
				//courseService.getCourseCreatorByNo(creatorNo);		//회원번호 값으로 멤버테이블에 있는 이름 가져와서 변수에 저장
		
		model.addAttribute("data", data);
		model.addAttribute("lecture", lecture);
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("creatorName", creatorName);
		
		//현재 멤버정보 받아서 저장
		model.addAttribute("noticeList" , noticeList);
		model.addAttribute("review", reviewList);
		model.addAttribute("question", questionList);
		
		 String errorTypeCheck = null;
		 if(request.getParameter("errorType") == null) {
			 errorTypeCheck = "";
		 }else {
			 errorTypeCheck = request.getParameter("errorType");
		 }
		
		/*
		 * String errorTypeCheck = request.getParameter("errorType")==null ? "" :
		 * request.getParameter("errorType");
		 */
		 
		 model.addAttribute("errorTypeCheck",errorTypeCheck);
		
		
		return "course/courseViewerPage";
	}
	
	@RequestMapping("direction.do")
	public String direction(int course_no, HttpSession session, Model model) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		//Map<String, Object> map = new HashMap<String, Object>();
		
		int mem_no = sessionUser.getMember_no();
		
		//map.put("member_no", mem_no);
		//map.put("course_no", course_no);
		
		int check = courseService.checkCreateCourse(mem_no, course_no);
		//int check = courseService.checkCreateCourse(map);
		
		if(check != 0) {
			return "redirect:./courseManagePage.do?course_no=" + course_no;
		}else {
			return "redirect:./courseViewerPage.do?course_no=" + course_no;
		}
	}
		
	//강홍 2021-11-12 추가
	@RequestMapping("addLecturePage.do")
	public String addLectureProcess(int course_no, Model model) {
		
		HashMap<String, Object> data= courseService.getCourse(course_no);
		model.addAttribute("data", data);
		
		return "/course/CourseAddLecturePage";
	}
	
	//강의 추가
	@RequestMapping("addLectureProcess.do")
	public String addLectureProcess(LectureVo param , MultipartFile file) {
				
		String rootUploadVideoFolderName = "C:/uploadFiles";
					
		String OriginalFileName = file.getOriginalFilename();
		String ext = OriginalFileName.substring(OriginalFileName.lastIndexOf("."));
		
		UUID uuid = UUID.randomUUID();
		
		long currentTime = System.currentTimeMillis();
		
		String randomFileName = uuid.toString() + "_" + currentTime + ext;
		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String todayFolderName = sdf.format(today);
		
		String alang = "alang";
		
		File todayFolder = new File(rootUploadVideoFolderName + "/" + todayFolderName + "/" + alang);
		
		if(!todayFolder.exists()) {
			todayFolder.mkdirs();
		}
		
		String uploadFilePath = rootUploadVideoFolderName + "/" + todayFolderName + "/" + alang + "/" + randomFileName;
		
		try {
			file.transferTo(new File(uploadFilePath));
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		param.setCourse_file(OriginalFileName);
		param.setCourse_link(todayFolderName + "/alang/" + randomFileName);
						
		courseService.addLecture(param);				
		
		return "redirect:./courseManagePage.do?course_no=" + param.getCourse_no();
	}
	
	//강의 정보 하나씩 가져오기
	@RequestMapping("lectureView.do")
	public String lectureView(int lecture_no , Model model) {
		
		LectureVo lectureVo = courseService.getLectureView(lecture_no);
		
		model.addAttribute("lectureVo", lectureVo);
				
		return "/course/lectureView";
	}
	
	// 2021-11-15 - 노진호 님
	@RequestMapping("courseNoticeWritePage.do")
	public String courseNoticeWritePage(int course_no , Model model) {
		return "course/courseNoticeWritePage";
	}
	
	@RequestMapping("courseNoticeWriteProcess.do")
	public String courseNoticeWriteProcess(NoticeVo notice,MultipartFile [] files , HttpSession session) {
		
		int course_no = notice.getCourse_no();		
		
		String rootUploadFileFolder = "C:/UploadTest";
		ArrayList<CourseNoticeImageVo> imageVoList = new ArrayList<CourseNoticeImageVo>();
		
		for(MultipartFile file : files) {
			if(file.isEmpty()) {
				continue;
			}
			
			String filename = file.getOriginalFilename();
			String ext = filename.substring(filename.lastIndexOf("."));
			
			UUID uuid = UUID.randomUUID();
			long currentTime = System.currentTimeMillis();
			
			String randomFileName = uuid.toString() + "_" + currentTime + ext; 
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String todayFolderName = sdf.format(today);
			File todayFolder = new File(rootUploadFileFolder + "/" + todayFolderName);
			
			if(!todayFolder.exists()) {
				todayFolder.mkdirs();
			}
			
			String uploadFilePath = 
					rootUploadFileFolder + "/" + todayFolderName + "/" + randomFileName;

			try {
				file.transferTo(new File(uploadFilePath));
			}catch(Exception e) {			
				e.printStackTrace();
			}
			
			CourseNoticeImageVo imageVo = new CourseNoticeImageVo();
			imageVo.setImage_filename(filename);
			imageVo.setImage_link(todayFolderName + "/" + randomFileName);
			
			imageVoList.add(imageVo);
		}
		
		notice.setCourse_no(course_no);
		
		courseService.writeNotice(notice, imageVoList);
		
		return "redirect:./courseManagePage.do?course_no=" + course_no;
	}
	
	@RequestMapping("readNoticePage.do")
	public String readNoticePage(int notice_no, Model model, HttpSession session) {
		
		HashMap<String, Object> data = courseService.getNocite(notice_no, true);
		model.addAttribute("data", data);

		
		return "course/readNoticePage";
	}
	
	//답변 관련
	@RequestMapping("questionWritePage.do")
	public String questionWritePage(int course_no , Model model) {		
		return "course/questionWritePage";
	}
	
	//2021-11-28 강홍 수정
	@RequestMapping("questionWriteProcess.do")
	public String questionWriteProcess(QnaVo question, HttpSession session) {
		int course_no  = question.getCourse_no();
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		
		question.setMember_no(member_no);
		
		courseService.writeQuestion(question);
		
		int checkCreate = courseService.checkCreateCourse(member_no, course_no);
		
		if(checkCreate != 0) {
			return "redirect:./courseManagePage.do?course_no=" + course_no;
		}else {
			return "redirect:./courseViewerPage.do?course_no=" + course_no;
		}
	}		
	
	@RequestMapping("readQuestionPage.do")
	public String readQuestionPage(int question_no, Model model, HttpSession session){		
		
		HashMap<String, Object> question = courseService.getQuestion(question_no, true);
		model.addAttribute("data", question);
		
		return "course/readQuestionPage";
	}
	
	@RequestMapping("writeAnswer.do")
	public String writeAnswer(QnaAnswerVo param, HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		
		int question_no = param.getQuestion_no();
		param.setQuestion_no(question_no);
		param.setMember_no(member_no);
		
		courseService.writeAnswer(param);
		
		return "redirect:./readQuestionPage.do?question_no=" + question_no;
	}
	
	//2021-11-16 - 강홍
	
	//구매 성공 - 세션유저의 구매목록 model로 넘기기
	@RequestMapping("purchaseSuccess.do")
	public String purchaseSuccess(HttpSession session, int lecture_no, int course_no, Model model) {
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		
		//구매 성공 시, 구매 목록 테이블에 insert 진행
		MyCourseVo myCourseVo = new MyCourseVo();
		myCourseVo.setLecture_no(lecture_no);
		myCourseVo.setMember_no(member_no);
		
		courseService.addPurchaseRecord(myCourseVo);
		courseService.subMemberPoint(myCourseVo);
		
		ArrayList<MyCourseVo> purchaseList = courseService.getPurchaseList(member_no);
		model.addAttribute("purchaseList", purchaseList);
				
		return "redirect:./courseViewerPage.do?course_no=" + course_no;
	}
	
	@RequestMapping("reportContentProcess.do")
	public String reportContentProcess(HttpSession session, int course_no, Model model) {
		MemberVo sessionUser =  (MemberVo) session.getAttribute("sessionUser");
		HashMap<String, Object> data = courseService.getCourse(course_no);
		model.addAttribute("data",data);
		
				
		return "course/reportPage";
	}
	
	@RequestMapping("completereportProcess.do")
	public String completereportProcess(ReportVo vo, int course_no, HttpSession session) {
	MemberVo sessionUser =  (MemberVo) session.getAttribute("sessionUser");
	
	courseService.writeReport(vo);
		return "course/completereport";
	}
	
	//2021-11-24 노진호님 추가
	@RequestMapping("reviewWritePage.do")
	public String reviewWritePage(int course_no ) {
		return "course/reviewWritePage";
	}
	
	@RequestMapping("reviewWriteProcess.do")
	public String reviewWriteProcess(ReviewVo param, int course_no, HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();

		param.setMember_no(member_no);

		courseService.writeReview(param);
		
		return "redirect:./courseManagePage.do?course_no=" + course_no;
	}
	
	//2021-11-25 강홍 추가
	@RequestMapping("purchaseDirection.do")
	public String purchaseDirection(int lecture_no, int course_no, HttpSession session, Model model) {
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		int errorType = 0;
		Map<String, Object> checkMap = new HashMap<String, Object>();
		
		checkMap.put("lecture_no", lecture_no);
		checkMap.put("member_no", member_no);
				
		int result = courseService.checkPurchase(checkMap);
		
		if(result == 0) {
			errorType = 1;
			
			return "redirect:./courseViewerPage.do?course_no=" + course_no + "&errorType=" + errorType;
		}else {
			return "redirect:./lectureView.do?lecture_no=" + lecture_no;
		}
	}
	
	 //2021- 11- 28 송봉재 추가
   @RequestMapping("purchaseList.do")
   public String purchaseList(Model model) {
      ArrayList<HashMap<String, Object>> purcharseList=courseService.purcharseAllList();
         
      model.addAttribute("purcharseList",purcharseList);
      
      
      return "course/purchaseList";
   }
   
   //2021-11-27 노진호님
 	
 	
 	@RequestMapping("updateCoursePage.do")
 	public String updateCoursePage(CourseVo vo, MultipartFile [] files) {		
 		int course_no = vo.getCourse_no();
 		ArrayList<CourseThumnailVo> thumnailList = new ArrayList<CourseThumnailVo>(); 

 		
 		String rootUploadFileFolderName = "C:/uploadFiles";
 		
 		for(MultipartFile file : files) {
 			
 			if(file.isEmpty()) {
 				continue;
 			}			
 			String originalFileName = file.getOriginalFilename();
 			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
 						
 			//파일명 변환...목표 : 파일명 충돌 방지 , 방법 : 랜덤 + 시간
 			UUID uuid = UUID.randomUUID();
 			//System.out.println("생성된 uuid : " + uuid.toString());
 			long currentTime = System.currentTimeMillis();
 			
 			String randomFileName = uuid.toString() + "_" + currentTime + ext; 
 			
 			//날짜 폴더 생성...
 			Date today = new Date(); //오늘 날짜 생성 
 			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); //날짜 -> 문자 변환 객체 생성
 			String todayFolderName = sdf.format(today);
 			
 			//예 ) C:/uploadFiles/2021/10/26
 			File todayFolder = new File(rootUploadFileFolderName + "/" + todayFolderName);
 			
 			if(!todayFolder.exists()) {
 				todayFolder.mkdirs();
 			}
 			
 			String uploadFilePath = 
 					rootUploadFileFolderName + "/" + todayFolderName + "/" + randomFileName;
 			
 			try {
 				file.transferTo(new File(uploadFilePath));
 			}catch(Exception e) {
 				//실무에서는 여기가 제일 어렵고 중요함...
 				e.printStackTrace();
 			}
 			
 			//DB 입력 데이터 구성...
 			CourseThumnailVo thumnailVo = new CourseThumnailVo();
 			
 			thumnailVo.setThumnail_File(originalFileName);
 			thumnailVo.setFilelink(todayFolderName + "/" + randomFileName);
 			thumnailList.add(thumnailVo);

 		}
 		
 		courseService.updateCourse(vo, thumnailList);

 		
 		return "redirect:./courseManagePage.do?course_no=" + course_no;
 	}
	
}
