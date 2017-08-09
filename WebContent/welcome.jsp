<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />

<meta name="description" content="overview &amp; stats" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
	<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/ace/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/ace/assets/css/font-awesome.css" />

		<!-- page specific plugin styles -->

		<!-- text fonts -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/ace/assets/css/ace-fonts.css" />
</head>

<body class="no-skin">
	<div id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<!-- #section:basics/sidebar -->

		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<!-- #section:basics/content.breadcrumbs -->

				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">
					<div class="alert alert-warning alert-block">
						<table>
							<tr>
								<td><div class="topBtn" style="font-size: 15px;">

										关于此版本的说明：
										<div style="padding-left: 20px;">
											一大亮点：
											<div style="padding-left: 20px; color: red;">
												采用最新的技术流行框架：springMVC4.1.4+shiro1.2.3+spring4.x+Mybaits3.2.8+Ajax+html5<br>
											</div>
											二大亮点:
											<div style="padding-left: 20px; color: red;">
												对于基本的,增.删.改.查/分页的sql，<font color="blue">不需要手动写任何的ｓｑｌ语句</font>，直接调用，用到的技术，<font
													color="blue"> ｊａｖａ自定义注解 annotation, ｊａｖａ的反射机制处理</font>
											</div>

											spring4.x的新特性请看：
											<div style="padding-left: 20px; color: blue;">
												http://jinnianshilongnian.iteye.com/blog/1989381</div>
										</div>
										<div style="padding-left: 20px;">
											说明：
											<div style="padding-left: 20px;">
												这个版本主要是对原有的蓝缘系统更换UI界面,功能上基本一致, 但此还在开发当中.....
												关于以前版本,不再维护,致力于新版本的开发和维护..</div>
											优化：
											<div
												style="padding-left: 20px; color: blue; padding-top: 10px;">
												封装好 baseMapper..服务层，持久层统一调用,大大减少代码开发时间.
												对于基本的,增.删.改.查/分页的sql，不需要手动写任何的ｓｑｌ语句，直接调用，用到的技术， ｊａｖａ自定义注解
												annotation, ｊａｖａ的反射机制处理</div>
											<div
												style="padding-left: 20px; color: blue; padding-top: 10px;">
												spring4.x的强类型注解，泛型限定式依赖注入</div>
											<div style="padding-left: 20px; padding-top: 10px;">
												用mapper来代替dao,由mybaits自动管理各事务的操作,大大减少代码开发时间.</div>
											<div
												style="padding-left: 20px; color: red; padding-top: 10px;">
												3.0版本不再使用spring Security3权限安全机制,采用了shiro权限机制, 为何愿意使用Apache
												Shiro？请看：http://www.infoq.com/cn/articles/apache-shiro</div>
											技术要点：
											<div style="padding-left: 20px;">
												1 ：表格采用ajax+js分页,表格lyGrid分页插件是自己写的,有点模仿ligerui的分页实现 <br>
												2：列表的表头固定,兼容IE,firefox,google,360的浏览器,其他暂没有测试.<br>
												3：采用了shiro权限机制，权限控制到按扭级别, 为何愿意使用Apache
												Shiro？请看：http://www.infoq.com/cn/articles/apache-shiro<br>
												4:<font color="blue">扩展了bootbox弹窗插件，增加两个属性，isclose
													是否自动关闭弹窗，width 自定义弹窗宽度</font><br> 5：<font color="red">自定义mybaits分页插件，不需要手写分页实现</font><br>
												7：<font color="red">封装好baseMapper.接口层，持久层统一调用
													,对于基本的,增.删.改.查/分页的sql，不需要手动写任何的ｓｑｌ语句，直接调用，用到的技术，<font
													color="blue"> ｊａｖａ自定义注解 annotation, ｊａｖａ的反射机制处理</font>
												</font><br> 8：<font color="blue">新增支持oracle分页实现</font><br>
												9：<font color="blue">新增支持SQLserver2008分页实现</font><br>
												10：<font color="blue">解决分页参数没法传到后台的问题</font><br> 11：<font
													color="blue">异常统一处理</font><br> 12：<font color="blue">springAop操作日志记录，可配置记录到执行的Ｓql语句,采用自定义注解实现</font><br>
												13：........<br>
											</div>
										</div>
									</div></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>