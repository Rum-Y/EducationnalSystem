package com.system.controller;

import com.github.pagehelper.PageInfo;
import com.system.exception.CustomException;
import com.system.po.*;
import com.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;


@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private StudentService studentService;

	@Autowired
	private TeacherService teacherService;

	@Autowired
	private CourseService courseService;

	@Autowired
	private CollegeService collegeService;

	@Autowired
	private UserloginService userloginService;

    /*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<学生操作>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

    //  学生信息显示
    @RequestMapping("/showStudent")
    public String showStudent(
    		@RequestParam(value="keyWord",defaultValue = "") String keyWord,
    		@RequestParam(value="pageNum",defaultValue = "1") Integer pageNum,
    		@RequestParam(value="pageSize",defaultValue = "5") Integer pageSize,
    		Model model) throws Exception {
    	
    	PageInfo<StudentCustom> pageInfo = studentService.findByKeyWord(keyWord, pageNum, pageSize);
    	model.addAttribute("pageInfo", pageInfo);

        return "admin/showStudent";

    }
	 

    //  添加学生信息页面显示
    @RequestMapping(value = "/addStudent", method = {RequestMethod.GET})
    public String addStudentUI(Model model) throws Exception {

        List<College> list = collegeService.finAll();

        model.addAttribute("collegeList", list);

        return "admin/addStudent";
    }

     // 添加学生信息操作
    @RequestMapping(value = "/addStudent", method = {RequestMethod.POST})
    public String addStudent(@Valid StudentCustom studentCustom,BindingResult binding, Model model) throws Exception {
      HashMap<String,String> hashMap = new HashMap<String, String>();
	  if (binding.hasErrors()) {
		 List<FieldError> list = binding.getFieldErrors();
		 for(FieldError err:list) {
			 hashMap.put(err.getField(), err.getDefaultMessage());
		 }
		 model.addAttribute("mes", hashMap);
		 List<College> collegeList = collegeService.finAll();

	     model.addAttribute("collegeList", collegeList);
		 return "admin/addStudent";
      }else {
        	  
        Boolean result = studentService.save(studentCustom);

        if (!result) {
            model.addAttribute("message", "学号重复");
            return "error";
        }
        //添加成功后，也添加到登录表
        Userlogin userlogin = new Userlogin();
        userlogin.setUsername(studentCustom.getUserid().toString());
        userlogin.setPassword("123");
        userlogin.setRole(2);
        userloginService.save(userlogin);

        //重定向
        return "redirect:/admin/showStudent?pageNum="+Integer.MAX_VALUE;
      }
          
    }

    // 修改学生信息页面显示
    @RequestMapping(value = "/editStudent", method = {RequestMethod.GET})
    public String editStudentUI(Integer id, Model model) throws Exception {
        if (id == null) {
            //加入没有带学生id就进来的话就返回学生显示页面
            return "redirect:/admin/showStudent";
        }
        StudentCustom studentCustom = studentService.findById(id);
        if (studentCustom == null) {
            throw new CustomException("未找到该名学生");
        }
        List<College> list = collegeService.finAll();

        model.addAttribute("collegeList", list);
        model.addAttribute("student", studentCustom);


        return "admin/editStudent";
    }

    // 修改学生信息处理
    @RequestMapping(value = "/editStudent", method = {RequestMethod.POST})
    public String editStudent(@Valid StudentCustom studentCustom,BindingResult binding,
    		@RequestParam("pageNum") Integer pageNum,Model model) throws Exception {
    	HashMap<String,String> hashMap = new HashMap<String, String>();
  	  	if (binding.hasErrors()) {
			 List<FieldError> list = binding.getFieldErrors();
			 for(FieldError err:list) {
				 hashMap.put(err.getField(), err.getDefaultMessage());
			 }
			 model.addAttribute("mes", hashMap);
			 List<College> collegeList = collegeService.finAll();
		
		     model.addAttribute("collegeList", collegeList);
		     return "admin/editStudent";
        }else {
        	 
        	 studentService.updataById(studentCustom.getUserid(), studentCustom);
        	 
        	 //重定向
        	 return "redirect:/admin/showStudent?pageNum="+pageNum;
         }
    }

    // 删除学生
    @RequestMapping(value = "/removeStudent")
    private String removeStudent(
    		@RequestParam("id") Integer id,
    		@RequestParam("pageNum") Integer pageNum,
    		@RequestParam("keyWord") String keyWord
    		) throws Exception {
    	
        studentService.removeById(id);
        userloginService.removeByName(id.toString());
        
        //带参保证删完回到刚刚的页面
        return "redirect:/admin/showStudent?pageNum="+pageNum;
    }

    /*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<教师操作>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

    // 教师页面显示
    @RequestMapping("/showTeacher")
    public String showTeacher(
    		@RequestParam(value="keyWord",defaultValue = "") String keyWord,
    		@RequestParam(value="pageNum",defaultValue = "1") Integer pageNum,
    		@RequestParam(value="pageSize",defaultValue = "5") Integer pageSize,
    		Model model) throws Exception {
    		
    	PageInfo<TeacherCustom> pageInfo = teacherService.findByKeyWord(keyWord, pageNum, pageSize);
    	model.addAttribute("pageInfo", pageInfo);
        

        return "admin/showTeacher";

    }

    // 添加教师信息
    @RequestMapping(value = "/addTeacher", method = {RequestMethod.GET})
    public String addTeacherUI(Model model) throws Exception {

        List<College> list = collegeService.finAll();

        model.addAttribute("collegeList", list);

        return "admin/addTeacher";
    }

    // 添加教师信息处理
    @RequestMapping(value = "/addTeacher", method = {RequestMethod.POST})
    public String addTeacher(@Valid TeacherCustom teacherCustom,BindingResult binding, Model model) throws Exception {
    	HashMap<String,String> hashMap = new HashMap<String, String>();
  	    if (binding.hasErrors()) {
			 List<FieldError> list = binding.getFieldErrors();
			 for(FieldError err:list) {
				 hashMap.put(err.getField(), err.getDefaultMessage());
			 }
			 model.addAttribute("mes", hashMap);
			 List<College> collegeList = collegeService.finAll();
		
		     model.addAttribute("collegeList", collegeList);
			 return "admin/addTeacher";
        }else {
	        Boolean result = teacherService.save(teacherCustom);
	
	        if (!result) {
	            model.addAttribute("message", "工号重复");
	            return "error";
	        }
	        //添加成功后，也添加到登录表
	        Userlogin userlogin = new Userlogin();
	        userlogin.setUsername(teacherCustom.getUserid().toString());
	        userlogin.setPassword("123");
	        userlogin.setRole(1);
	        userloginService.save(userlogin);
	
	        //重定向
	        return "redirect:/admin/showTeacher?pageNum="+Integer.MAX_VALUE;
        }
    }

    // 修改教师信息页面显示
    @RequestMapping(value = "/editTeacher", method = {RequestMethod.GET})
    public String editTeacherUI(Integer id, Model model) throws Exception {
        if (id == null) {
            return "redirect:/admin/showTeacher";
        }
        TeacherCustom teacherCustom = teacherService.findById(id);
        if (teacherCustom == null) {
            throw new CustomException("未找到该教师");
        }
        List<College> list = collegeService.finAll();

        model.addAttribute("collegeList", list);
        model.addAttribute("teacher", teacherCustom);


        return "admin/editTeacher";
    }

    // 修改教师信息页面处理
    @RequestMapping(value = "/editTeacher", method = {RequestMethod.POST})
    public String editTeacher(@Valid TeacherCustom teacherCustom,BindingResult binding,
    		@RequestParam("pageNum") Integer pageNum,Model model) throws Exception {
    	HashMap<String,String> hashMap = new HashMap<String, String>();
  	  	if (binding.hasErrors()) {
			 List<FieldError> list = binding.getFieldErrors();
			 for(FieldError err:list) {
				 hashMap.put(err.getField(), err.getDefaultMessage());
			 }
			 model.addAttribute("mes", hashMap);
			 TeacherCustom editTeacher = teacherService.findById(teacherCustom.getUserid());
			 List<College> collegeList = collegeService.finAll();
			 
			 model.addAttribute("teacher", editTeacher);
		     model.addAttribute("collegeList", collegeList);
  		 return "admin/editTeacher";
        }else {
	        teacherService.updateById(teacherCustom.getUserid(), teacherCustom);
	
	        //重定向
	        return "redirect:/admin/showTeacher?pageNum="+pageNum;
        }
    }

    //删除教师
    @RequestMapping("/removeTeacher")
    public String removeTeacher(Integer id,@RequestParam("pageNum") Integer pageNum) throws Exception {
        if (id == null) {
            //加入没有带教师id就进来的话就返回教师显示页面
            return "admin/showTeacher";
        }
        teacherService.removeById(id);
        userloginService.removeByName(id.toString());

        return "redirect:/admin/showTeacher?pageNum="+pageNum;
    }

    /*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<课程操作>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

    // 课程信息显示
    @RequestMapping("/showCourse")
    public String showCourse(
    		@RequestParam(value="keyWord",defaultValue = "") String keyWord,
    		@RequestParam(value="pageNum",defaultValue = "1") Integer pageNum,
    		@RequestParam(value="pageSize",defaultValue = "5") Integer pageSize,
    		Model model) throws Exception {

        PageInfo<CourseCustom> pageInfo = courseService.findByKeyWord(keyWord, pageNum, pageSize);
        model.addAttribute("pageInfo", pageInfo);
    	
        return "admin/showCourse";

    }

    //显示添加课程页面
    @RequestMapping(value = "/addCourse", method = {RequestMethod.GET})
    public String addCourseUI(Model model) throws Exception {

        List<TeacherCustom> list = teacherService.findAll();
        List<College> collegeList = collegeService.finAll();

        model.addAttribute("collegeList", collegeList);
        model.addAttribute("teacherList", list);

        return "admin/addCourse";
    }

    // 添加课程信息处理
    @RequestMapping(value = "/addCourse", method = {RequestMethod.POST})
    public String addCourse(@Valid CourseCustom courseCustom,BindingResult binding, Model model) throws Exception {

    	
    	HashMap<String,String> hashMap = new HashMap<String, String>();
  	    if (binding.hasErrors()) {
			 List<FieldError> list = binding.getFieldErrors();
			 for(FieldError err:list) {
				 hashMap.put(err.getField(), err.getDefaultMessage());
			 }
			 model.addAttribute("mes", hashMap);
			 List<TeacherCustom> teacherList = teacherService.findAll();
	         List<College> collegeList = collegeService.finAll();

	         model.addAttribute("collegeList", collegeList);
	         model.addAttribute("teacherList", teacherList);
			 return "admin/addCourse";
        }else {
	        Boolean result = courseService.save(courseCustom);
	
	        if (!result) {
	            model.addAttribute("message", "课程号重复");
	            return "error";
	        }
	
	
	        //重定向
	        return "redirect:/admin/showCourse?pageNum="+Integer.MAX_VALUE;
        }
    }

    // 修改课程信息页面显示
    @RequestMapping(value = "/editCourse", method = {RequestMethod.GET})
    public String editCourseUI(Integer id, Model model) throws Exception {
        if (id == null) {
            return "redirect:/admin/showCourse";
        }
        CourseCustom courseCustom = courseService.findById(id);
        if (courseCustom == null) {
            throw new CustomException("未找到该课程");
        }
        List<TeacherCustom> list = teacherService.findAll();
        List<College> collegeList = collegeService.finAll();

        model.addAttribute("teacherList", list);
        model.addAttribute("collegeList", collegeList);
        model.addAttribute("course", courseCustom);


        return "admin/editCourse";
    }

    // 修改课程信息页面处理
    @RequestMapping(value = "/editCourse", method = {RequestMethod.POST})
    public String editCourse(@Valid CourseCustom courseCustom,BindingResult binding,
    		@RequestParam("pageNum") Integer pageNum,Model model) throws Exception {

    	
    	HashMap<String,String> hashMap = new HashMap<String, String>();
    	if(binding.hasErrors()) {
    		List<FieldError> errors = binding.getFieldErrors();
    		for(FieldError err:errors) {
    			hashMap.put(err.getField(), err.getDefaultMessage());
    		}
    		model.addAttribute("mes", hashMap);
    		CourseCustom courseCus = courseService.findById(courseCustom.getCourseid());
            List<TeacherCustom> list = teacherService.findAll();
            List<College> collegeList = collegeService.finAll();

            model.addAttribute("teacherList", list);
            model.addAttribute("collegeList", collegeList);
            model.addAttribute("course", courseCus);
    		return "admin/editCourse";
    	}else {
    		
    		courseService.upadteById(courseCustom.getCourseid(), courseCustom);
    		
    		//重定向
    		return "redirect:/admin/showCourse?pageNum="+pageNum;
    	}
    }

    // 删除课程信息
    @RequestMapping("/removeCourse")
    public String removeCourse(Integer id,@RequestParam("pageNum") Integer pageNum) throws Exception {
        if (id == null) {
            //加入没有带教师id就进来的话就返回教师显示页面
            return "admin/showCourse";
        }
        courseService.removeById(id);

        return "redirect:/admin/showCourse?pageNum="+pageNum;
    }


    /*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<其他操作>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

    // 普通用户账号密码重置
    @RequestMapping("/userPasswordRest")
    public String userPasswordRestUI() throws Exception {
        return "admin/userPasswordRest";
    }

    // 普通用户账号密码重置处理
    @RequestMapping(value = "/userPasswordRest", method = {RequestMethod.POST})
    public String userPasswordRest(Userlogin userlogin) throws Exception {

        Userlogin u = userloginService.findByName(userlogin.getUsername());

        if (u != null) {
            if (u.getRole() == 0) {
                throw new CustomException("该账户为管理员账户，没法修改");
            }
            u.setPassword(userlogin.getPassword());
            userloginService.updateByName(userlogin.getUsername(), u);
        } else {
            throw new CustomException("没找到该用户");
        }

        return "admin/userPasswordRest";
    }

}
