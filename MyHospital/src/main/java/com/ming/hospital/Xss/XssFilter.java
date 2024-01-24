package com.ming.hospital.Xss;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class XssFilter implements Filter {
    //	为了解决multipart/form-data过滤器过滤之后controller接收不到数据的问题
    //如果没有用到，可以把相关内容删除去
    private MultipartResolver multipartResolver=null;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        //注入bean
        multipartResolver=(MultipartResolver)ApplicationContextUtils.getApplicationContext().getBean("multipartResolver",MultipartResolver.class);
    }

    @Override
    public void doFilter(ServletRequest request , ServletResponse response , FilterChain chain)
            throws IOException, ServletException{
        String contentType=request.getContentType();
        if(contentType!=null && contentType.contains("multipart/form-data")){
            //form-data过滤
            MultipartHttpServletRequest multipartRequest=multipartResolver.resolveMultipart((HttpServletRequest) request);
            XssHttpServletRequestWraper xssRequest=new XssHttpServletRequestWraper(multipartRequest);
            chain.doFilter(xssRequest, response);
        }else{
            //普通过滤
            XssHttpServletRequestWraper xssRequest=new XssHttpServletRequestWraper((HttpServletRequest)request);
            chain.doFilter(xssRequest, response);
        }
    }

    @Override
    public void destroy(){

    }
}
