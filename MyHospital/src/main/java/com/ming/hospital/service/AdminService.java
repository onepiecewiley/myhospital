package com.ming.hospital.service;

import com.ming.hospital.pojo.Admin;
import com.ming.hospital.pojo.Appointment;
import com.ming.hospital.pojo.User;
import org.springframework.stereotype.Service;

import java.util.List;

public interface AdminService {
    boolean select(Admin admin);
}
