package com.examstack.common.domain.exam;

import java.util.Date;
/**
 * 考试历史纪录
 * @author LDP
 *
 */
public class ExamHistory {

	private int histId;  //历史纪录id
	private int userId;  //学员id
	private String userName; //学员名称
	private String trueName; //真实姓名
	private Date startTime; //开始时间
	private int examId;  //考试id
	private String examName; //考试名称
	private int examType;  //考试类型
	private boolean enabled;  //是否发布
	private int examPaperId;  //该次考试使用的试卷id
	private float point;   //考生得分
	private String seriNo;  // 准考证号码
	private String content; //
	private Date createTime; //该条记录创建时间
	private String answerSheet;
	private int duration;     //考试用时
	private float pointGet;   //得分
	private Date submitTime;  // 提交分数
	//0 未审核 1 通过 2 未通过
	private int approved;
	private Date verifyTime;  //查验时间
	private float passPoint;  //及格分数
	private String nationalId;
	private String depName;  // 部门名称
	
	public String getNationalId() {
		return nationalId;
	}
	public void setNationalId(String nationalId) {
		this.nationalId = nationalId;
	}
	public String getDepName() {
		return depName;
	}
	public void setDepName(String depName) {
		this.depName = depName;
	}
	public float getPassPoint() {
		return passPoint;
	}
	public void setPassPoint(float passPoint) {
		this.passPoint = passPoint;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public int getExamType() {
		return examType;
	}
	public void setExamType(int examType) {
		this.examType = examType;
	}
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getHistId() {
		return histId;
	}
	public void setHistId(int histId) {
		this.histId = histId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public int getExamPaperId() {
		return examPaperId;
	}
	public void setExamPaperId(int examPaperId) {
		this.examPaperId = examPaperId;
	}
	public float getPoint() {
		return point;
	}
	public void setPoint(float point) {
		this.point = point;
	}
	public String getSeriNo() {
		return seriNo;
	}
	public void setSeriNo(String seriNo) {
		this.seriNo = seriNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getAnswerSheet() {
		return answerSheet;
	}
	public void setAnswerSheet(String answerSheet) {
		this.answerSheet = answerSheet;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public float getPointGet() {
		return pointGet;
	}
	public void setPointGet(float pointGet) {
		this.pointGet = pointGet;
	}
	public Date getSubmitTime() {
		return submitTime;
	}
	public void setSubmitTime(Date submitTime) {
		this.submitTime = submitTime;
	}
	
	public int getApproved() {
		return approved;
	}
	public void setApproved(int approved) {
		this.approved = approved;
	}
	public Date getVerifyTime() {
		return verifyTime;
	}
	public void setVerifyTime(Date verifyTime) {
		this.verifyTime = verifyTime;
	}
	
}
