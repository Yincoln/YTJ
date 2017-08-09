package com.lanyuan.logAop;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.xmlbeans.impl.util.Base64;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.entity.LogFormMap;
import com.lanyuan.service.base.BaseService;
import com.lanyuan.util.Common;
import com.lanyuan.util.JsonUtils;

/**
 * 切点类
 * 
 * @author lanyuan
 * @since 2016-04-05 Pm 20:35
 * @version 1.0
 */
@Aspect
@Component
public class LogAopAction {
	// 本地异常日志记录对象
	private static final Logger logger = LoggerFactory.getLogger(LogAopAction.class);

	@Inject
	private BaseService baseService ;

	// Controller层切点
	@Pointcut("@annotation(com.lanyuan.annotation.SystemLog)")
	public void controllerAspect() {
	}

	/**
	 * 操作异常记录
	 * 
	 * @descript
	 * @param point
	 * @param e
	 * @author lanyuan
	 * @date 2015年5月5日
	 * @version 1.0
	 */
	@AfterThrowing(pointcut = "controllerAspect()", throwing = "e")
	public void doAfterThrowing(JoinPoint point, Throwable e) {
		Map<String, Object> map = null;
		String user = null;
		String ip = null;
		try {
			ip = SecurityUtils.getSubject().getSession().getHost();
		} catch (Exception ee) {
			ip = "无法获取登录用户Ip";
		}
		try {
			map = getControllerMethodDescription(point);
			// 登录名
			user = Common.findUserSessionId();
			if (Common.isEmpty(user)) {
				user = "无法获取登录用户信息！";
			}
		} catch (Exception ee) {
			user = "无法获取登录用户信息！";
		}
		try {
			String ee = ExceptionUtils.getFullStackTrace(e);
			if (ee.length() > 1900) {
				ee = ee.substring(0, 1900);
			}
			LogFormMap logForm = new LogFormMap();
			logForm.put("accountName", user);
			logForm.put("module", map.get("module"));
			logForm.put("methods", "<font color=\"red\">执行方法异常:-->" + map.get("methods") + "</font>");
			logForm.put("description", "<font color=\"red\">执行方法异常:-->" + ee + "</font>");
			logForm.put("actionTime", "0");
			logForm.put("userIP", ip);
			SecurityUtils.getSubject().getSession().setAttribute("logForm", logForm);
		} catch (Exception e1) {
			// 记录本地异常日志
			logger.error("==== doAfterThrowing 通知异常====");
			logger.error("异常信息:{}", e.getMessage());
		}
	}

	public static void main(String[] args) {
		try {
			Map<String, Object> logForm = new HashMap<String, Object>();
			logForm.put("methods", "<font color=\"red\">执行方法异常:--></font>");
			logForm.put("description", "<font color=\"red\">执行方法异常:--></font>");
			logForm.put("actionTime", "0");
			String json = JsonUtils.mapToJson(logForm);
			logForm = new HashMap<String, Object>();
			String s = new String(Base64.encode(json.getBytes("UTF-8")), "UTF-8");
			logger.info(s);
			logForm.put("logForm", s);
			logger.info(new String(Base64
					.decode("eyJtZXRob2RzIjoi55So5oi3566h55CGLeaWsOWinueUqOaItyIsIm1vZHVsZSI6Iuezu+e7n+euoeeQhiIsImFjY291bnROYW1lIjoiOSIsInVzZXJJUCI6IjEyNy4wLjAuMSIsImRlc2NyaXB0aW9uIjoi5omn6KGM5oiQ5YqfISIsImFjdGlvblRpbWUiOiIyNjAifQ=="
							.getBytes()),
					"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

	}

	/**
	 * 前置通知 用于拦截Controller层记录用户的操作
	 *
	 * @param joinPoint
	 *            切点
	 */
	@Around("controllerAspect()")
	public Object doBefore(ProceedingJoinPoint point) {
		// 执行方法名
		String methodName = point.getSignature().getName();
		String className = point.getTarget().getClass().getSimpleName();
		Object result = null;
		Map<String, Object> map = null;
		String user = null;
		Long start = 0L;
		Long end = 0L;
		Long time = 0L;
		String ip = null;
		try {
			ip = SecurityUtils.getSubject().getSession().getHost();
		} catch (Exception ee) {
			ip = "无法获取登录用户Ip";
		}
		try {
			map = getControllerMethodDescription(point);
			// 登录名
			user = Common.findUserSessionId();
			if (Common.isEmpty(user)) {
				user = "无法获取登录用户信息！";
			}
		} catch (Exception ee) {
			user = "无法获取登录用户信息！";
		}
		// 当前用户
		try {
			map = getControllerMethodDescription(point);
			// 执行方法所消耗的时间
			start = System.currentTimeMillis();
			result = point.proceed();
			end = System.currentTimeMillis();
			time = end - start;
		} catch (Throwable e) {
			throw new RuntimeException(e);
		}
		try {
			LogFormMap logForm = new LogFormMap();
			logForm.put("accountName", user);
			logForm.put("module", map.get("module"));
			logForm.put("methods", map.get("methods"));
			logForm.put("description", map.get("description"));
			logForm.put("actionTime", time.toString());
			logForm.put("userIP", ip);
			baseService.addEntity(logForm);
			// *========控制台输出=========*//
			logger.info("===== doBefore  通知开始=====");
			logger.info("请求方法:" + className + "." + methodName + "()");
			logger.info("方法描述:" + map);
			logger.info("请求IP:" + ip);
			logger.info("=====  doBefore  通知结束=====");
		} catch (Exception e) {
			// 记录本地异常日志
			logger.error("==== doBefore 通知异常====");
			logger.error("异常信息:{}", e.getMessage());
		}
		return result;
	}

	/**
	 * 获取注解中对方法的描述信息 用于Controller层注解
	 *
	 * @param joinPoint
	 *            切点
	 * @return 方法描述
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	public Map<String, Object> getControllerMethodDescription(JoinPoint joinPoint) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String targetName = joinPoint.getTarget().getClass().getName();
		String methodName = joinPoint.getSignature().getName();
		Object[] arguments = joinPoint.getArgs();
		Class targetClass = Class.forName(targetName);
		Method[] methods = targetClass.getMethods();
		for (Method method : methods) {
			if (method.getName().equals(methodName)) {
				Class[] clazzs = method.getParameterTypes();
				if (clazzs.length == arguments.length) {
					map.put("module", method.getAnnotation(SystemLog.class).module());
					map.put("methods", method.getAnnotation(SystemLog.class).methods());
					String de = method.getAnnotation(SystemLog.class).description();
					if (Common.isEmpty(de))
						de = "执行成功!";
					map.put("description", de);
					break;
				}
			}
		}
		return map;
	}
}
