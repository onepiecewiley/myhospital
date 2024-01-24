package com.ming.hospital.web;


import com.ming.hospital.pojo.Appointment;
import com.ming.hospital.pojo.DayInfo;
import com.ming.hospital.pojo.Doctor;
import com.ming.hospital.pojo.User;
import com.ming.hospital.service.AppointmentService;
import com.ming.hospital.service.DoctorService;
import com.ming.hospital.utils.CommonUtils;
import com.ming.hospital.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/appointment")
public class AppointmentController {

    @Autowired
    private DoctorService doctorService;
    @Autowired
    private AppointmentService appointmentService;

    @RequestMapping("/{did}")
    public String show(@PathVariable Long did, Model model,HttpSession session){
        if(session.getAttribute("user")==null)
        {
            return "error";
        }
        Doctor doctor = doctorService.selectById(did);
        String[] times = doctor.getSurgeryweek().split(","); //就诊时间
        List<DayInfo> dayInfoList = new ArrayList<>();
        Date date = new Date();

        for(int i = 0; i < 7; i++){
            DayInfo dayInfo = new DayInfo();
            dayInfo.setDate(DateUtils.getDate(date));
            dayInfo.setFullDate(DateUtils.getFillDate(date));
            dayInfo.setWeek(DateUtils.getWeek(date));
            for (String  time : times) {
                if(dayInfo.getWeek().equals(time.substring(0,3))){
                    time = time.substring(3); //取上午、下午、晚上
                    if(time.equals("上午")){
                        dayInfo.setSpecificTime("上午");
                    }else if(time.equals("下午")){
                        dayInfo.setSpecificTime(("下午"));
                    }else{
                        dayInfo.setSpecificTime("晚上");

                    }
                    DayInfo tmp=new DayInfo();
                    tmp.setDate(dayInfo.getDate());
                    tmp.setWeek(dayInfo.getWeek());
                    tmp.setFullDate(dayInfo.getFullDate());
                    tmp.setSpecificTime(dayInfo.getSpecificTime());
                    dayInfoList.add(tmp);
                }
            }
            //调整 跳到下一天
            date.setTime(date.getTime() + 1000*60*60*24);
        }
        model.addAttribute("dayInfoList",dayInfoList);
        model.addAttribute("doctor",doctor);

        return "appointment_form";
    }


    @RequestMapping("/submit")
    @ResponseBody
    public String commit(Appointment appointment, HttpSession session){
        appointment.setAid(CommonUtils.getId());
        appointment.setCreatetime(new Date());
        String resultData = "";
        User user = (User)session.getAttribute("user");
        if(user == null){
            resultData = "-2";
        }else {
            appointment.setUid(user.getUid());
            if(!appointment.getName().equals(user.getName())){
                resultData = "-1";
            }else {
                if(!appointmentService.save(appointment)){
                    resultData = "-3";
                }else{
                    resultData = String.valueOf(appointment.getAid());
                }
            }
        }
        return resultData;
    }
}