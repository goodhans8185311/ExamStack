package com.examstack.common.domain.exam;

import java.util.Date;
import java.util.List;
/**
 * 答题卡对象
 * @author hans
 *
 */
public class AnswerSheet {
	private int examHistroyId;  //考试历史id
	private int examId;     //考试id
	private int examPaperId; //试卷id
	private int duration;  //用时
	private List<AnswerSheetItem> answerSheetItems;  //答题队列
	private float pointMax;
	private float pointRaw ;
	private Date startTime;   //答题日期时间，提交

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public int getExamHistroyId() {
		return examHistroyId;
	}

	public void setExamHistroyId(int examHistroyId) {
		this.examHistroyId = examHistroyId;
	}

	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}

	public int getExamPaperId() {
		return examPaperId;
	}

	public void setExamPaperId(int examPaperId) {
		this.examPaperId = examPaperId;
	}



	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public List<AnswerSheetItem> getAnswerSheetItems() {
		return answerSheetItems;
	}

	public void setAnswerSheetItems(List<AnswerSheetItem> answerSheetItems) {
		this.answerSheetItems = answerSheetItems;
	}

	public float getPointMax() {
		return pointMax;
	}

	public void setPointMax(float pointMax) {
		this.pointMax = pointMax;
	}

	public float getPointRaw() {
		return pointRaw;
	}

	public void setPointRaw(float pointRaw) {
		this.pointRaw = pointRaw;
	}
	
	

}
