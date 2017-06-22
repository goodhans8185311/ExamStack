package com.examstack.portal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.examstack.common.domain.exam.ExamPaper;
import com.examstack.portal.persistence.ExamPaperMapper;

@Service("examPaperService")
public class ExamPaperServiceImpl implements ExamPaperService {

	@Autowired
	private ExamPaperMapper examPaperMapper;
	
	@Override
	public ExamPaper getExamPaperById(int examPaperId) {
		return examPaperMapper.getExamPaperById(examPaperId);
	}

}
