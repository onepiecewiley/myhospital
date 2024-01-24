package com.ming.hospital.service.impl;

import com.ming.hospital.dao.DoctorMapper;
import com.ming.hospital.pojo.Doctor;
import com.ming.hospital.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorServiceImpl implements DoctorService  {
    @Autowired
    private DoctorMapper doctorMapper;

    @Override
    public Doctor selectById(Long id) {
        return  doctorMapper.selectById(id);
    }

    @Override
    public List<Doctor> getList() {
        return doctorMapper.selectByExample();
    }

    @Override
    public List<Doctor> getListByTop4() {
        return  doctorMapper.getListByTop4();
    }


}
