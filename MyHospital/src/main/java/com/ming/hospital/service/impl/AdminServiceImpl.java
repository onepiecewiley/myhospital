package com.ming.hospital.service.impl;

import com.ming.hospital.dao.AdminMapper;
import com.ming.hospital.pojo.Admin;
import com.ming.hospital.pojo.Appointment;
import com.ming.hospital.pojo.User;
import com.ming.hospital.service.AdminService;
import com.ming.hospital.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLOutput;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public boolean select(Admin admin) {
        Admin admin1=adminMapper.select(admin);
        if(CommonUtils.MD5(admin.getPassword(),admin1.getSalt()).equals(admin1.getPassword()))
        {
            return true;
        }
        return false;
    }

}
