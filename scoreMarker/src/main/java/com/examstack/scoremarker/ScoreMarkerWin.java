package com.examstack.scoremarker;

import java.io.IOException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;

import com.examstack.common.domain.exam.AnswerSheet;
import com.examstack.scoremarker.config.ScoreMarkConfig;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.rabbitmq.client.ConsumerCancelledException;
import com.rabbitmq.client.QueueingConsumer;
import com.rabbitmq.client.ShutdownSignalException;
/**
 * 引入RabbitMq，用于接受用户提交的答题卡，通过ScoreMarker从消息队列获取答题卡并交卷，减小大量用户提交导致的服务器故障几率。

 * 考试试卷计算得分的处理引擎
 * @author lidapeng
 *
 */

@Component
@SuppressWarnings("unused")
public class ScoreMarkerWin {

	private static boolean stop = false;
	
	@Autowired
	private QueueingConsumer consumer;
	@Autowired
	private ScoreCalcuService scoreCalcuService;
	@Autowired
	private ObjectMapper mapper;
	
	private static boolean waitingForMessage = false;
	
	private static final Logger LOGGER = Logger.getLogger(ScoreMarkerWin.class);
    
    public static void main(String[] args) {
    	ScoreMarkerWin scoreMarkerWin = new ScoreMarkerWin();
    	scoreMarkerWin.init();//初始化
    	scoreMarkerWin.run();
    }
	/**
	 * 初始化Spring上下文，实例化类
	 * 注册读取配置信息类
	 * 
	 */
	@SuppressWarnings("resource")
	public void init() {

		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.register(ScoreMarkConfig.class);
		context.refresh();
		scoreCalcuService = context.getBean(ScoreCalcuService.class);
		consumer = context.getBean(QueueingConsumer.class);
		mapper = context.getBean(ObjectMapper.class);
		LOGGER.info("ScoreMarker daemon init done.");
	}

//    public static void start(String[] args) {
//    	
//		ScoreMarkerWin win = new ScoreMarkerWin();
//    	win.init();
//        System.out.println("start");
//        Thread thread = new Thread(){
//			@Override
//			public void run() {
//				win.run();
//			}
//        };
//        thread.start();
//    }
// 
//    public static void stop(String[] args) {
//        System.out.println("stop");
//        stop = true;
//        System.exit(0);
//    }
 
    
    
    protected void run() {
    	while(!stop){
    		try {
    			LOGGER.info("scoreMaker checking next delivery from message queue");
    			waitingForMessage = true;
    			QueueingConsumer.Delivery delivery = consumer.nextDelivery();
    			waitingForMessage = false;
    			AnswerSheet answerSheet = mapper.readValue(delivery.getBody(),
    					AnswerSheet.class);
    			//根据答题卡计算学员分数
    			scoreCalcuService.calcuScore(answerSheet);
    			
    		} catch (ShutdownSignalException e) {
    			LOGGER.error("scoreMaker received ShutdownSignalException: ", e);
    			try {
    				// Sleep some time to release the CPU time slices if
    				// connection with RabbitMQ server
    				// is disconnected, otherwise CPU usage will be high if
    				// connection is disconnected.
    				Thread.sleep(100);
    			} catch (Throwable ex) {
    				LOGGER.error("scoreMaker sleep exception: ", ex);
    			}
    		} catch (IOException | ConsumerCancelledException | InterruptedException e) {
    			LOGGER.error("scoreMaker received exception", e);
    		}
    	}
	}
}
