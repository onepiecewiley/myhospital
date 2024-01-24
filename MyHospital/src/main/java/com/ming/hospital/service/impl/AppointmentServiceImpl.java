package com.ming.hospital.service.impl;

import com.ming.hospital.dao.AppointmentMapper;
import com.ming.hospital.pojo.Appointment;
import com.ming.hospital.pojo.User;
import com.ming.hospital.service.AppointmentService;
import com.ming.hospital.service.HospitalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Ming on 2017/11/17.
 */
@Service
public class AppointmentServiceImpl implements AppointmentService {
    @Autowired
    private AppointmentMapper appointmentMapper;

    @Override
    public Integer selectTimesFromHospital(Long hid) {
        Integer integer = appointmentMapper.selectTimesFromHospital(hid);
        return integer;
    }

    @Override
    public int getAppointMentInfo(String name, String visittime, String idcast) {
        return appointmentMapper.selectByNameTimeId(name, visittime, idcast);
    }

    @Override
    public Boolean save(Appointment appointment) {
        try{
            appointmentMapper.insert(appointment);
            return true;
        }catch (Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }

    @Override
    public List<Appointment> selectAll(User user) {
        return appointmentMapper.selectAll(user);
    }


}
