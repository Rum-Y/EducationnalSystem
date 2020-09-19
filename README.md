# EducationnalSystem
一个用eclipse+tomcat开发的教务管理系统web项目

有用到Spring,SpringMvc,Mybatis,Shiro,MySql数据库,Maven,用PageHelper和paginationz实现分页功能,用JSR303实现了数据校验功能。

一.登录用Shiro实现用户认证，和权限管理。用户分为三大类,分管理员，老师，学生。通过Shiro的认证功能识别登录的是哪类账号，相应的就会进入该类账号所拥有权限的管理系统。
1.权力最大的是管理员，可以对课程，老师，学生进行添加，修改，删除。

2.老师账号可以查看有哪些学生选了它的课，并对这些学生进行打分操作。每个老师账号都只能看到和自己相关的资源。

3.学生可以进行选课，退课操作，查看已选和已修的课程列表。和老师一样，每个学生也只能看到和自己相关的资源。

二.用Mybatis-generate逆向工程生成JavaBean实体类,xxxMapper.xml,xxxMapper.java接口，和xxxExample.java

并自定义JavaBean实体类的子类，用于存储其它有关联类的属性，降低实体类之间的耦合度。

自定义xxxMapperCustomer.xml用于做Mapper功能拓展。

三.就是业务代码了，就不说了。
数据库文件在sql文件夹里面，Image文件夹是存放运行效果截图的。

eclipse要用File下的Open Project from File system导入，亲测可行。import将无法导入。

