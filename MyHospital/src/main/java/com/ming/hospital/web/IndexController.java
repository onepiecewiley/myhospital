package com.ming.hospital.web;
import com.ming.hospital.pojo.Dept;
import com.ming.hospital.pojo.Doctor;
import com.ming.hospital.pojo.Hospital;
import com.ming.hospital.pojo.User;
import com.ming.hospital.service.*;
import com.ming.hospital.utils.RandomValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private HospitalService hospitalService;
    @Autowired
    private DoctorService doctorService;

    @Autowired
    private  UserService userService;;


    @RequestMapping("/")
    public String index(Model model){

        List<Hospital> list = hospitalService.getList();
        model.addAttribute("hospitalList",list);
//
        //医生信息推荐
        List<Doctor> listByTop4 = doctorService.getListByTop4();
        model.addAttribute("doctorList",listByTop4);
//
        //总共医生
        List<Doctor> doctorList = doctorService.getList();
        model.addAttribute("doctorSize",doctorList.size());

        //总服务次数
        List<User> userList = userService.listAll();
        model.addAttribute("userListSize",userList.size());
//
        //推荐医院 分数排名前3
        List<Hospital> listByTop3 = hospitalService.getListByTop3();
        model.addAttribute("hospitalTop3",listByTop3);
        return "index";
    }

    @RequestMapping(value="/checkCode")
    public void checkCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //设置相应类型,告诉浏览器输出的内容为图片
        response.setContentType("image/jpeg");
        //设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
