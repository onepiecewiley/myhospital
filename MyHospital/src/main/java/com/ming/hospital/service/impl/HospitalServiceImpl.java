package com.ming.hospital.service.impl;

import com.ming.hospital.dao.DoctorMapper;
import com.ming.hospital.dao.HospitalMapper;
import com.ming.hospital.pojo.*;
import com.ming.hospital.service.AppointmentService;
import com.ming.hospital.service.HospitalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Ming on 2017/11/17.
 */
@Service
public class HospitalServiceImpl implements HospitalService {
    @Autowired
    private HospitalMapper hospitalMapper;

    @Autowired
    private AppointmentService appointmentService;


    @Override
    public List<Hospital> getList() {
        return   hospitalMapper.selectByExample();
    }

    @Override
    public List<Hospital> getListByTop3() {
        List<Hospital> listByTop3 = hospitalMapper.getListByTop3();
        for (Hospital hospital : listByTop3) {
            Integer integer = appointmentService.selectTimesFromHospital(hospital.getHid());
            hospital.setTimes(integer);
        }
        return hospitalMapper.getListByTop3();
    }
}
