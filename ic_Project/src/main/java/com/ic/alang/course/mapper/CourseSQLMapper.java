package com.ic.alang.course.mapper;

import java.util.ArrayList;
import java.util.Map;

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

public interface CourseSQLMapper {
	
	//강의 개설
	public void courseOpen(CourseVo vo);
	//강의 번호로 불러오기
	public CourseVo getCourseByNo(int no);
	//다음 강의 번호
	public int createCoursePK();
	
	
	// 강홍 - 2021-11-11 코드 추가
	
	//강의 개설여부 확인
	public int checkCreateCourse(CourseVo vo);
	
	//개설된 강의 리스트(뭉탱이 강의)
	public ArrayList<CourseVo> mainCourse();
	
	//세부 강의 등록
	public void addLecture(LectureVo vo);
	
	//세부 강의 리스트(매니저 페이지)
	public ArrayList<LectureVo> getLectureListManage(int no);
	
	//세부 강의 리스트(뷰어 페이지)
	public ArrayList<LectureVo> lectureList(Map<String, Object> lectureMap); 
	
	//강의에 맞는 영상 가져오기
	public LectureVo lectureView(int no);
	
	
	//2021-11-15 - 노진호 님
	//강의 번호로 강의자 정보 불러오기
	public MemberVo getMemberByCourseNo(int course_no);

	
	//강의 카테고리 관련
	//강의 카테고리 목록 불러오기
	public ArrayList<SmallCategoryVo> getCategoryList();
	
	//강의 카테고리 설정
	public void registerCategory(CourseCategoryVo vo);
	
	//대분류 가져오기
	public ArrayList<BigCategoryVo> getBigCategoryList();

	
	//공지사항 등록
	public void registNotice(NoticeVo vo);	
	
	//공지사항 번호로 불러오기
	public NoticeVo getNoticeByNo(int no);
	
	//공지사항 목록 불러오기
	public ArrayList<NoticeVo> getNoticeList(int course_no);
	
	//공지사항 pk
	public int createNoticePK();
	
	//공지사항 지우기
	public void deleteNotice(int notice_no);
		
	
	//해당 강좌의 QnA 목록 가져오기
	public ArrayList<QnaVo> getQnaList(int course_no);
	
	//QnA번호로 불러오기
	public QnaVo getQnaByNo(int question_no);
	
	//테스트 질문 작성
	public void writeQuestion(QnaVo vo);
	
	//답변하기
	public void AnswerQuestion(QnaAnswerVo vo);
	
	//질문 번로호 답변 불러오기
	public QnaAnswerVo getAnswerByNo(int question_no);
	
	//맴버 번호로 답변 가져오기
	public ArrayList<QnaAnswerVo> getAnswerByMemberNo(int member_no);
	public ArrayList<QnaAnswerVo> getAnswerByQuestionNo(int question_no);


	//리뷰 작성
	public void writeReview(ReviewVo vo);
	
	//리뷰 리스트 가져오기
	public ArrayList<ReviewVo> getReviewList(int course_no);
	
	//리뷰 1개 가져오기
	public ReviewVo getReviewByNo(int review_no);
	
	//해당 강좌의 가장 최근 리뷰 가져오기
	public ArrayList<ReviewVo> getReviewByLastInsert(int course_no);
	
	
	//공지 사항 이미지 관련(추후 구현)
	public void registerNoticeImage(CourseNoticeImageVo vo);
	public ArrayList<CourseNoticeImageVo> getCourseImageByBoardNo(int nociceNo);
	
	//2021-11-15 장한별 님
	//강의 대분류 불러오기
	public ArrayList<BigCategoryVo> getBigCategory();
	
	//강의 소분류 불러오기
	public ArrayList<SmallCategoryVo> getSmallCategory();
	
	//2021-11-16 - 강홍 추가
	public LectureVo getLectureByNo(Map<String, Object> sendMap);
	
	public void purchaseRecord(MyCourseVo vo);
	
	public ArrayList<MyCourseVo> purchaseList(int no);
	
	//2021-11-24 장한별님
	//신고페이지 작성
	public void writeReport(ReportVo vo);
	
	//2021-11-24 노진호님
	//강사시점 구매자 정보 가져오기
	public ArrayList<MemberVo> getStudentList(int course_no);
	
	//해당 맴버가 자신의 강의를 처음으로 들은 날의 데이터를 가져오기
	public MyCourseVo registerForCourseDate(int member_no);
	
	//2021-11-24 강홍
	//구매목록 
	public int checkPurchase(Map<String, Object> vo);
	
	//2021-11-25 강홍
	//강의 개설자 이름 뽑아오기
	public String getCourseCreatorByNo(int no);
	
	//2021-11-28 노진호님 추가
		
	//해당 맴버가 자신의 강의를 처음으로 들은 날의 데이터를 가져오기
	public ArrayList<MemberVo> getDistinceStudentList(int course_no);
	
	public ArrayList<MyCourseVo> getSellList(int course_no);
	//1125 버전 member_no로 해당 맴버 가입일 가져오기
	public MyCourseVo getStudentRegisterDate(int member_no);
	
	//1125 강의 카테고리 불러오기
	public CourseCategoryNameVo getCourseCategoryName(int course_no);
	
	//2021-11-27 송봉재 추가 
   public CourseVo purchaseByNo(int no);
	   
   //2021-11-28 송봉재 추가 
   public ArrayList<MyCourseVo> purcharseAllList();
   
   //2021-11-29 강홍 추가
   public void subMemberPoint(MyCourseVo vo); 
   
   public void addCart(CartVo vo);
   
   public ArrayList<CartListVo> cartList(int no);
   
   //2021-11-25 장한별 추가 내용
 	//스몰카테고리로 코스 가져오기
 	public ArrayList<CourseVo> getCourseBySmallCategory(int smallcategory_no);
 	//빅 카테고리로 코스 가져오기
 	public ArrayList<CourseVo> getCourseByBigCategory(int bigcategory_no);
 	
 	public BigCategoryVo getBigCategorybyno(int bigcategory_no);
 	public SmallCategoryVo getSmallCategorybyno(int smallcategory_no);
 	public BigCategoryVo getBigCategorybySmallCate(int smallcategory_no);
 	
 	//1130 노진호님
	public float courseRateAvg(int course_no);	
	public void updateCourseVo(CourseVo vo);
	public void updateCourseThumnail(CourseThumnailVo vo);
	public CourseThumnailVo getCourseThumnailByCourseNo(int course_no);	
	
	//강의 매출
	public int courseSales(int course_no);
	//강좌 판매수
	public int salesLectureCount(int course_no);
	//강의 학생 수 
	public int courseStudentNum(int course_no);
	//강좌 판매수 랭킹
	public ArrayList<lectureRankVo> lectureVolumeRank(int course_no);
	//강좌 판매액 랭킹
	public ArrayList<lectureRankVo> lectureSalesRank(int course_no);
	//4주간 수익
	public ArrayList<lectureRankVo> getSalesMonth(int course_no);
	//
	public ArrayList<lectureRankVo> getLectureSaleBank(int course_no);
}
