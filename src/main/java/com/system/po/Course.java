package com.system.po;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Course {
	
	@NotNull(message = "不能为空")
    private Integer courseid;

	@NotNull(message = "不能为空")
	@Size(min = 2,message = "必须填写两个以上的字符")
    private String coursename;

    private Integer teacherid;

    @NotNull(message = "不能为空")
	@Size(min = 2,message = "填写星期几")
    private String coursetime;

    @NotNull(message = "不能为空")
	@Size(min = 4,message = "必须填写3个以上字符的教室名")
    private String classroom;

    private Integer courseweek;

    private String coursetype;

    private Integer collegeid;

    private Integer score;

    public Integer getCourseid() {
        return courseid;
    }

    public void setCourseid(Integer courseid) {
        this.courseid = courseid;
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename == null ? null : coursename.trim();
    }

    public Integer getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(Integer teacherid) {
        this.teacherid = teacherid;
    }

    public String getCoursetime() {
        return coursetime;
    }

    public void setCoursetime(String coursetime) {
        this.coursetime = coursetime == null ? null : coursetime.trim();
    }

    public String getClassroom() {
        return classroom;
    }

    public void setClassroom(String classroom) {
        this.classroom = classroom == null ? null : classroom.trim();
    }

    public Integer getCourseweek() {
        return courseweek;
    }

    public void setCourseweek(Integer courseweek) {
        this.courseweek = courseweek;
    }

    public String getCoursetype() {
        return coursetype;
    }

    public void setCoursetype(String coursetype) {
        this.coursetype = coursetype == null ? null : coursetype.trim();
    }

    public Integer getCollegeid() {
        return collegeid;
    }

    public void setCollegeid(Integer collegeid) {
        this.collegeid = collegeid;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }
}