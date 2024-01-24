package com.ming.hospital.dao;

import com.ming.hospital.pojo.Appointment;
import java.util.List;

import com.ming.hospital.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface AppointmentMapper {

    int insert(Appointment record);

    Integer selectTimesFromHospital(Long hid);

    int selectByNameTimeId(String did,String name,String visittime);

    List<Appointment> selectAll(User user);
}