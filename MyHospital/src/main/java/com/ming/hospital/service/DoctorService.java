package com.ming.hospital.service;

import com.ming.hospital.pojo.Doctor;

import java.util.List;

/**
 * Created by Ming on 2017/11/17.
 */
public interface DoctorService {
    Doctor  selectById(Long id);
    List<Doctor> getList();
    List<Doctor> getListByTop4();

}
