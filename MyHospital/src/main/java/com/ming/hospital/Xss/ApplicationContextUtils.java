package com.ming.hospital.Xss;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import java.util.Locale;

//对Spring容器进行各种上下文操作的工具类
public class ApplicationContextUtils implements ApplicationContextAware {

    private static ApplicationContext context;

    @Override
    public void setApplicationContext(ApplicationContext context) throws BeansException {
        ApplicationContextUtils.context = context;
    }

    public static ApplicationContext getApplicationContext(){
        return context;
    }
    //根据Bean名称获取Bean对象
    public static Object getBean(String beanName){
        return context.getBean(beanName);
    }

    public static Object getMassage(String key){
        return context.getMessage(key, null, Locale.getDefault());
    }
}
