package org.sarak.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class BookDBCheckTask {

	@Scheduled(cron="0 * * * * *")
	public void checkDB()throws Exception{
		
		log.warn("DB Check Task run.....");
		
		log.warn("=========================");
		
	}
}