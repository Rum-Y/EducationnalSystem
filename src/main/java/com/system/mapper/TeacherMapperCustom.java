package com.system.mapper;

import com.system.po.TeacherCustom;

import java.util.List;

/**
 * Created by Jacey on 2017/6/29.
 */
public interface TeacherMapperCustom {

    //分页查询老师信息
    List<TeacherCustom> findByKeyWord(String keyWord) throws Exception;

}
