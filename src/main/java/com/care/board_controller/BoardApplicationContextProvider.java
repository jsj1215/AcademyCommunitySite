package com.care.board_controller;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class BoardApplicationContextProvider implements ApplicationContextAware {
	public static ApplicationContext applicationContext;

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		BoardApplicationContextProvider.applicationContext = applicationContext;
	}

}
