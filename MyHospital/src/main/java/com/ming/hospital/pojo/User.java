package com.ming.hospital.pojo;

import java.util.Date;

public class User {
    private Long uid;

    private String user;

    private String pwd;

    private String name;

    private String gender;

    private String email;

    private String phone;

    private Date createtime;

    private String vericode;

    private String flag;

    public String getSalt() {
        return salt;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", user='" + user + '\'' +
                ", pwd='" + pwd + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", createtime=" + createtime +
                ", vericode='" + vericode + '\'' +
                ", flag='" + flag + '\'' +
                ", salt='" + salt + '\'' +
                '}';
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    private String salt;

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getVericode() {
        return vericode;
    }

    public void setVericode(String vericode) {
        this.vericode = vericode;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user == null ? null : user.trim();
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd == null ? null : pwd.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }



}