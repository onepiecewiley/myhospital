package com.ming.hospital.service;

import com.ming.hospital.pojo.User;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Ming on 2017/11/17.
 */
public interface UserService {
    public List<User> listAll();
    boolean register(User user);
    User login(User user);
    boolean checkUserName(String user);
}
