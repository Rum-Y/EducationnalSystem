package com.system.controller;

import com.github.pagehelper.PageInfo;
import com.system.po.*;
import com.system.service.CourseService;
import com.system.service.SelectedCourseService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
@RequestMapping(value = "/teacher")
public class TeacherController {

	@Autowired
	private CourseService courseService;

	@Autowired
	private SelectedCourseService selectedCourseService;

    // 显示我的课程
    @RequestMapping(value = "/showCourse")
    public String showStuCourse(
    		@RequestParam(value = "keyWord",defaultValue = "") String keyWord,
    		@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum,
    		@RequestParam(value = "pageSize",defaultValue = "5") Integer pageSize,
    		Model model) throws Exception {
		
        Subject subject = SecurityUtils.getSubject();
        String username = (String) subject.getPrincipal();

        PageInfo<Course> pageInfo = courseService.findByTeacherID(keyWord,pageNum,pageSize,Integer.parseInt(username));
        
        model.addAttribute("pageInfo", pageInfo);
        
        return "teacher/showCourse";
    }

    // 显示成绩
    @RequestMapping(value = "/gradeCourse")
    public String gradeCourse(Integer id, Model model) throws Exception {
        if (id == null) {
            //return "";
        }
        List<SelectedCourseCustom> list = selectedCourseService.findByCourseID(id);
        model.addAttribute("selectedCourseList", list);
        
        return "teacher/showGrade";
    }

    // 打分
    @RequestMapping(value = "/mark", method = {RequestMethod.GET})
    public String markUI(SelectedCourseCustom scc, Model model) throws Exception {

        SelectedCourseCustom selectedCourseCustom = selectedCourseService.findOne(scc);

        model.addAttribute("selectedCourse", selectedCourseCustom);

        return "teacher/mark";
    }

    // 打分
    @RequestMapping(value = "/mark", method = {RequestMethod.POST})
    public String mark(SelectedCourseCustom scc) throws Exception {

        selectedCourseService.updataOne(scc);

        return "redirect:/teacher/gradeCourse?id="+scc.getCourseid();
    }

}
