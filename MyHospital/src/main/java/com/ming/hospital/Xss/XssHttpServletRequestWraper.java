package com.ming.hospital.Xss;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class XssHttpServletRequestWraper extends HttpServletRequestWrapper {

    public XssHttpServletRequestWraper(HttpServletRequest servletRequest){
        super(servletRequest);
    }

    @Override
    public String getHeader(String name){
        return super.getHeader(name);
    }

    @Override
    public String getParameter(String name){
        String value = super.getParameter(name);
        return xssEncode(value);
    }

    //对以FormData形式提交，Content-Type:application/x-www-from-urlencoded参数过滤
    @Override
    public String[] getParameterValues(String name){
        String[] values=super.getParameterValues(name);
        if(values==null){
            return null;
        }
        int count=values.length;
        String[] encodeValues=new String[count];
        for(int i=0;i<count;i++){
            encodeValues[i]=xssEncode(values[i]);
        }
        return encodeValues;
    }

    /*过滤策略：把特殊字符转为HTML实体编码，
     *这样存在数据库里较安全
     *返回给前端时会被js解析为正常字符，不影响查看*/
    public static String xssEncode(String str){
        if(str == null || str.isEmpty()){
            return str;
        }
        str = str.replaceAll(";", "&#59;");
        str = str.replaceAll("<", "&#60;").replaceAll(">", "&#62;");
        str = str.replaceAll("\\(", "&#40;").replaceAll("\\)", "&#41;");
        str = str.replaceAll("'", "&#39;").replaceAll("\"", "&#34;");
        str = str.replaceAll("\\$", "&#36;");
        str = str.replaceAll("%", "&#37;");
        str = str.replaceAll("\\/", "&#47;").replaceAll("\\\\", "&#92;");
        str = str.replaceAll(":", "&#58;");
        str = str.replaceAll("\\?", "&#63;").replaceAll("@", "&#64;");
        str = str.replaceAll("\\^", "&#94;");
        return str;
    }
}
