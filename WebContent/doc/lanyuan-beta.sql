/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : lanyuan-beta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2016-05-06 21:32:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ly_buttom
-- ----------------------------
DROP TABLE IF EXISTS `ly_buttom`;
CREATE TABLE `ly_buttom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `buttom` varchar(200) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_buttom
-- ----------------------------
INSERT INTO `ly_buttom` VALUES ('1', '新增', '<button type=\"button\" id=\"addFun\" class=\"btn btn-primary marR10\">新增</button>', '');
INSERT INTO `ly_buttom` VALUES ('2', '编辑', '<button type=\"button\" id=\"editFun\" class=\"btn btn-info marR10\">编辑</button>', null);
INSERT INTO `ly_buttom` VALUES ('3', '删除', '<button type=\"button\" id=\"delFun\" class=\"btn btn-danger marR10\">删除</button>', null);
INSERT INTO `ly_buttom` VALUES ('4', '上传', '<button type=\"button\" id=\"upLoad\" class=\"btn btn-primary marR10\">上传</button>', null);
INSERT INTO `ly_buttom` VALUES ('5', '下载', '<button type=\"button\" id=\"downLoad\" class=\"btn btn-primary marR10\">下载</button>', null);
INSERT INTO `ly_buttom` VALUES ('6', '上移', '<button type=\"button\" id=\"lyGridUp\" class=\"btn btn-success marR10\">上移</button>', null);
INSERT INTO `ly_buttom` VALUES ('7', '下移', '<button type=\"button\" id=\"lyGridDown\" class=\"btn btn btn-grey marR10\">下移</button>', null);
INSERT INTO `ly_buttom` VALUES ('8', '分配权限', '<button type=\"button\" id=\"permissions\" class=\"btn btn btn-grey marR10\">分配权限</button>', null);

-- ----------------------------
-- Table structure for ly_config
-- ----------------------------
DROP TABLE IF EXISTS `ly_config`;
CREATE TABLE `ly_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `table_colum` varchar(5000) DEFAULT NULL,
  `table_param` varchar(5000) DEFAULT NULL,
  `query_param` varchar(1000) DEFAULT NULL,
  `query_sql` varchar(5000) DEFAULT NULL,
  `last_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_config
-- ----------------------------
INSERT INTO `ly_config` VALUES ('18', 'cecode', '测试配置界面', '/system/config/cecode/public.shtml?resKey=ckey_cecode', '{\"l_column\":{\"0\":{\"colkey\":\"accountName\",\"name\":\"accountName\",\"align\":\"center\",\"width\":\"\",\"renderData\":\"\"},\"1\":{\"colkey\":\"name\",\"name\":\"name\",\"align\":\"center\",\"width\":\"\",\"renderData\":\"\"},\"2\":{\"colkey\":\"locked\",\"name\":\"locked\",\"align\":\"center\",\"width\":\"\",\"renderData\":\"\"},\"3\":{\"colkey\":\"createTime\",\"name\":\"createTime\",\"align\":\"center\",\"width\":\"\",\"renderData\":\"\"}},\"text_renderData\":\"\"}', '{\"code\":\"cecode\",\"name\":\"测试配置界面\",\"checkbox\":\"true\",\"checkValue\":\"id\",\"width\":\"100%\",\"height\":\"100%\",\"usePage\":\"true\",\"pageSize\":\"10\",\"serNumber\":\"false\",\"sql_feild\":\"select * from ly_user where 1=1 <#if locked??>and  locked = #locked# </#if> <#if name??>and  name = #name# </#if>\",\"query_ck\":\"locked\"}', '{\"accountName\":{\"label\":\"accountName\",\"btnId\":\"accountName\",\"btnName\":\"accountName\",\"btnClass\":\"input-small\",\"sel_ck\":\"text_accountName\"},\"name\":{\"label\":\"name\",\"btnId\":\"name\",\"btnName\":\"name\",\"btnClass\":\"input-small\",\"sel_ck\":\"text_name\"},\"locked\":{\"label\":\"locked\",\"btnId\":\"locked\",\"btnName\":\"locked\",\"btnClass\":\"input-small\",\"sel_ck\":\"text_locked\"},\"createTime\":{\"label\":\"createTime\",\"btnId\":\"createTime\",\"btnName\":\"createTime\",\"btnClass\":\"input-small\",\"sel_ck\":\"text_createTime\"}}', 'select * from ly_user where 1=1 <#if locked??>and  locked = #locked# </#if> <#if name??>and  name = #name# </#if>', '2016-05-05 16:47:01');
INSERT INTO `ly_config` VALUES ('19', 'demo', 'demo界面', '/system/config/demo/public.shtml?resKey=ckey_demo', '{\"l_column\":{\"0\":{\"colkey\":\"name\",\"name\":\"名称\",\"align\":\"center\",\"width\":\"\",\"renderData\":\"\"},\"1\":{\"colkey\":\"age\",\"name\":\"年龄\",\"align\":\"center\",\"width\":\"\",\"renderData\":\"\"},\"2\":{\"colkey\":\"des\",\"name\":\"描述\",\"align\":\"center\",\"width\":\"\",\"renderData\":\"\"},\"3\":{\"colkey\":\"createTime\",\"name\":\"时间\",\"align\":\"center\",\"width\":\"\",\"renderData\":\"\"}},\"text_renderData\":\"\"}', '{\"code\":\"demo\",\"name\":\"demo界面\",\"checkbox\":\"false\",\"checkValue\":\"id\",\"width\":\"100%\",\"height\":\"100%\",\"usePage\":\"true\",\"pageSize\":\"5\",\"serNumber\":\"false\",\"sql_feild\":\"select * from test where 1=1 <#if age??>and  age = #age# </#if> <#if name??>and  name = #name# </#if>\",\"query_ck\":\"name\"}', '{\"name\":{\"label\":\"名称\",\"btnId\":\"name\",\"btnName\":\"name\",\"btnClass\":\"input-small\",\"sel_ck\":\"text_name\"},\"age\":{\"label\":\"年龄\",\"btnId\":\"age\",\"btnName\":\"age\",\"btnClass\":\"input-small\",\"sel_ck\":\"text_age\"},\"des\":{\"label\":\"描述\",\"btnId\":\"des\",\"btnName\":\"des\",\"btnClass\":\"input-small\",\"sel_ck\":\"text_des\"},\"createTime\":{\"label\":\"时间\",\"btnId\":\"createTime\",\"btnName\":\"createTime\",\"btnClass\":\"input-small date-picker\",\"sel_ck\":\"time_createTime\"}}', 'select * from test where 1=1 <#if age??>and  age = #age# </#if> <#if name??>and  name = #name# </#if>', '2016-05-05 17:21:36');
INSERT INTO `ly_config` VALUES ('20', 'gg', 'gg', '/system/config/gg/public.shtml?resKey=ckey_gg', '{\"l_column\":{\"0\":{\"colkey\":\"id\",\"name\":\"id\",\"align\":\"center\",\"width\":\"auto\",\"renderData\":\"\"},\"1\":{\"colkey\":\"name\",\"name\":\"name\",\"align\":\"center\",\"width\":\"auto\",\"renderData\":\"\"},\"2\":{\"colkey\":\"accountName\",\"name\":\"accountName\",\"align\":\"center\",\"width\":\"auto\",\"renderData\":\"\"},\"3\":{\"colkey\":\"locked\",\"name\":\"locked\",\"align\":\"center\",\"width\":\"auto\",\"renderData\":\"\"},\"4\":{\"colkey\":\"createTime\",\"name\":\"createTime\",\"align\":\"center\",\"width\":\"auto\",\"renderData\":\"\"}},\"text_renderData\":\"\"}', '{\"code\":\"gg\",\"name\":\"gg\",\"checkbox\":\"true\",\"checkValue\":\"id\",\"width\":\"100%\",\"height\":\"100%\",\"usePage\":\"true\",\"pageSize\":\"8\",\"serNumber\":\"false\",\"sql_feild\":\"select * from ly_user where 1=1 <#if locked??>and  locked = #locked# </#if> <#if name??>and  name = #name# </#if>\",\"query_ck\":\"createTime\"}', '{\"id\":{\"label\":\"id\",\"btnId\":\"id\",\"btnName\":\"id\",\"btnClass\":\"input-small\",\"sel_ck\":\"text_id\"},\"accountName\":{\"label\":\"accountName\",\"btnId\":\"accountName\",\"btnName\":\"accountName\",\"btnClass\":\"input-small\",\"sel_ck\":\"text_accountName\"},\"name\":{\"label\":\"name\",\"btnId\":\"name\",\"btnName\":\"name\",\"btnClass\":\"input-small\",\"sel_ck\":\"text_name\"},\"locked\":{\"label\":\"locked\",\"btnId\":\"locked\",\"btnName\":\"locked\",\"btnClass\":\"input-small\",\"sel_ck\":\"text_locked\"},\"createTime\":{\"label\":\"createTime\",\"btnId\":\"createTime\",\"btnName\":\"createTime\",\"btnClass\":\"input-small\",\"sel_ck\":\"text_createTime\"}}', 'select * from ly_user where 1=1 <#if locked??>and  locked = #locked# </#if> <#if name??>and  name = #name# </#if>', '2016-05-06 13:25:30');
INSERT INTO `ly_config` VALUES ('21', 'userinfo', '客户管理', '/system/config/userinfo/public.shtml', '{\"l_column\":{\"0\":{\"colkey\":\"userName\",\"name\":\"名称\",\"align\":\"center\",\"width\":\"auto\",\"renderData\":\"\"},\"1\":{\"colkey\":\"sex\",\"name\":\"性别\",\"align\":\"center\",\"width\":\"auto\",\"renderData\":\"function(rowindex, data, rowdata, colkey){if(data==0)return \'男\';if(data==1)return \'女\';}\"},\"2\":{\"colkey\":\"address\",\"name\":\"地址\",\"align\":\"center\",\"width\":\"auto\",\"renderData\":\"\"},\"3\":{\"colkey\":\"createTime\",\"name\":\"时间\",\"align\":\"center\",\"width\":\"auto\",\"renderData\":\"function(rowindex, data, rowdata, colkey){return new Date(data).format(\\\"yyyy-MM-dd hh:mm:ss\\\");}\"}},\"text_renderData\":\"return new Date(data).format(\\\"yyyy-MM-dd hh:mm:ss\\\");\"}', '{\"code\":\"userinfo\",\"name\":\"客户管理\",\"checkbox\":\"true\",\"checkValue\":\"id\",\"width\":\"100%\",\"height\":\"100%\",\"usePage\":\"true\",\"pageSize\":\"10\",\"serNumber\":\"false\",\"sql_feild\":\"select * from ly_userinfo where 1=1 <#if userName??>and  userName= #userName# </#if> <#if sex??>and  sex = #sex# </#if><#if createTime??>and  createTime > #createTime# </#if>\",\"query_ck\":\"address\"}', '{\"userName\":{\"label\":\"名称\",\"btnId\":\"userName\",\"btnName\":\"userName\",\"btnClass\":\"input-small\",\"sel_ck\":\"text_userName\"},\"sex\":{\"label\":\"性别\",\"btnId\":\"sex\",\"btnName\":\"sex\",\"btnClass\":\"input-small\",\"in_select\":{\"0\":{\"value\":\"\",\"text\":\"请选择\"},\"1\":{\"value\":\"0\",\"text\":\"男\"},\"2\":{\"value\":\"1\",\"text\":\"女\"}},\"sel_ck\":\"sel_sex\"},\"createTime\":{\"label\":\"时间\",\"btnId\":\"createTime\",\"btnName\":\"createTime\",\"btnClass\":\"input-small date-picker\",\"sel_ck\":\"time_createTime\"}}', 'select * from ly_userinfo where 1=1 <#if userName??>and  userName= #userName# </#if> <#if sex??>and  sex = #sex# </#if><#if createTime??>and  createTime > #createTime# </#if>', '2016-05-06 18:24:39');

-- ----------------------------
-- Table structure for ly_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `ly_dictionary`;
CREATE TABLE `ly_dictionary` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `value` varchar(50) NOT NULL,
  `parent_code` varchar(50) NOT NULL DEFAULT '1000',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_dictionary
-- ----------------------------
INSERT INTO `ly_dictionary` VALUES ('14', 'dd', 'dd', '1000', '2016-05-06 16:07:43', 'd');
INSERT INTO `ly_dictionary` VALUES ('15', '4', '4', 'dd', '2016-05-06 16:07:43', null);
INSERT INTO `ly_dictionary` VALUES ('16', '2', '2', 'dd', '2016-05-06 16:07:43', null);
INSERT INTO `ly_dictionary` VALUES ('17', '4', '4', 'dd', '2016-05-06 16:07:50', null);

-- ----------------------------
-- Table structure for ly_log
-- ----------------------------
DROP TABLE IF EXISTS `ly_log`;
CREATE TABLE `ly_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountName` varchar(30) DEFAULT NULL,
  `module` varchar(30) DEFAULT NULL,
  `methods` varchar(200) DEFAULT NULL,
  `actionTime` varchar(30) DEFAULT NULL,
  `userIP` varchar(30) DEFAULT NULL,
  `operTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_log
-- ----------------------------
INSERT INTO `ly_log` VALUES ('1', '1', '系统管理', '<font color=\"red\">执行方法异常:-->资源管理-新增资源</font>', '0', '127.0.0.1', '2016-05-06 13:15:28', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: com.lanyuan.exception.SystemException: {\"results\":\"error\",\"message\":\"org.springframework.jdbc.BadSqlGrammarException: \r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'insert into ly_resources (level,btn,resUrl,type,resKey,parentId,name)  values (\'\' at line 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into ly_resources (level,btn,resUrl,type,resKey,parentId,name)  values (\'45\',\'addFun,addFun,btn btn-primary marR10,新增\',\'aa\',\'2\',\'ckey_gg_addFun\',\'69\',\'新增\'); insert into ly_resources (level,btn,resUrl,type,resKey,parentId,name)  values (\'46\',\'editFun,editFun,btn btn-info marR10,编辑\',\'aa\',\'2\',\'ckey_gg_editFun\',\'69\',\'编辑\'); insert into ly_resources (level,btn,resUrl,type,resKey,parentId,name)  values (\'47\',\'delFun,delFun,btn btn-danger marR10,删除\',\'aa\',\'2\',\'ckey_gg_delFun\',\'69\',\'删除\')\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'insert into ly_resources (level,btn,resUrl,type,resKey,parentId,name)  values (\'\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'insert into ly_resources (level,btn,resUrl,type,resKey,parentId,name)  values (\'\' at line 1\"}\r\n	at com.lanyuan.logAop.LogAopAction.doBefore(LogAopAction.java:163)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorIm</font>');
INSERT INTO `ly_log` VALUES ('2', '1', '系统管理', '资源管理-新增资源', '107', '127.0.0.1', '2016-05-06 13:16:36', '执行成功!');
INSERT INTO `ly_log` VALUES ('3', '1', '系统管理', '资源管理-新增资源', '7', '127.0.0.1', '2016-05-06 13:18:58', '执行成功!');
INSERT INTO `ly_log` VALUES ('4', '1', '系统管理', '资源管理-新增资源', '26', '127.0.0.1', '2016-05-06 13:20:26', '执行成功!');
INSERT INTO `ly_log` VALUES ('5', '1', '系统管理', '资源管理-新增资源', '6', '127.0.0.1', '2016-05-06 13:22:33', '执行成功!');
INSERT INTO `ly_log` VALUES ('6', '1', '系统管理', '资源管理-新增资源', '9', '127.0.0.1', '2016-05-06 13:25:00', '执行成功!');
INSERT INTO `ly_log` VALUES ('7', '1', '系统管理', '用户管理-新增用户', '70', '127.0.0.1', '2016-05-06 14:22:08', '执行成功!');
INSERT INTO `ly_log` VALUES ('8', '1', '系统管理', '<font color=\"red\">执行方法异常:-->用户管理-修改用户</font>', '0', '127.0.0.1', '2016-05-06 14:22:27', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: org.springframework.dao.DuplicateKeyException: \r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'19-2\' for key \'PRIMARY\'\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into ly_user_role (roleId,userId)  values (?,?)\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'19-2\' for key \'PRIMARY\'\n; SQL []; Duplicate entry \'19-2\' for key \'PRIMARY\'; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'19-2\' for key \'PRIMARY\'\r\n	at com.lanyuan.logAop.LogAopAction.doBefore(LogAopAction.java:163)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)\r\n	at java.lang.reflect.Method.invoke(Method.java:597)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:621)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:610)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:68)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:99)\r\n	at org.springframework.transaction.intercep</font>');
INSERT INTO `ly_log` VALUES ('9', '1', '系统管理', '<font color=\"red\">执行方法异常:-->用户管理-修改用户</font>', '0', '127.0.0.1', '2016-05-06 14:26:08', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: org.springframework.dao.DuplicateKeyException: \r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'19-2\' for key \'PRIMARY\'\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into ly_user_role (roleId,userId)  values (?,?)\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'19-2\' for key \'PRIMARY\'\n; SQL []; Duplicate entry \'19-2\' for key \'PRIMARY\'; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'19-2\' for key \'PRIMARY\'\r\n	at com.lanyuan.logAop.LogAopAction.doBefore(LogAopAction.java:163)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)\r\n	at java.lang.reflect.Method.invoke(Method.java:597)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:621)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:610)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:68)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:99)\r\n	at org.springframework.transaction.intercep</font>');
INSERT INTO `ly_log` VALUES ('10', '1', '系统管理', '用户管理-修改用户', '45', '127.0.0.1', '2016-05-06 14:31:05', '执行成功!');
INSERT INTO `ly_log` VALUES ('11', '1', '系统管理', '角色管理-新增角色', '107', '127.0.0.1', '2016-05-06 14:39:04', '执行成功!');
INSERT INTO `ly_log` VALUES ('12', '1', '系统管理', '<font color=\"red\">执行方法异常:-->角色管理-修改角色</font>', '0', '127.0.0.1', '2016-05-06 14:41:38', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: com.lanyuan.exception.SystemException: {\"results\":\"error\",\"message\":\"com.lanyuan.exception.SystemException: 测试数据是否有回滚!\"}\r\n	at com.lanyuan.logAop.LogAopAction.doBefore(LogAopAction.java:163)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)\r\n	at java.lang.reflect.Method.invoke(Method.java:597)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:621)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:610)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:68)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:653)\r\n	at com.lanyuan.controller.system.RoleController$$EnhancerBySpringCGLIB$$30401e5f.editEntity(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)\r\n	at java.lang.reflect.Method.invoke(Method.java:59</font>');
INSERT INTO `ly_log` VALUES ('13', '1', '系统管理', '<font color=\"red\">执行方法异常:-->角色管理-修改角色</font>', '0', '127.0.0.1', '2016-05-06 14:44:33', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: com.lanyuan.exception.SystemException: {\"results\":\"error\",\"message\":\"com.lanyuan.exception.SystemException: 测试数据是否有回滚!\"}\r\n	at com.lanyuan.logAop.LogAopAction.doBefore(LogAopAction.java:163)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)\r\n	at java.lang.reflect.Method.invoke(Method.java:597)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:621)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:610)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:68)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:653)\r\n	at com.lanyuan.controller.system.RoleController$$EnhancerBySpringCGLIB$$30401e5f.editEntity(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)\r\n	at java.lang.reflect.Method.invoke(Method.java:59</font>');
INSERT INTO `ly_log` VALUES ('14', '1', '系统管理', '角色管理-修改角色', '115', '127.0.0.1', '2016-05-06 14:51:40', '执行成功!');
INSERT INTO `ly_log` VALUES ('15', '1', '系统管理', '角色管理-修改角色', '181', '127.0.0.1', '2016-05-06 14:53:57', '执行成功!');
INSERT INTO `ly_log` VALUES ('16', '1', '系统管理', '角色管理-修改角色', '120', '127.0.0.1', '2016-05-06 14:56:04', '执行成功!');
INSERT INTO `ly_log` VALUES ('17', '1', '系统管理', '角色管理-修改权限', '164', '127.0.0.1', '2016-05-06 15:03:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('18', '1', '系统管理', '角色管理-修改角色', '185', '127.0.0.1', '2016-05-06 15:04:16', '执行成功!');
INSERT INTO `ly_log` VALUES ('19', '1', '系统管理', '用户管理-新增用户', '39', '127.0.0.1', '2016-05-06 15:18:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('20', '1', '系统管理', '用户管理-新增用户', '5', '127.0.0.1', '2016-05-06 15:19:14', '执行成功!');
INSERT INTO `ly_log` VALUES ('21', '1', '系统管理', '资源管理-新增资源', '4', '127.0.0.1', '2016-05-06 15:19:45', '执行成功!');
INSERT INTO `ly_log` VALUES ('22', '1', '系统管理', '资源管理-新增资源', '3', '127.0.0.1', '2016-05-06 15:23:51', '执行成功!');
INSERT INTO `ly_log` VALUES ('23', '1', '系统管理', '资源管理-新增资源', '5', '127.0.0.1', '2016-05-06 15:25:03', '执行成功!');
INSERT INTO `ly_log` VALUES ('24', '1', '系统管理', '资源管理-修改资源', '626', '127.0.0.1', '2016-05-06 15:25:31', '执行成功!');
INSERT INTO `ly_log` VALUES ('25', '1', '系统管理', '字典管理-新增字典', '25028', '127.0.0.1', '2016-05-06 15:33:31', '执行成功!');
INSERT INTO `ly_log` VALUES ('26', '1', '系统管理', '字典管理-修改字典', '347', '127.0.0.1', '2016-05-06 15:33:48', '执行成功!');

-- ----------------------------
-- Table structure for ly_resources
-- ----------------------------
DROP TABLE IF EXISTS `ly_resources`;
CREATE TABLE `ly_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `resKey` varchar(50) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `resUrl` varchar(200) DEFAULT NULL,
  `level` int(4) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `btn` varchar(200) DEFAULT NULL,
  `ishide` int(3) DEFAULT '0',
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_resources
-- ----------------------------
INSERT INTO `ly_resources` VALUES ('1', '系统基础管理', '0', 'system', '0', 'system', '6', 'fa-desktop', null, '0', '系统基础管理');
INSERT INTO `ly_resources` VALUES ('2', '用户管理', '1', 'account', '1', '/system/user/list.shtml', '7', null, null, '0', '用户管理');
INSERT INTO `ly_resources` VALUES ('3', '角色管理', '1', 'role', '1', '/system/role/list.shtml', '11', 'fa-list', null, '0', '角色管理');
INSERT INTO `ly_resources` VALUES ('4', '菜单管理', '1', 'ly_resources', '1', '/system/resources/list.shtml', '16', 'fa-list-alt', null, '0', '菜单管理');
INSERT INTO `ly_resources` VALUES ('5', '新增用户', '2', 'account_add', '2', '/system/user/add.shtml', '8', null, 'addAccount,addAccount,btn btn-primary marR10,新增', '0', '');
INSERT INTO `ly_resources` VALUES ('6', '修改用户', '2', 'account_edit', '2', '/system/user/edit.shtml', '9', null, 'editAccount,editAccount,btn btn-info marR10,编辑', '0', '');
INSERT INTO `ly_resources` VALUES ('7', '删除用户', '2', 'account_delete', '2', '/system/user/deleteByIds.shtml', '10', null, 'delAccount,delAccount,btn btn-danger marR10,删除', '0', '');
INSERT INTO `ly_resources` VALUES ('8', '新增角色', '3', 'role_add', '2', '/system/role/add.shtml', '12', null, 'addrole,addrole,btn btn-primary marR10,新增', '0', '');
INSERT INTO `ly_resources` VALUES ('9', '修改角色', '3', 'role_edit', '2', '/system/role/edit.shtml', '13', null, 'editrole,editrole,btn btn-info marR10,编辑', '0', '');
INSERT INTO `ly_resources` VALUES ('10', '删除角色', '3', 'role_delete', '2', '/system/role/deleteByIds.shtml', '14', null, 'delrole,delrole,btn btn-danger marR10,删除', '0', '');
INSERT INTO `ly_resources` VALUES ('11', '角色受权', '3', 'role_perss', '2', '/resources/permissions.shtml', '15', '无', 'permissions,permissions,btn btn-grey marR10,分配权限', '0', '');
INSERT INTO `ly_resources` VALUES ('25', '登陆信息管理', '0', 'ly_login', '0', 'ly_login', '22', 'fa-calendar', null, '0', '登陆信息管理');
INSERT INTO `ly_resources` VALUES ('26', '用户登录记录', '25', 'ly_log_list', '1', '/list.shtml?page_path=/system/userlogin/list', '23', null, null, '0', null);
INSERT INTO `ly_resources` VALUES ('27', '操作日志管理', '0', 'ly_log', '0', 'ly_log', '24', 'fa-picture-o', null, '1', '操作日志管理');
INSERT INTO `ly_resources` VALUES ('28', '日志查询', '27', 'ly_log', '1', '/list.shtml?page_path=/system/log/list', '25', null, null, '0', null);
INSERT INTO `ly_resources` VALUES ('29', '新增菜单资源', '4', 'ly_resources_add', '2', '/system/resources/add.shtml', '17', null, 'addFun,addFun,btn btn-primary marR10,新增', '0', '');
INSERT INTO `ly_resources` VALUES ('30', '修改菜单资源', '4', 'ly_resources_edit', '2', '/system/resources/edit.shtml', '18', null, 'editFun,editFun,btn btn-info marR10,编辑', '0', '');
INSERT INTO `ly_resources` VALUES ('31', '删除菜单资源', '4', 'ly_resources_delete', '2', '/system/resources/deleteByIds.shtml', '19', null, 'delFun,delFun,btn btn-danger marR10,删除', '0', '');
INSERT INTO `ly_resources` VALUES ('32', '系统监控管理', '0', 'monitor', '0', 'monitor', '26', 'fa-tag', null, '0', '系统监控管理');
INSERT INTO `ly_resources` VALUES ('33', '实时监控', '32', 'sysmonitor', '1', '/system/monitor/monitor.shtml', '27', null, null, '0', '监控管理');
INSERT INTO `ly_resources` VALUES ('35', '数据字典管理', '0', 'dictionary', '0', 'dictionary', '30', 'fa-building', null, '0', '数据字典管理');
INSERT INTO `ly_resources` VALUES ('36', '新增字典', '39', 'dic_add', '2', '/system/dictionary/add.shtml', '32', null, 'addDictionary,addDictionary,btn btn-primary marR10,新增', '0', '新增字典');
INSERT INTO `ly_resources` VALUES ('37', '修改字典', '39', 'dic_edit', '2', '/system/dictionary/edit.shtml', '33', null, 'editDictionary,editDictionary,btn btn-info marR10,编辑', '0', '');
INSERT INTO `ly_resources` VALUES ('38', '删除字典', '39', 'dic_delete', '2', '/system/dictionary/deleteByIds.shtml', '34', null, 'delDictionary,delDictionary,btn btn-danger marR10,删除', '0', '');
INSERT INTO `ly_resources` VALUES ('39', '字典列表', '35', 'dic_list', '0', '/system/dictionary/list.shtml', '31', null, null, '0', '字典列表');
INSERT INTO `ly_resources` VALUES ('40', '告警列表', '32', 'monitor_warn', '1', '/system/monitor/list.shtml', '28', null, null, '0', '告警列表');
INSERT INTO `ly_resources` VALUES ('41', '性能监控', '32', 'sql_mon', '1', '/druid/index.html', '29', null, null, '0', '性能监控');
INSERT INTO `ly_resources` VALUES ('44', '上移', '4', 'sortUpdate', '2', '/system/resources/sortUpdate.shtml', '20', null, 'lyGridUp,lyGridUp,btn btn-success marR10,上移', '0', '上移');
INSERT INTO `ly_resources` VALUES ('45', '下移', '4', 'lyGridDown', '2', '/system/resources/sortUpdate.shtml', '21', null, 'lyGridDown,lyGridDown,btn btn-grey marR10,下移', '0', '下移');
INSERT INTO `ly_resources` VALUES ('46', '测试功能', '0', 'test', '0', 'test', '1', 'fa-behance', null, '0', '测试功能');
INSERT INTO `ly_resources` VALUES ('47', '新增', '50', 'Test_add', '2', '/add.shtml', '3', null, 'addTest,addTest,btn btn-primary marR10,新增', '0', '');
INSERT INTO `ly_resources` VALUES ('48', '修改', '50', 'Test_edit', '2', '/edit.shtml', '4', null, 'editTest,editTest,btn btn-info marR10,编辑', '0', '');
INSERT INTO `ly_resources` VALUES ('49', '删除', '50', 'Test_delete', '2', '/deleteByIds.shtml', '5', null, 'delTest,delTest,btn btn-danger marR10,删除', '0', '');
INSERT INTO `ly_resources` VALUES ('50', 'test表', '46', 'ly_test', '1', '/list.shtml?page_path=/system/test/list', '2', null, null, '0', null);
INSERT INTO `ly_resources` VALUES ('51', '配置管理', '0', 'config_manage', '0', 'config_manage', '35', 'fa-cog', null, '0', '配置管理');
INSERT INTO `ly_resources` VALUES ('52', '配置界面', '51', 'config_view', '1', '/system/config/list.shtml', '36', null, null, '0', '配置界面');
INSERT INTO `ly_resources` VALUES ('61', '测试配置界面', '51', 'ckey_cecode', '1', '/system/config/cecode/public.shtml?resKey=ckey_cecode', '37', null, null, '0', null);
INSERT INTO `ly_resources` VALUES ('62', '新增', '61', 'ckey_cecode_addFun', '2', '/system/config/cecode/public.shtml', '37', null, 'addFun,addFun,btn btn-primary marR10,新增', '0', null);
INSERT INTO `ly_resources` VALUES ('63', '编辑', '61', 'ckey_cecode_editFun', '2', '/system/config/cecode/edit.shtml', '38', null, 'editFun,editFun,btn btn-info marR10,编辑', '0', null);
INSERT INTO `ly_resources` VALUES ('64', '删除', '61', 'ckey_cecode_delFun', '2', '/system/config/cecode/delete.shtml', '39', null, 'delFun,delFun,btn btn-danger marR10,删除', '0', null);
INSERT INTO `ly_resources` VALUES ('65', 'demo界面', '51', 'ckey_demo', '1', '/system/config/demo/public.shtml?resKey=ckey_demo', '41', null, null, '0', null);
INSERT INTO `ly_resources` VALUES ('66', '新增', '65', 'ckey_demo_addFun', '2', '/system/config/demo/add.shtml', '41', null, 'addFun,addFun,btn btn-primary marR10,新增', '0', null);
INSERT INTO `ly_resources` VALUES ('67', '编辑', '65', 'ckey_demo_editFun', '2', '/system/config/demo/edit.shtml', '42', null, 'editFun,editFun,btn btn-info marR10,编辑', '0', null);
INSERT INTO `ly_resources` VALUES ('68', '删除', '65', 'ckey_demo_delFun', '2', '/system/config/demo/delete.shtml', '43', null, 'delFun,delFun,btn btn-danger marR10,删除', '0', null);
INSERT INTO `ly_resources` VALUES ('94', '新增', '93', 'ckey_gg_addFun', '2', 'rfrf', '45', null, 'addFun,addFun,btn btn-primary marR10,新增', '0', null);
INSERT INTO `ly_resources` VALUES ('95', '编辑', '93', 'ckey_gg_editFun', '2', 'rfr', '46', null, 'editFun,editFun,btn btn-info marR10,编辑', '0', null);
INSERT INTO `ly_resources` VALUES ('96', '删除', '93', 'ckey_gg_delFun', '2', 'rfr', '47', null, 'delFun,delFun,btn btn-danger marR10,删除', '0', null);
INSERT INTO `ly_resources` VALUES ('97', '客户管理', '51', 'ckey_userinfo', '1', '/system/config/userinfo/public.shtml?resKey=ckey_userinfo', '48', null, null, '0', null);

-- ----------------------------
-- Table structure for ly_res_role
-- ----------------------------
DROP TABLE IF EXISTS `ly_res_role`;
CREATE TABLE `ly_res_role` (
  `resId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`resId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_res_role
-- ----------------------------
INSERT INTO `ly_res_role` VALUES ('1', '2');
INSERT INTO `ly_res_role` VALUES ('2', '2');
INSERT INTO `ly_res_role` VALUES ('3', '2');
INSERT INTO `ly_res_role` VALUES ('4', '2');
INSERT INTO `ly_res_role` VALUES ('5', '2');
INSERT INTO `ly_res_role` VALUES ('6', '2');
INSERT INTO `ly_res_role` VALUES ('7', '2');
INSERT INTO `ly_res_role` VALUES ('8', '2');
INSERT INTO `ly_res_role` VALUES ('9', '2');
INSERT INTO `ly_res_role` VALUES ('10', '2');
INSERT INTO `ly_res_role` VALUES ('11', '2');
INSERT INTO `ly_res_role` VALUES ('25', '2');
INSERT INTO `ly_res_role` VALUES ('26', '2');
INSERT INTO `ly_res_role` VALUES ('27', '2');
INSERT INTO `ly_res_role` VALUES ('28', '2');
INSERT INTO `ly_res_role` VALUES ('29', '2');
INSERT INTO `ly_res_role` VALUES ('30', '2');
INSERT INTO `ly_res_role` VALUES ('31', '2');
INSERT INTO `ly_res_role` VALUES ('32', '2');
INSERT INTO `ly_res_role` VALUES ('33', '2');
INSERT INTO `ly_res_role` VALUES ('35', '2');
INSERT INTO `ly_res_role` VALUES ('36', '2');
INSERT INTO `ly_res_role` VALUES ('37', '2');
INSERT INTO `ly_res_role` VALUES ('38', '2');
INSERT INTO `ly_res_role` VALUES ('39', '2');
INSERT INTO `ly_res_role` VALUES ('40', '2');
INSERT INTO `ly_res_role` VALUES ('41', '2');
INSERT INTO `ly_res_role` VALUES ('44', '2');
INSERT INTO `ly_res_role` VALUES ('45', '2');
INSERT INTO `ly_res_role` VALUES ('46', '2');
INSERT INTO `ly_res_role` VALUES ('47', '2');
INSERT INTO `ly_res_role` VALUES ('48', '2');
INSERT INTO `ly_res_role` VALUES ('49', '2');
INSERT INTO `ly_res_role` VALUES ('50', '2');
INSERT INTO `ly_res_role` VALUES ('51', '2');
INSERT INTO `ly_res_role` VALUES ('52', '2');
INSERT INTO `ly_res_role` VALUES ('1', '14');
INSERT INTO `ly_res_role` VALUES ('2', '14');
INSERT INTO `ly_res_role` VALUES ('3', '14');
INSERT INTO `ly_res_role` VALUES ('4', '14');
INSERT INTO `ly_res_role` VALUES ('5', '14');
INSERT INTO `ly_res_role` VALUES ('6', '14');
INSERT INTO `ly_res_role` VALUES ('7', '14');
INSERT INTO `ly_res_role` VALUES ('8', '14');
INSERT INTO `ly_res_role` VALUES ('9', '14');
INSERT INTO `ly_res_role` VALUES ('10', '14');
INSERT INTO `ly_res_role` VALUES ('11', '14');
INSERT INTO `ly_res_role` VALUES ('29', '14');
INSERT INTO `ly_res_role` VALUES ('30', '14');
INSERT INTO `ly_res_role` VALUES ('31', '14');
INSERT INTO `ly_res_role` VALUES ('44', '14');
INSERT INTO `ly_res_role` VALUES ('45', '14');
INSERT INTO `ly_res_role` VALUES ('1', '21');
INSERT INTO `ly_res_role` VALUES ('2', '21');
INSERT INTO `ly_res_role` VALUES ('3', '21');
INSERT INTO `ly_res_role` VALUES ('4', '21');
INSERT INTO `ly_res_role` VALUES ('5', '21');
INSERT INTO `ly_res_role` VALUES ('6', '21');
INSERT INTO `ly_res_role` VALUES ('7', '21');
INSERT INTO `ly_res_role` VALUES ('8', '21');
INSERT INTO `ly_res_role` VALUES ('9', '21');
INSERT INTO `ly_res_role` VALUES ('10', '21');
INSERT INTO `ly_res_role` VALUES ('11', '21');
INSERT INTO `ly_res_role` VALUES ('25', '21');
INSERT INTO `ly_res_role` VALUES ('26', '21');
INSERT INTO `ly_res_role` VALUES ('29', '21');
INSERT INTO `ly_res_role` VALUES ('30', '21');
INSERT INTO `ly_res_role` VALUES ('31', '21');
INSERT INTO `ly_res_role` VALUES ('44', '21');
INSERT INTO `ly_res_role` VALUES ('45', '21');
INSERT INTO `ly_res_role` VALUES ('1', '22');
INSERT INTO `ly_res_role` VALUES ('2', '22');
INSERT INTO `ly_res_role` VALUES ('3', '22');
INSERT INTO `ly_res_role` VALUES ('4', '22');
INSERT INTO `ly_res_role` VALUES ('5', '22');
INSERT INTO `ly_res_role` VALUES ('6', '22');
INSERT INTO `ly_res_role` VALUES ('7', '22');
INSERT INTO `ly_res_role` VALUES ('8', '22');
INSERT INTO `ly_res_role` VALUES ('9', '22');
INSERT INTO `ly_res_role` VALUES ('10', '22');
INSERT INTO `ly_res_role` VALUES ('11', '22');
INSERT INTO `ly_res_role` VALUES ('25', '22');
INSERT INTO `ly_res_role` VALUES ('26', '22');
INSERT INTO `ly_res_role` VALUES ('27', '22');
INSERT INTO `ly_res_role` VALUES ('28', '22');
INSERT INTO `ly_res_role` VALUES ('29', '22');
INSERT INTO `ly_res_role` VALUES ('30', '22');
INSERT INTO `ly_res_role` VALUES ('31', '22');
INSERT INTO `ly_res_role` VALUES ('44', '22');
INSERT INTO `ly_res_role` VALUES ('45', '22');
INSERT INTO `ly_res_role` VALUES ('51', '23');
INSERT INTO `ly_res_role` VALUES ('52', '23');
INSERT INTO `ly_res_role` VALUES ('61', '23');
INSERT INTO `ly_res_role` VALUES ('62', '23');
INSERT INTO `ly_res_role` VALUES ('63', '23');
INSERT INTO `ly_res_role` VALUES ('64', '23');
INSERT INTO `ly_res_role` VALUES ('65', '23');
INSERT INTO `ly_res_role` VALUES ('66', '23');
INSERT INTO `ly_res_role` VALUES ('67', '23');
INSERT INTO `ly_res_role` VALUES ('68', '23');
INSERT INTO `ly_res_role` VALUES ('93', '23');
INSERT INTO `ly_res_role` VALUES ('94', '23');
INSERT INTO `ly_res_role` VALUES ('95', '23');
INSERT INTO `ly_res_role` VALUES ('96', '23');

-- ----------------------------
-- Table structure for ly_role
-- ----------------------------
DROP TABLE IF EXISTS `ly_role`;
CREATE TABLE `ly_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `state` varchar(3) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `roleKey` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_role
-- ----------------------------
INSERT INTO `ly_role` VALUES ('2', '1', '管理员', 'admin', '管理系统权限');
INSERT INTO `ly_role` VALUES ('3', '1', '普通角色', 'simple', '普通角色');
INSERT INTO `ly_role` VALUES ('4', '1', '根账号', 'root', '拥有所有权限1');
INSERT INTO `ly_role` VALUES ('23', '1', 'rr', 'rr', 'rr');

-- ----------------------------
-- Table structure for ly_server_info
-- ----------------------------
DROP TABLE IF EXISTS `ly_server_info`;
CREATE TABLE `ly_server_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cpuUsage` varchar(255) DEFAULT NULL,
  `setCpuUsage` varchar(255) DEFAULT NULL,
  `jvmUsage` varchar(255) DEFAULT NULL,
  `setJvmUsage` varchar(255) DEFAULT NULL,
  `ramUsage` varchar(255) DEFAULT NULL,
  `setRamUsage` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `operTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_server_info
-- ----------------------------

-- ----------------------------
-- Table structure for ly_user
-- ----------------------------
DROP TABLE IF EXISTS `ly_user`;
CREATE TABLE `ly_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `accountName` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `credentialsSalt` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `locked` varchar(3) DEFAULT '0',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletestatus` int(1) DEFAULT '0' COMMENT '逻辑删除状态0:存在1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_user
-- ----------------------------
INSERT INTO `ly_user` VALUES ('1', 'admin', 'admin', '78e21a6eb88529eab722793a448ed394', '4157c3feef4a6ed91b2c28cf4392f2d1', '3434', '1', '2016-03-16 10:36:53', '0');
INSERT INTO `ly_user` VALUES ('20', 'adf', 'adfd', '34f228463630d89a65a79eecfe886328', '4b03beb40f3e75d7815fc43ee6d7af40', null, '1', '2016-05-06 15:18:17', '0');
INSERT INTO `ly_user` VALUES ('21', 'fadsfasf', 'adfasfasfdas', '08a06dab99bff65ab76d60bcf5a08951', '7b9a6be391138e93a4ee976062b3d127', null, '1', '2016-05-06 15:19:14', '0');
INSERT INTO `ly_user` VALUES ('22', '444444', '444', '8556e214720ae0c7b3d12325fd385b4f', '4e17e6b67370d9be3c43a0e68996c1c9', '44', '1', '2016-05-06 16:00:59', '0');

-- ----------------------------
-- Table structure for ly_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `ly_userinfo`;
CREATE TABLE `ly_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(40) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_userinfo
-- ----------------------------
INSERT INTO `ly_userinfo` VALUES ('1', 'a', '0', '上海', '10000', 'q', '2016-01-06 18:08:20');
INSERT INTO `ly_userinfo` VALUES ('2', 'b', '1', '北京', '88888', 'e', '2015-05-06 18:08:21');
INSERT INTO `ly_userinfo` VALUES ('3', 'c', '1', '深圳', '33333', 'b', '2016-03-06 18:08:25');
INSERT INTO `ly_userinfo` VALUES ('4', 'd', '1', '广州', '99999', 'g', '2016-05-06 18:08:27');

-- ----------------------------
-- Table structure for ly_userlogin
-- ----------------------------
DROP TABLE IF EXISTS `ly_userlogin`;
CREATE TABLE `ly_userlogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `accountName` varchar(20) DEFAULT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `loginIP` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_user_loginlist` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_userlogin
-- ----------------------------
INSERT INTO `ly_userlogin` VALUES ('94', '1', 'admin', '2016-05-05 17:42:42', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('95', '1', 'admin', '2016-05-05 17:48:05', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('96', '1', 'admin', '2016-05-05 17:48:34', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('97', '1', 'admin', '2016-05-06 12:59:25', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('98', '1', 'admin', '2016-05-06 13:04:08', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('99', '1', 'admin', '2016-05-06 13:07:15', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('100', '1', 'admin', '2016-05-06 13:13:21', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('101', '1', 'admin', '2016-05-06 13:16:31', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('102', '1', 'admin', '2016-05-06 14:06:18', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('103', '1', 'admin', '2016-05-06 14:21:40', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('104', '1', 'admin', '2016-05-06 14:25:38', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('105', '1', 'admin', '2016-05-06 14:30:23', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('106', '1', 'admin', '2016-05-06 14:38:24', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('107', '1', 'admin', '2016-05-06 14:41:21', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('108', '1', 'admin', '2016-05-06 14:51:15', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('109', '1', 'admin', '2016-05-06 14:53:44', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('110', '1', 'admin', '2016-05-06 14:55:54', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('111', '1', 'admin', '2016-05-06 15:03:33', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('112', '1', 'admin', '2016-05-06 15:17:45', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('113', '1', 'admin', '2016-05-06 15:28:31', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('114', '1', 'admin', '2016-05-06 15:32:54', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('115', '1', 'admin', '2016-05-06 15:58:54', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('116', '1', 'admin', '2016-05-06 16:05:50', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('117', '1', 'admin', '2016-05-06 16:12:04', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('118', '1', 'admin', '2016-05-06 16:47:23', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('119', '1', 'admin', '2016-05-06 18:11:48', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('120', '1', 'admin', '2016-05-06 19:11:04', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('121', '1', 'admin', '2016-05-06 19:12:47', '127.0.0.1');

-- ----------------------------
-- Table structure for ly_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ly_user_role`;
CREATE TABLE `ly_user_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_user_role
-- ----------------------------
INSERT INTO `ly_user_role` VALUES ('1', '2');
INSERT INTO `ly_user_role` VALUES ('1', '14');
INSERT INTO `ly_user_role` VALUES ('1', '22');
INSERT INTO `ly_user_role` VALUES ('19', '2');
INSERT INTO `ly_user_role` VALUES ('20', '4');
INSERT INTO `ly_user_role` VALUES ('20', '23');
INSERT INTO `ly_user_role` VALUES ('21', '3');
INSERT INTO `ly_user_role` VALUES ('22', '4');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('12', '123', '123', '123', '2016-05-06 16:47:36');
