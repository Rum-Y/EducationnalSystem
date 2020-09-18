/*
 Navicat Premium Data Transfer

 Source Server         : mysql5520
 Source Server Type    : MySQL
 Source Server Version : 50520
 Source Host           : localhost:3306
 Source Schema         : educational_system

 Target Server Type    : MySQL
 Target Server Version : 50520
 File Encoding         : 65001

 Date: 17/09/2020 19:49:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `collegeID` int(11) NOT NULL,
  `collegeName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名',
  PRIMARY KEY (`collegeID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES (1, '计算机系');
INSERT INTO `college` VALUES (2, '设计系');
INSERT INTO `college` VALUES (3, '财经系');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `courseID` int(11) NOT NULL,
  `courseName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `teacherID` int(11) NOT NULL,
  `courseTime` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开课时间',
  `classRoom` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开课地点',
  `courseWeek` int(200) NULL DEFAULT NULL COMMENT '学时',
  `courseType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程类型',
  `collegeID` int(11) NOT NULL COMMENT '所属院系',
  `score` int(11) NOT NULL COMMENT '学分',
  PRIMARY KEY (`courseID`) USING BTREE,
  INDEX `collegeID`(`collegeID`) USING BTREE,
  INDEX `teacherID`(`teacherID`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`collegeID`) REFERENCES `college` (`collegeID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 'C语言程序设计', 1001, '周二', '科401', 18, '必修课', 1, 3);
INSERT INTO `course` VALUES (2, 'Python爬虫技巧', 1001, '周四', 'X402', 18, '必修课', 1, 3);
INSERT INTO `course` VALUES (3, '数据结构', 1001, '周四', '科401', 18, '必修课', 1, 2);
INSERT INTO `course` VALUES (4, 'Java程序设计', 1002, '周五', '科401', 18, '必修课', 1, 2);
INSERT INTO `course` VALUES (5, '英语', 1002, '周四', 'X302', 18, '必修课', 2, 2);
INSERT INTO `course` VALUES (6, '服装设计', 1003, '周一', '科401', 18, '选修课', 2, 2);
INSERT INTO `course` VALUES (7, '计算机应用', 1001, '周三', '科技楼205', 11, '必修课', 1, 2);
INSERT INTO `course` VALUES (8, '计算机科学', 1001, '周五', '科技楼205', 12, '必修课', 1, 2);
INSERT INTO `course` VALUES (9, '马术', 1001, '周二', '骑马场', 13, '选修课', 3, 3);
INSERT INTO `course` VALUES (10, '马术', 1014, '周三', '骑马场', 13, '必修课', 1, 3);
INSERT INTO `course` VALUES (11, '击剑', 1008, '周五', '击剑馆', 11, '公共课', 1, 2);
INSERT INTO `course` VALUES (12, '击剑', 1001, '周五', '击剑馆', 10, '选修课', 1, 2);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleID` int(11) NOT NULL,
  `roleName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permissions` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (0, 'admin', NULL);
INSERT INTO `role` VALUES (1, 'teacher', NULL);
INSERT INTO `role` VALUES (2, 'student', NULL);

-- ----------------------------
-- Table structure for selectedcourse
-- ----------------------------
DROP TABLE IF EXISTS `selectedcourse`;
CREATE TABLE `selectedcourse`  (
  `courseID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `mark` int(11) NULL DEFAULT NULL COMMENT '成绩',
  INDEX `courseID`(`courseID`) USING BTREE,
  INDEX `studentID`(`studentID`) USING BTREE,
  CONSTRAINT `selectedcourse_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `selectedcourse_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of selectedcourse
-- ----------------------------
INSERT INTO `selectedcourse` VALUES (2, 10001, 60);
INSERT INTO `selectedcourse` VALUES (1, 10001, 95);
INSERT INTO `selectedcourse` VALUES (1, 10002, 66);
INSERT INTO `selectedcourse` VALUES (1, 10003, NULL);
INSERT INTO `selectedcourse` VALUES (2, 10003, 99);
INSERT INTO `selectedcourse` VALUES (3, 10001, NULL);
INSERT INTO `selectedcourse` VALUES (4, 10001, NULL);
INSERT INTO `selectedcourse` VALUES (9, 10002, NULL);
INSERT INTO `selectedcourse` VALUES (12, 10002, NULL);
INSERT INTO `selectedcourse` VALUES (9, 10001, NULL);
INSERT INTO `selectedcourse` VALUES (5, 10001, NULL);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthYear` date NULL DEFAULT NULL COMMENT '出生日期',
  `grade` date NULL DEFAULT NULL COMMENT '入学时间',
  `collegeID` int(11) NOT NULL COMMENT '院系id',
  PRIMARY KEY (`userID`) USING BTREE,
  INDEX `collegeID`(`collegeID`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`collegeID`) REFERENCES `college` (`collegeID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10016 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (10001, '小黄', '男', '1996-09-02', '2015-09-02', 1);
INSERT INTO `student` VALUES (10002, '小米', '女', '1995-09-14', '2015-09-02', 3);
INSERT INTO `student` VALUES (10003, '小黑', '男', '1999-06-02', '2018-07-02', 2);
INSERT INTO `student` VALUES (10005, '小左', '女', '1996-09-02', '2015-09-02', 2);
INSERT INTO `student` VALUES (10006, '小红', '女', '1996-07-02', '2016-06-02', 3);
INSERT INTO `student` VALUES (10007, '小城', '男', '1996-02-02', '2015-09-02', 3);
INSERT INTO `student` VALUES (10008, '小艾', '女', '1996-09-02', '2015-09-02', 1);
INSERT INTO `student` VALUES (10009, '赵云', '男', '1996-09-02', '2017-10-02', 2);
INSERT INTO `student` VALUES (10012, '小白', '女', '1996-09-02', '2015-09-02', 3);
INSERT INTO `student` VALUES (10013, '小兰', '女', '1996-09-02', '2015-09-02', 2);
INSERT INTO `student` VALUES (10015, '大龙', '男', '1996-09-02', '2015-09-02', 1);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthYear` date NOT NULL,
  `degree` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称',
  `grade` date NULL DEFAULT NULL COMMENT '入职时间',
  `collegeID` int(11) NOT NULL COMMENT '院系',
  PRIMARY KEY (`userID`) USING BTREE,
  INDEX `collegeID`(`collegeID`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`collegeID`) REFERENCES `college` (`collegeID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1015 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1001, '刘老师', '女', '1990-03-08', '硕士', '副教授', '2015-09-02', 2);
INSERT INTO `teacher` VALUES (1002, '张老师', '男', '1996-09-02', '本科', '普通教师', '2015-09-02', 1);
INSERT INTO `teacher` VALUES (1003, '软老师', '男', '1996-09-02', '硕士', '助教', '2017-07-07', 1);
INSERT INTO `teacher` VALUES (1004, '木老师', '女', '1996-09-02', '本科', '讲师', '2015-09-12', 3);
INSERT INTO `teacher` VALUES (1005, '杨老师', '男', '1996-09-02', '本科', '普通教师', '2015-09-02', 1);
INSERT INTO `teacher` VALUES (1006, '杨雪老师', '女', '1996-09-02', '博士', '副教授', '2015-09-02', 3);
INSERT INTO `teacher` VALUES (1007, '胡老师', '男', '1996-09-02', '本科', '普通教师', '2015-09-02', 1);
INSERT INTO `teacher` VALUES (1008, '雷利老师', '男', '1996-09-02', '硕士', '助教', '2015-09-02', 3);
INSERT INTO `teacher` VALUES (1009, '龙老师', '男', '1996-09-02', '本科', '普通教师', '2015-09-02', 2);
INSERT INTO `teacher` VALUES (1011, '胡老师', '女', '1996-09-02', '本科', '普通教师', '2015-09-02', 2);
INSERT INTO `teacher` VALUES (1012, '李老师', '女', '1996-09-02', '本科', '普通教师', '2015-09-02', 3);
INSERT INTO `teacher` VALUES (1013, '元老师', '女', '1996-09-02', '博士', '副教授', '2015-08-31', 1);
INSERT INTO `teacher` VALUES (1014, '马超老师', '男', '1996-09-02', '博士', '教授', '2015-09-02', 2);

-- ----------------------------
-- Table structure for userlogin
-- ----------------------------
DROP TABLE IF EXISTS `userlogin`;
CREATE TABLE `userlogin`  (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` int(11) NOT NULL DEFAULT 2 COMMENT '角色权限',
  PRIMARY KEY (`userID`) USING BTREE,
  INDEX `role`(`role`) USING BTREE,
  CONSTRAINT `userlogin_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`roleID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of userlogin
-- ----------------------------
INSERT INTO `userlogin` VALUES (1, 'admin', '123', 0);
INSERT INTO `userlogin` VALUES (8, '10001', '12345', 2);
INSERT INTO `userlogin` VALUES (9, '10002', '123', 2);
INSERT INTO `userlogin` VALUES (10, '10003', '123', 2);
INSERT INTO `userlogin` VALUES (11, '10005', '123', 2);
INSERT INTO `userlogin` VALUES (14, '1001', '123', 1);
INSERT INTO `userlogin` VALUES (15, '1002', '123', 1);
INSERT INTO `userlogin` VALUES (16, '1003', '123', 1);
INSERT INTO `userlogin` VALUES (19, '10015', '123', 2);
INSERT INTO `userlogin` VALUES (20, '1013', '123', 1);
INSERT INTO `userlogin` VALUES (21, '10006', '123', 2);
INSERT INTO `userlogin` VALUES (22, '10007', '123', 2);
INSERT INTO `userlogin` VALUES (23, '10009', '123', 2);
INSERT INTO `userlogin` VALUES (24, '1014', '123', 1);
INSERT INTO `userlogin` VALUES (25, '1009', '123', 1);

SET FOREIGN_KEY_CHECKS = 1;
