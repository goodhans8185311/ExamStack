package com.examstack.common.domain.exam;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Exam implements Serializable {

	private static final long serialVersionUID = -1595051130848974880L;
	private int examId;         //考试id
	private String examName;    //考试名称
	private String examSubscribe; //考试订阅者
	private int examType;      //考试类型
	private Date createTime;  //创建时间
	private Date effTime;     //有效时间开始
	private Date expTime;     //结束时间
	private int examPaperId;  //考试所用试卷id
	private String examPaperName; //考试所用试卷名称
	private List<Integer> groupIdList; 
	private int creator;
	private String creatorId;
	//准考证号
	private String seriNo;
	//0 未审核, 1 审核通过, 2 审核不通过
	private int approved;
	
	
	public String getSeriNo() {
		return seriNo;
	}
	public void setSeriNo(String seriNo) {
		this.seriNo = seriNo;
	}
	public int getApproved() {
		return approved;
	}
	public void setApproved(int approved) {
		this.approved = approved;
	}
	public String getCreatorId() {
		return creatorId;
	}
	public void setCreatorId(String creatorId) {
		this.creatorId = creatorId;
	}
	public String getExamPaperName() {
		return examPaperName;
	}
	public void setExamPaperName(String examPaperName) {
		this.examPaperName = examPaperName;
	}
	public int getExamType() {
		return examType;
	}
	public void setExamType(int examType) {
		this.examType = examType;
	}
	public String getExamSubscribe() {
		return examSubscribe;
	}
	public void setExamSubscribe(String examSubscribe) {
		this.examSubscribe = examSubscribe;
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getEffTime() {
		return effTime;
	}
	public void setEffTime(Date effTime) {
		this.effTime = effTime;
	}
	public Date getExpTime() {
		return expTime;
	}
	public void setExpTime(Date expTime) {
		this.expTime = expTime;
	}
	public int getExamPaperId() {
		return examPaperId;
	}
	public void setExamPaperId(int examPaperId) {
		this.examPaperId = examPaperId;
	}
	public List<Integer> getGroupIdList() {
		return groupIdList;
	}
	public void setGroupIdList(List<Integer> groupIdList) {
		this.groupIdList = groupIdList;
	}
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	
}
