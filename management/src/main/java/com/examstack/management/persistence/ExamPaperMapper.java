package com.examstack.management.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.examstack.common.domain.exam.ExamPaper;
import com.examstack.common.util.Page;

public interface ExamPaperMapper {

	/**
	 * 试卷分页
	 * @param searchStr
	 * @param paperType
	 * @param page
	 * @return
	 */
	public List<ExamPaper> getExamPaperList(@Param("searchStr") String searchStr,@Param("paperType") String paperType, @Param("page") Page<ExamPaper> page);
	
	/**
	 * 新建试卷
	 * @param examPaper
	 */
	public void insertExamPaper(ExamPaper examPaper);
	
	/**
	 * 根据examPaperId获取试卷
	 * @param examPaperId
	 * @return
	 */
	public ExamPaper getExamPaperById(int examPaperId);
	
	/**
	 * 更新修改试卷
	 * @param examPaper
	 */
	public void updateExamPaper(ExamPaper examPaper);
	
	/**
	 * 删除试卷
	 * @param id
	 */
	public void deleteExamPaper(int id);
	
	/**
	 * 根据考生姓名获取考试列表
	 * @param userName
	 * @param page
	 * @return
	 */
	public List<ExamPaper> getEnabledExamPaperList(@Param("userName") String userName,@Param("page") Page<ExamPaper> page);
}
