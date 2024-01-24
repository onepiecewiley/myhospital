package com.ming.hospital.service;

import com.ming.hospital.pojo.Appointment;
import com.ming.hospital.pojo.User;
import org.springframework.stereotype.Service;

import java.util.List;


public interface AppointmentService {

    Integer selectTimesFromHospital(Long hid);

    int getAppointMentInfo(String name,String visittime,String idcast);

    Boolean save(Appointment appointment);

    //用户查看自己的订单
    List<Appointment> selectAll(User user);

}
