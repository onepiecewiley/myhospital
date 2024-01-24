package com.ming.hospital.dao;

import com.ming.hospital.pojo.Doctor;

import java.util.List;

public interface DoctorMapper {

    List<Doctor> selectByExample();

    Doctor selectById(Long id);

    List <Doctor> getListByTop4();
}