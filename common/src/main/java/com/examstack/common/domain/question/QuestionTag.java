package com.examstack.common.domain.question;

import java.io.Serializable;
import java.util.Date;
/**
 * 试题与标签对应mapping 数据对象
 * @author LDP
 *
 */
@SuppressWarnings("serial")
public class QuestionTag implements Serializable {

	private int questionTagId;  //试题与标签对应id
	private int questionId;    //试题id
	private int tagId;     //标签id
	private String tagName;  //标签名称
	private int creator;  
	private boolean privatee;
	private Date createtime;
	public int getQuestionTagId() {
		return questionTagId;
	}
	public void setQuestionTagId(int questionTagId) {
		this.questionTagId = questionTagId;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public int getTagId() {
		return tagId;
	}
	public void setTagId(int tagId) {
		this.tagId = tagId;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public boolean isPrivatee() {
		return privatee;
	}
	public void setPrivatee(boolean privatee) {
		this.privatee = privatee;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
}
