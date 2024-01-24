package com.ming.hospital.dao;

import com.ming.hospital.pojo.User;

import java.util.List;


public interface UserMapper {
    int insert(User record);

    List<User> selectByExample(User user);
    
    List<User> selectAll();

    List<User> selectByUser(String user);

    int update(User u);
}