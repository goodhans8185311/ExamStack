package com.examstack.scoremarker.config;

import java.io.IOException;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

import com.examstack.common.Constants;
import com.examstack.common.domain.exam.ExamPaper;
import com.examstack.scoremarker.ScoreMarkerMain;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.QueueingConsumer;

/**
 * 初始化环境变量
 * @author hans
 *
 */
@Configuration
@ComponentScan("com.examstack.scoremarker")
public class ScoreMarkConfig {

	private static final Logger LOGGER = Logger.getLogger(ScoreMarkerMain.class);

	/**
	 * rabbitMQ 消费者
	 * @return
	 */
	@Bean
	QueueingConsumer queueingConsumer() throws IOException {
		LOGGER.info("##############################################   初始化RabbitMQ Consumer 消费者        #####################################################");
		ConnectionFactory factory = new ConnectionFactory();//rabbitMQ 连接工厂
		factory.setHost(Constant.messageQueueHostname); //rabbitmq.host
		Connection connection = factory.newConnection();
		Channel channel = connection.createChannel();
		channel.queueDeclare(Constants.ANSWERSHEET_DATA_QUEUE, true, false, false, null);
		QueueingConsumer consumer = new QueueingConsumer(channel);
		channel.basicConsume(Constants.ANSWERSHEET_DATA_QUEUE, true, consumer);
		return consumer;
	}

	@Bean
	ObjectMapper objectMapper()
	{
		return new ObjectMapper();
	}
	
	@Bean
	HashMap<String, ExamPaper> examPapersMap()
	{
		return new HashMap<String, ExamPaper>();
	}
	
	
	@Bean
	RestTemplate restTemplate()
	{
		return new RestTemplate();
	}
}
