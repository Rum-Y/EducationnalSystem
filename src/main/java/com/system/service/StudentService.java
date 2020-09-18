package com.system.service;

import com.github.pagehelper.PageInfo;
import com.system.po.StudentCustom;


/**
 * Student学生Service层
 */
public interface StudentService {

    //根据id个更新学生信息
    void updataById(Integer id, StudentCustom studentCustom) throws Exception;

    //根据id删除学生信息
    void removeById(Integer id) throws Exception;

    //获取分页查询学生信息
    //List<StudentCustom> findByPaging(Integer toPageNo) throws Exception;
    PageInfo<StudentCustom> findByKeyWord(String keyWord,Integer pageNum,Integer pageSize) throws Exception;

    //保存学生信息
    Boolean save(StudentCustom studentCustoms) throws Exception;

    //获取学生总数
    int getCountStudent() throws Exception;

    //根据id获取学生信息
    StudentCustom findById(Integer id) throws Exception;

    // 一对多查询，查询该学生的选课信息
    StudentCustom findStudentAndSelectCourseListByName(String name) throws Exception;

}
