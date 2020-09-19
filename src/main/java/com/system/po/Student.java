package com.system.po;

import java.util.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


public class Student {
	
	@NotNull(message = "不能为空")
	@Min(value=10001,message = "最小值是10001")
	@Max(value = 19999,message = "最大值是19999")
    private Integer userid;

	@NotNull(message = "不能为空")
	@Size(min = 1,message = "必须填写一个以上的字符")
    private String username;

    private String sex;

    private Date birthyear;

    private Date grade;

    private Integer collegeid;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Date getBirthyear() {
        return birthyear;
    }

    public void setBirthyear(Date birthyear) {
        this.birthyear = birthyear;
    }

    public Date getGrade() {
        return grade;
    }

    public void setGrade(Date grade) {
        this.grade = grade;
    }

    public Integer getCollegeid() {
        return collegeid;
    }

    public void setCollegeid(Integer collegeid) {
        this.collegeid = collegeid;
    }
}