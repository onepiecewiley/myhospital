package com.ming.hospital.service;

import com.ming.hospital.pojo.Hospital;

import java.util.List;

public interface HospitalService {

    List<Hospital> getList();

    List<Hospital> getListByTop3();
}
