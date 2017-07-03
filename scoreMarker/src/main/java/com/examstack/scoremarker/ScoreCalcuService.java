package com.examstack.scoremarker;

import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.examstack.common.domain.exam.AnswerSheet;
import com.examstack.common.domain.exam.AnswerSheetItem;
import com.examstack.common.domain.exam.ExamPaper;
import com.google.gson.Gson;
/**
 * 学员考试分数计算服务
 * @author hans
 *
 */
@Service
@Scope("prototype")
public class ScoreCalcuService {

	@Autowired
	RestTemplate restTemplate;

	@Autowired
	@Qualifier("answerSheetPostUri")
	private String answerSheetPostUri;

	@Autowired
	@Qualifier("examPaperGetUri")
	private String examPaperGetUri;

	@Autowired
	HashMap<String, ExamPaper> Examapapers;

	private static final Logger LOGGER = Logger.getLogger(ScoreCalcuService.class);

	/**
	 * 
	 * @param as
	 */
	public void calcuScore(AnswerSheet as) {
		System.out.println("########################################   AnswerSheet is calculating... " + as +"  #######################################################" );
        // TODO 远程获取该试卷对象
		ExamPaper examPaper = Examapapers.get(as.getExamPaperId());

		// TODO 计算得分 结果等数据..
		if (examPaper == null) {
			examPaper = this.getExamPaper(as.getExamPaperId());
			Examapapers.put(examPaper.getId() + "", examPaper);
		}
		// TODO 该试卷答题卡数据对象
		Gson gson = new Gson();
		AnswerSheet target = gson.fromJson(examPaper.getAnswer_sheet(),AnswerSheet.class);
		// TODO 试题id 与  试题答案映射
		HashMap<Integer,AnswerSheetItem> answerMap = new HashMap<Integer,AnswerSheetItem>();
		for(AnswerSheetItem item : target.getAnswerSheetItems()){
			answerMap.put(item.getQuestionId(), item);
		}
		as.setPointMax(target.getPointMax());
		for(AnswerSheetItem item : as.getAnswerSheetItems()){
			if(item.getAnswer().equals(answerMap.get(item.getQuestionId()).getAnswer())){//判断该题是否正确
				as.setPointRaw(as.getPointRaw() + answerMap.get(item.getQuestionId()).getPoint());
				item.setPoint(answerMap.get(item.getQuestionId()).getPoint());//该题的分数
				item.setRight(true);
			}
		}
		// TODO 把计算完得分的 AnswerSheet对象 回传给Management
		this.postAnswerSheet(answerSheetPostUri, as);
		System.out.println("##################################################  AnswerSheet has been post to" + answerSheetPostUri + " ##################################################");
	}

	/**
	 * POST AnswerSheet对象 TO Management 处理
	 * @param uri
	 * @param body
	 */
	private void postAnswerSheet(String uri, Object body) {
		try {
			restTemplate.postForLocation(uri, body);
		} catch (RestClientException e) {
			LOGGER.error("Received exception:", e);
		}
	}

	/**
	 * 根据试卷id远程GET获取该试卷对象
	 * @param examaperId
	 * @return
	 */
	private ExamPaper getExamPaper(int examaperId) {
		ExamPaper examPaper = null;
		try {
			System.out.println("try to fetch exampaper");
			examPaper = restTemplate.getForObject(examPaperGetUri + "/" + examaperId, ExamPaper.class);
		} catch (RestClientException e) {
			LOGGER.error("Get Exampaper exception:", e);
		}
		if(examPaper == null){
			LOGGER.error("Get Exampaper exception: The specical Examaper is not existed.");
			System.out.println("Get Exampaper exception: The specical Examaper is not existed.");
		}
		return examPaper;

	}

}
