package com.ming.hospital.dao;

import com.ming.hospital.pojo.Hospital;

import java.util.List;

public interface HospitalMapper {

    List<Hospital> selectByExample();

    List<Hospital> getListByTop3();

}