package com.ming.hospital.web;

import com.ming.hospital.dao.DoctorMapper;
import com.ming.hospital.pojo.*;
import com.ming.hospital.service.*;
import com.ming.hospital.utils.CommonUtils;
import com.ming.hospital.utils.RandomValidateCode;
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
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private DoctorService doctorService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private HospitalService hospitalService;
    @Autowired
    private AppointmentService appointmentService;

    @RequestMapping(value = "/register",method = {RequestMethod.POST})
    public String register(User user,Model model) {
        Date date = new Date();
        user.setCreatetime(date);
        user.setUid(CommonUtils.getId());
        String salt=CommonUtils.getRandomString(10);
        user.setSalt(salt);
        boolean register = userService.register(user);
        if(register){
            return "registerSuccess";
        }
        model.addAttribute("msg","不好意思！注册失败！请重新注册，");
        return "error";
    }

    @RequestMapping("/login")
    @ResponseBody
    public String login(User user,HttpServletRequest request) {
        String resultData = "2";
        //先验证验证码 验证码不对就没必要往下进行了
        HttpSession session = request.getSession();
        String vercode1 = (String) session.getAttribute("randomcode_key");
        String vercode2 = user.getVericode();
        if (!vercode1.equals(vercode2)) {
            resultData = "1";
            return resultData;
        }
        //验证码验证通过后 要判断登录的是管理员 还是普通用户 0的话当成管理员处理 1的话当成普通用户处理
        if (user.getFlag().equals("1")) {
            User fullUser = userService.login(user);
            if (fullUser != null) {
                session.setAttribute("user", fullUser);
                resultData = "0";
            }else{
                resultData="2";
            }
            return resultData;
        } else if (user.getFlag().equals("0")) {
            Admin admin=new Admin();
            admin.setAdmin(user.getUser());
            admin.setPassword(user.getPwd());
            boolean f=adminService.select(admin);
            if(f){
                resultData="3";
                session.setAttribute("admin",admin);
            }else{
                resultData="2";
            }
        }else{
            resultData="4";
        }
        return resultData;
    }
    @RequestMapping("/checkUserName")
    @ResponseBody
    public Map checkUserName(String user){
        Map map = new HashMap();
        boolean isExist = userService.checkUserName(user);
        map.put("isExist",isExist ? true:false);
        return map;
    }
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping("/admin")
    public String active(HttpSession session,Model model){
        if(session.getAttribute("admin")!=null)
        {
            //医生信息推荐
            List<Hospital> list = hospitalService.getList();
            model.addAttribute("hospitalList",list);
            return "admin";
        }else{
            return "error";
        }
    }

    @RequestMapping("/commonUser")
    public String commonUser(HttpSession session,Model model){
        User user= (User) session.getAttribute("user");
        if(session.getAttribute("user")!=null)
        {
            //订单信息
            List<Appointment> list = appointmentService.selectAll(user);
            model.addAttribute("appointmentList",list);
            System.out.println(list);
            return "personPage";
        }else{
            return "error";
        }
    }

}
