package com.ming.hospital.service.impl;

import com.ming.hospital.dao.UserMapper;
import com.ming.hospital.pojo.User;
import com.ming.hospital.service.UserService;
import com.ming.hospital.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Ming on 2017/11/17.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> listAll() {
        return userMapper.selectAll();
    }

    @Override
    public boolean register(User user) {
        String pwd = CommonUtils.MD5(user.getPwd(),user.getSalt());
        user.setPwd(pwd);
        int insert = userMapper.insert(user);
        //发送邮箱
        return insert >0 ? true:false;
    }


    @Override
    public User login(User user) {
        List<User> users = userMapper.selectByExample(user);
        User u;
        try {
            u = users.get(0);
        }catch (Exception e){
            //System.out.println("没这个人.....");
            return null;
        }
        if(CommonUtils.MD5(user.getPwd(),u.getSalt()).equals(u.getPwd())){
            return u;
        }
        else{
            return  null;
        }

    }

    @Override
    public boolean checkUserName(String user) {
        List<User> users = userMapper.selectByUser(user);
        return users.size() > 0 ? true : false;

    }
}
