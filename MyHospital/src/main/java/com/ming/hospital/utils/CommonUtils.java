package com.ming.hospital.utils;


import org.springframework.util.DigestUtils;

import java.util.Random;

public class CommonUtils {
    public static Long getId(){
        Long id = System.currentTimeMillis();
        id = id*10+(int)(Math.random()*10);
        id = id*10+(int)(Math.random()*10);
        return id;
    }
    //length用户要求产生字符串的长度
    public static String getRandomString(int length){
        String str="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random=new Random();
        StringBuffer sb=new StringBuffer();
        for(int i=0;i<length;i++){
            int number=random.nextInt(62);
            sb.append(str.charAt(number));
        }
        return sb.toString();
    }
    public static String  MD5(String key,String salt){
        String base = key + "/" + salt;
        String md5 = DigestUtils.md5DigestAsHex(base.getBytes());
        return md5;
    }

}
