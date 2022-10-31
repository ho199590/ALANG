package com.ic.alang.course.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ic.alang.course.mapper.CourseSQLMapper;
import com.ic.alang.member.mapper.MemberSQLMapper;
import com.ic.alang.vo.BigCategoryVo;
import com.ic.alang.vo.CartListVo;
import com.ic.alang.vo.CartVo;
import com.ic.alang.vo.CourseCategoryNameVo;
import com.ic.alang.vo.CourseCategoryVo;
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
import com.ic.alang.vo.lectureRankVo;

@Service
public class CourseServiceImpl {
	
	@Autowired
	private CourseSQLMapper courseSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	public void courseOpen(CourseVo vo, int category_no, int course_no) {
		courseSQLMapper.courseOpen(vo);
		if(category_no != 0) {
			CourseCategoryVo category = new CourseCategoryVo();
			category.setCourse_no(course_no);
			category.setSmall_category_no(category_no);
			

			courseSQLMapper.registerCategory(category);
		}
	}
	
	public HashMap<String, Object> getCourse(int course_no) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("실행 : " + course_no);
		CourseVo courseVo = courseSQLMapper.getCourseByNo(course_no);	
		
		map.put("courseVo", courseVo);
		
		
		return map;
	}
	
	// 강홍 - 2021-11-11 코드 추가
	
	//강의 개설 여부 체크 - map 실험용
//	public int checkCreateCourse(Map<String, Object> map) {
//		
//		/* System.out.println("member_no : " + member_no); */
//		
//		CourseVo cosVo = new CourseVo();
//		
//		cosVo.setCourse_no((int) map.get("course_no"));
//		cosVo.setMember_no((int) map.get("member_no"));
//		
//		int checkedNo = courseSQLMapper.checkCreateCourse(cosVo);
//		
//		System.out.println("쿼리 돌아간 값 : " + checkedNo);
//		
//		return checkedNo;
//	}
	
	//강의 개설 여부 체크 - 실제 사용
	public int checkCreateCourse(int member_no, int course_no) {
		
		CourseVo cosVo = new CourseVo();
		
		cosVo.setCourse_no(course_no);
		cosVo.setMember_no(member_no);
		
		Map<String, Object> checkMap = new HashMap<String, Object>();
		
		checkMap.put("cosVo", cosVo);
		
		int checkedNo = courseSQLMapper.checkCreateCourse(cosVo);
		
		return checkedNo;
	}
	
	//메인강의(뭉탱이) 리스트
	public ArrayList<HashMap<String, Object>> getMainCourse(){
		ArrayList<HashMap<String, Object>> courseList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<CourseVo> list = courseSQLMapper.mainCourse();
		
		for(CourseVo courseVo : list) {
			int member_no = courseVo.getMember_no();
			
			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("courseVo", courseVo);
			
			courseList.add(map);
		}
		
		return courseList;
	}
		
	public void addLecture(LectureVo vo) {
		courseSQLMapper.addLecture(vo);
	}
	
	public ArrayList<LectureVo> getLectureList(Map<String, Object> lectureMap){
		
		ArrayList<LectureVo> list = courseSQLMapper.lectureList(lectureMap);
						
		return list;
	}
	
	public ArrayList<LectureVo> getLectureListManage(int course_no){
		
		ArrayList<LectureVo> list = courseSQLMapper.getLectureListManage(course_no);
		
		return list;
	}
	
	public LectureVo getLectureView(int lecture_no) {
		
		LectureVo lectureVo = new LectureVo();
		
		lectureVo = courseSQLMapper.lectureView(lecture_no);
		
		return lectureVo;
	}
	
	//2021-11-15 - 노진호 님
	
	//분류 관련
	public ArrayList<SmallCategoryVo> getCategoryList(){
		
		ArrayList<SmallCategoryVo> test = courseSQLMapper.getCategoryList();		
		
		return courseSQLMapper.getCategoryList();
	}
	
	
	//공지쓰기	
	public void writeNotice(NoticeVo vo, ArrayList<CourseNoticeImageVo> imageVolist) {
		int notice_no = courseSQLMapper.createNoticePK();
		vo.setNotice_no(notice_no);
		courseSQLMapper.registNotice(vo);
		
		for(CourseNoticeImageVo image : imageVolist) {
			image.setNotice_no(notice_no);
			courseSQLMapper.registerNoticeImage(image);
		}
	}
	
	
	//공지 리스트 가져오기~
	public ArrayList<HashMap<String, Object>> getNoticeList(int course_no){
	ArrayList<HashMap<String, Object>> list = 
			new ArrayList<HashMap<String,Object>>();
	
	ArrayList<NoticeVo> noticeList = courseSQLMapper.getNoticeList(course_no);
	
	for(NoticeVo notice : noticeList) {
		MemberVo memberVo = courseSQLMapper.getMemberByCourseNo(course_no);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberVo", memberVo);
		map.put("noticeVo", notice);			
		
		list.add(map);
	}
	
		return list;
	
	}
	
	//공지 보기
	public HashMap<String, Object> getNocite(int notice_no, boolean escape){
		
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	NoticeVo noticeVo = courseSQLMapper.getNoticeByNo(notice_no);
	MemberVo memberVo = courseSQLMapper.getMemberByCourseNo(noticeVo.getCourse_no());
	CourseVo courseVo = courseSQLMapper.getCourseByNo(noticeVo.getCourse_no());

	if(escape) {
		String str = StringEscapeUtils.escapeHtml4(noticeVo.getNotice_content());
		str = str.replaceAll("\n", "<br>");
		noticeVo.setNotice_content(str);
	}
	ArrayList<CourseNoticeImageVo> imageList = courseSQLMapper.getCourseImageByBoardNo(notice_no);
	map.put("courseVo", courseVo);
	map.put("noticeVo", noticeVo);
	map.put("memberVo", memberVo);
	map.put("imageVoList",imageList);

	return map;
}
	
	//후기 리스트 가져오기
	public ArrayList<HashMap<String , Object>> getReviewList(int course_no, int pageNum){
		ArrayList<HashMap<String, Object>> list = 
				new ArrayList<HashMap<String,Object>>();
					
		ArrayList<ReviewVo> reviewList = courseSQLMapper.getReviewList(course_no);		

		for(ReviewVo review : reviewList) {
			//1208 추가수정
			int member_no = review.getMember_no();
			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
			//1208 추가수정
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("reviewVo", review);			
			
			list.add(map);
		}
		
		return list;
	}
	
	//후기 보기
	public HashMap<String, Object> getReview(int review_no, boolean escape){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ReviewVo reviewVo = courseSQLMapper.getReviewByNo(review_no);		
		MemberVo memberVo = courseSQLMapper.getMemberByCourseNo(reviewVo.getCourse_no());
		CourseVo courseVo = courseSQLMapper.getCourseByNo(reviewVo.getCourse_no());
		
		if(escape) {
			String str = StringEscapeUtils.escapeHtml4(reviewVo.getReview_content());
			str = str.replaceAll("\n", "<br>");
			reviewVo.setReview_content(str);
		}

		map.put("courseVo", courseVo);
		map.put("noticeVo", reviewVo);
		map.put("memberVo", memberVo);

		
		return map;
	}
	//마지막 후기
	public ArrayList<HashMap<String, Object>> getReviewAtLast(int course_no){
		
		ArrayList<HashMap<String, Object>> list = 
				new ArrayList<HashMap<String,Object>>();
		
		ArrayList<ReviewVo> reviewList = courseSQLMapper.getReviewByLastInsert(course_no);		
		
		for(ReviewVo review : reviewList) {
			MemberVo memberVo = courseSQLMapper.getMemberByCourseNo(course_no);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("reviewVo", review);		
			
			list.add(map);
		}
		
		return list;		
	}
	
	//질문목록 가져오기~
	public ArrayList<HashMap<String , Object>> getQuestionList(int course_no, int pageNum){
		ArrayList<HashMap<String, Object>> list = 
				new ArrayList<HashMap<String,Object>>();
		ArrayList<QnaVo> questionList = courseSQLMapper.getQnaList(course_no);
		
		for(QnaVo question : questionList) {				
			MemberVo memberVo = memberSQLMapper.getMemberByNo(question.getMember_no());
									//courseSQLMapper.getMemberByCourseNo(question.getMember_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
						
			map.put("memberVo", memberVo);
			map.put("questionVo", question);			
			list.add(map);
			
			
		}
		return list;			
	}
	
	
	public ArrayList<HashMap<String , Object>> getTeacherAnswerList(int course_no, int pageNum){
		ArrayList<HashMap<String, Object>> list = 
				new ArrayList<HashMap<String,Object>>();
		
		MemberVo memberVo = courseSQLMapper.getMemberByCourseNo(course_no);
		int member_no = memberVo.getMember_no();
		System.out.println("member_no" + member_no);
		
		ArrayList<QnaAnswerVo> answerList = courseSQLMapper.getAnswerByMemberNo(member_no);
		//답변자가 한 답변 전부를 가져옴
		
		for(QnaAnswerVo teacherAnswer : answerList) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("memberVo", memberVo);
			map.put("answerVo", teacherAnswer);			
			list.add(map);
		}		
		
		return list;			

	}
	
	public ArrayList<HashMap<String , Object>> getAnswerList(int question_no){
		
		ArrayList<HashMap<String, Object>> list = 
				new ArrayList<HashMap<String,Object>>();
		
		ArrayList<QnaAnswerVo> answerList = courseSQLMapper.getAnswerByQuestionNo(question_no);
		
		for(QnaAnswerVo answer : answerList) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			int member_no = answer.getMember_no();
			
			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
			
			map.put("memberVo", memberVo);
			map.put("answerVo", answer);			
			list.add(map);
		}		
		
		return list;			

		
	}
	
	
	//질문 읽기 페이지 가져오기용
	public HashMap<String, Object> getQuestion(int question_no, boolean escape){
	HashMap<String, Object> map = new HashMap<String, Object>();

	//질문 등록하고
	QnaVo question = courseSQLMapper.getQnaByNo(question_no);
	//누가 물었나 등록하고
	MemberVo memberVo = memberSQLMapper.getMemberByNo(question.getMember_no());
	//어디에 물었나 등록한다.
	CourseVo courseVo = courseSQLMapper.getCourseByNo(question.getCourse_no());
	//누가 답변할꺼니?
	MemberVo teacher = memberSQLMapper.getMemberByNo(courseVo.getMember_no());
	System.out.println("teacher : " + teacher.getMember_name());
	//답변도 가져오자
	
	if(escape) {
		String str = StringEscapeUtils.escapeHtml4(question.getQuestion_content());
		str = str.replaceAll("\n", "<br>");
		question.setQuestion_content(str);
	}
	
	map.put("courseVo", courseVo);
	map.put("questionVo", question);
	map.put("memberVo", memberVo);
	map.put("teacherVo", teacher);

	return map;
	}

		
	//답변하기 
	public void writeAnswer(QnaAnswerVo vo) {
		courseSQLMapper.AnswerQuestion(vo);
	}
	
	//테스트용 답변 작성
	public void writeQuestion(QnaVo vo) {
		courseSQLMapper.writeQuestion(vo);
	}
	
	//2021-11-15 - 장한별 님
	public ArrayList<BigCategoryVo> getBigCategory(){
		
		return courseSQLMapper.getBigCategory();
	}
	
	public ArrayList<SmallCategoryVo> getSmallCategory(){
		
		return courseSQLMapper.getSmallCategory();
	}
	
	//2021-11-16 - 강홍 추가
	
	public LectureVo getLectureByNo(Map<String, Object> sendMap) {
		LectureVo lectureVo = courseSQLMapper.getLectureByNo(sendMap);
		
		return lectureVo;
		
	}
	
	public void addPurchaseRecord(MyCourseVo param) {
		
		courseSQLMapper.purchaseRecord(param);
		
	}
	
	public ArrayList<MyCourseVo> getPurchaseList(int member_no) {
		
		ArrayList<MyCourseVo> purchaseList = courseSQLMapper.purchaseList(member_no);
		
		return purchaseList;
		
	}
	
	//테스트 리뷰 작성하기
	public void writeReview(ReviewVo vo) {
		courseSQLMapper.writeReview(vo);
	}
	
	//강좌의 학생들 확인하기
	public ArrayList<HashMap<String, Object>> getStudent(int course_no){
					
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<MemberVo> studentList = courseSQLMapper.getStudentList(course_no);
		
		for(MemberVo studentVo : studentList) {
			int member_no = studentVo.getMember_no();
			MyCourseVo registVo = courseSQLMapper.registerForCourseDate(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("studentVo", studentVo);
			map.put("registVo", registVo);
			
			list.add(map);
		}
		
		return list;
	}
		
	//2021-11-24 장한별님
	public void writeReport(ReportVo vo) {
		courseSQLMapper.writeReport(vo);
	}
	
	//2021-11-24 강홍
	public int checkPurchase(Map<String, Object> param) {
		
		int checkResult = courseSQLMapper.checkPurchase(param);
		
		return checkResult;
	}
	
	public String getCourseCreatorByNo(int member_no) {
		String creatorName = courseSQLMapper.getCourseCreatorByNo(member_no);
		
		return creatorName;
	}
	
	//2021-11-28 노진호님 추가
	
	//강좌 판매 확인하기   ////1125
	public ArrayList<HashMap<String, Object>> getStudentJoin(int course_no){
					
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<MyCourseVo> sellCourseList = courseSQLMapper.getSellList(course_no);
		for(MyCourseVo sellList : sellCourseList) {
			int member_no = sellList.getMember_no();
			HashMap<String, Object> map = new HashMap<String, Object>();
			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
			map.put("registVo", sellList);
			map.put("studentVo", memberVo);
			
			list.add(map);
		}
		
		return list;
	}
	
	//강좌의 학생 확인하기 ////1125	
	public ArrayList<HashMap<String, Object>> getStudentList(int course_no){
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<MemberVo> sutdentList = courseSQLMapper.getDistinceStudentList(course_no);
		for(MemberVo student : sutdentList) {
			int member_no = student.getMember_no();
			HashMap<String, Object> map = new HashMap<String, Object>();
			MyCourseVo registVo = courseSQLMapper.getStudentRegisterDate(member_no);
			System.out.println("member_no" + member_no);
			System.out.println("registVo" + registVo);
			
			map.put("studentVo", student);
			map.put("registVo", registVo);
			
			list.add(map);
		}
		
		return list;
	}
	
	//11월 28일 송봉재 추가 
   //구매목록 리스트
   public ArrayList<HashMap<String, Object>> purcharseAllList(){
      ArrayList<HashMap<String, Object>> purcharseall = new ArrayList<HashMap<String,Object>>();
      
      ArrayList<MyCourseVo> purcharseallList = courseSQLMapper.purcharseAllList();
      
      for(MyCourseVo myCourseVo : purcharseallList) {
         int member_no = myCourseVo.getMember_no();
         //int lecture_no = myCourseVo.getLecture_no();
         
         MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
         //LectureVo lectureVo = courseSQLMapper.getLectureByNo(lecture_no);
         
         HashMap<String, Object> courseMap = new HashMap<String, Object>();
         courseMap.put("myCourseVo",myCourseVo);
         courseMap.put("memberVo", memberVo);
         //courseMap.put("lectureVo", lectureVo);
         
         purcharseall.add(courseMap);
      }
      
      return purcharseall;
   }
   
   //2021-11-29 강홍 추가
   public void subMemberPoint(MyCourseVo param) {
	   courseSQLMapper.subMemberPoint(param);
   }
   
   public void addCart(CartVo param) {
	   courseSQLMapper.addCart(param);
	   
   }
   
   public ArrayList<CartListVo> cartList(int member_no){
	   
	   ArrayList<CartListVo> cartList = new ArrayList<CartListVo>();
	   
	   cartList = courseSQLMapper.cartList(member_no);
	   
	   return cartList;
   }
   
   //2021-11-25 장한별
	
 	public ArrayList<HashMap<String, Object>> getCourseListBySmallCategory(int smallcategory_no){
 		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
 		
 		ArrayList<CourseVo> getCourseBySmallCategory = courseSQLMapper.getCourseBySmallCategory(smallcategory_no);
 		
 		for(CourseVo courseVo :  getCourseBySmallCategory) {
 		
 			int member_no = courseVo.getMember_no();
 			
 			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
 			
 			HashMap<String, Object> map = new HashMap<String, Object>();
 			map.put("memberVo", memberVo);
 			map.put("courseVo", courseVo);
 			
 			list.add(map);
 		}
 		
 		return list;
 	}
 	
 	public ArrayList<HashMap<String, Object>> getCourseListByBigCategory(int bigcategory_no){
 		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
 		
 		ArrayList<CourseVo> getCourseByBigCategory = courseSQLMapper.getCourseByBigCategory(bigcategory_no);
 		
 		for(CourseVo courseVo :  getCourseByBigCategory) {
 			
 			int member_no = courseVo.getMember_no();
 			
 			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
 			
 			HashMap<String, Object> map = new HashMap<String, Object>();
 			map.put("memberVo", memberVo);
 			map.put("courseVo", courseVo);
 			
 			list.add(map);
 		}
 		
 		return list;
 	}
 	
 	//2021-12-01 노진호님
 	//211126
	public CourseCategoryNameVo getCategoryName(int course_no) {
		CourseCategoryNameVo vo = courseSQLMapper.getCourseCategoryName(course_no);
		return vo;
	}
	
	public void deleteNotice(int notice_no) {
		courseSQLMapper.deleteNotice(notice_no);
	}
	
	public float getCourseAvg(int course_no){
		
		float avg = courseSQLMapper.courseRateAvg(course_no);
		
		return avg;
	}
	
	public void updateCourse(CourseVo vo, ArrayList<CourseThumnailVo> thumnailList) {
		int course_no = vo.getCourse_no();


		courseSQLMapper.updateCourseVo(vo);		
		for(CourseThumnailVo thumnailVo : thumnailList) {
			thumnailVo.setCourse_no(course_no);	
			courseSQLMapper.updateCourseThumnail(thumnailVo);
		}

		
	}
	
	public CourseThumnailVo getCourseThumnail(int course_no) {		
		CourseThumnailVo thum = courseSQLMapper.getCourseThumnailByCourseNo(course_no);
		return thum;
	}
	
	
	public HashMap<String, Object> getCourseStatistics(int course_no){
		HashMap<String, Object> data = new HashMap<String, Object>();

		int courseSales = courseSQLMapper.courseSales(course_no);
		int	lectureSalesCount =  courseSQLMapper.salesLectureCount(course_no);
		int courseStudentNum = courseSQLMapper.courseStudentNum(course_no);
		ArrayList<lectureRankVo> lectureSalesRank = courseSQLMapper.lectureSalesRank(course_no);
		ArrayList<lectureRankVo> lectureVolumeRank = courseSQLMapper.lectureVolumeRank(course_no);
		ArrayList<lectureRankVo> getSalesMonth = courseSQLMapper.getSalesMonth(course_no);
		ArrayList<lectureRankVo> getLectureSaleBank = courseSQLMapper.getLectureSaleBank(course_no);
		
		
		data.put("courseSales", courseSales);
		data.put("lectureSalesCount", lectureSalesCount);
		data.put("courseStudentNum", courseStudentNum);
		data.put("lectureVolumeRank", lectureVolumeRank);
		data.put("lectureSalesRank", lectureSalesRank);
		data.put("getSalesMonth", getSalesMonth);
		data.put("getLectureSaleBank", getLectureSaleBank);

		return data;
	}
		
}
