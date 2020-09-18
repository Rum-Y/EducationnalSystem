package com.system.mapper;

import com.system.po.CourseCustom;

import java.util.List;

/**
 * Created by Jacey on 2017/6/29.
 */
public interface CourseMapperCustom {

    //分页查询学生信息
    List<CourseCustom> findByKeyWord(String keyWord) throws Exception;

}
