package com.lanyuan.service.base;

import java.util.List;
import java.util.Map;


/**
 * 所有服务接口都要继承这个
 * @author lanyuan
 * @date 2016-05-15
 * @Email: mmm333zzz520@163.com
 * @version 4.1v
 * @param 
 */
public interface BaseService{
	
	/**
	 * 1：返回是一个List<T>集合<br/>
	 * 2：调用findByPage接口,必须传入PageView对象! formMap.set("paging", pageView);<br/>
	 * 3：根据多字段分页查询 <br/>
	 * 4：如果是多个id,用","组成字符串. <br/>
	 * 5：formMap.put("id","xxx") 或 formMap.put("id","xxx,xxx,xxx")  <br/>
	 * 6：formMap.put("name","xxx") 或 formMap.put("name","xxx,xxx,xxx")  <br/>
	 * 7：兼容模糊查询。 formMap.put("name","用户%") 或 formMap.put("name","%用户%") <br/>
	 * 8：兼容排序查询 : formMap.put("$orderby","order by id desc");  <br/>
	 * <b>9 ：默认 formMap.put("mapper_id","baseMapper.findByPage")<br/></b>
	 * <b>10：如果自定义分页的Sql 必须传入 <br/></b>
	 *   <b>formMap.put("mapper_id","xxx.xxxx"); <br/></b>
	 *    <b>xxx.xxxx表示某个xxx-mapper.xml 的 namespace和sqlId <br/></b>
	 * <b>如 user-mapper.xml中。 namespace="userMapper" ,<br/></b>
	 *    <b>其中的你查询sql是对应的  &lt;select id="findByPage"...>....</select> 其中 id = findByPage 这个就是sqlid <br/></b>
	 * <b>那么参数必须是  formMap.put("mapper_id","userMapper.findByPage");<br/></b>
	 * <b>author：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplanyuan</b><br/>
	 * <b>date：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2016-05-26</b><br/>
	 * <b>version：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp4.1v</b>
	 * 
	 * @return <T> List<T>
	 */
	public <T> List<T> findByPage(T formMap);

	/**
	 * 1：返回所有数据,如果有条件则以下传入<br/>
	 * 2：如果是多个id,用","组成字符串. <br/>
	 * 3：formMap.put("id","xxx") 或 formMap.put("id","xxx,xxx,xxx")  <br/>
	 * 4：formMap.put("name","xxx") 或 formMap.put("name","xxx,xxx,xxx")  <br/>
	 * 5：兼容模糊查询。 formMap.put("name","用户%") 或 formMap.put("name","%用户%") <br/>
	 * 6：兼容排序查询 : formMap.put("$orderby","order by id desc");  <br/>
	 * <b>9 ：默认 formMap.put("mapper_id","baseMapper.findByList")<br/></b>
	 * <b>10：如果自定义的Sql 必须传入 <br/></b>
	 *   <b>formMap.put("mapper_id","xxx.xxxx"); <br/></b>
	 *    <b>xxx.xxxx表示某个xxx-mapper.xml 的 namespace和sqlId <br/></b>
	 * <b>如 user-mapper.xml中。 namespace="userMapper" ,<br/></b>
	 *    <b>其中的你查询sql是对应的  &lt;select id="findByList"...>....</select> 其中 id = findByList 这个就是sqlid <br/></b>
	 * <b>那么参数必须是  formMap.put("mapper_id","userMapper.findByList");<br/></b>
	 * <b>author：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplanyuan</b><br/>
	 * <b>date：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2016-05-26</b><br/>
	 * <b>version：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp4.1v</b>
	 * 
	 * @return List<T>
	 * @throws Exception
	 */
	public <T> List<T> findByAll(T formMap);

	/**
	 * 1：根据ID删除数据<br/>
	 * 2：formMap.put("id","xxx") <br/>
	 * 3：如果传入的参数是formMap.put("id","xxx,xxx,xxx") 方法<br/>
	 * <b>4 ：默认 formMap.put("mapper_id","baseMapper.delete")<br/></b>
	 * <b>5：如果自定义删除的Sql 必须传入 <br/></b>
	 *    <b>formMap.put("mapper_id","xxx.xxxx"); <br/></b>
	 *   <b> xxx.xxxx表示某个xxx-mapper.xml 的 namespace和sqlId <br/></b>
	 * <b>如 user-mapper.xml中。 namespace="userMapper" ,<br/></b>
	 *    <b>其中的你查询sql是对应的 <delete id="delete"...>....</delete> 其中 id = delete 这个就是sqlid <br/></b>
	 * <b>那么参数必须是  formMap.put("mapper_id","userMapper.delete");</b>
	 * <b>author：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplanyuan</b><br/>
	 * <b>date：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2016-05-26</b><br/>
	 * <b>version：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp4.1v</b>
	 * 
	 * @return Integer
	 * @throws Exception
	 */
	public <T> void deleteByIds(T formMap) throws Exception;
	
	/**
	 * 1：findById 根据ID返回单个对象,不允许传入多个ID值,如多个值请使用 findByIds <br/>
	 * 2：formMap.put("id","xxx") <br/>
	 * 3：如果传入的参数是formMap.put("id","xxx,xxx,xxx") 请使用 findByIds 方法<br/>
	 * <b>4 ：默认 formMap.put("mapper_id","baseMapper.findById")<br/></b>
	 * <b>5：如果自定义的Sql 必须传入 <br/></b>
	 *   <b>formMap.put("mapper_id","xxx.xxxx"); <br/></b>
	 *    <b>xxx.xxxx表示某个xxx-mapper.xml 的 namespace和sqlId <br/></b>
	 * <b>如 user-mapper.xml中。 namespace="userMapper" ,<br/></b>
	 *    <b>其中的你查询sql是对应的  &lt;select id="findById"...>....</select> 其中 id = findById 这个就是sqlid <br/></b>
	 * <b>那么参数必须是  formMap.put("mapper_id","userMapper.findById");<br/></b>
	 * <b>author：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplanyuan</b><br/>
	 * <b>date：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2016-05-26</b><br/>
	 * <b>version：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp4.1v</b>
	 * 
	 * @return Integer
	 * @throws Exception
	 */
	public <T> T findById(T formMap) throws Exception;
	
	/**
	 * 1：findByIds根据多个ID返回对象集合<br/>
	 * 2：如果是多个id,用","组成字符串. <br/>
	 * 3：formMap.put("id","xxx,xxx,xxx")  <br/>
	 * <b>4 ：默认 formMap.put("mapper_id","baseMapper.findByIds")<br/></b>
	 * <b>5：如果自定义的Sql 必须传入 <br/></b>
	 *   <b>formMap.put("mapper_id","xxx.xxxx"); <br/></b>
	 *    <b>xxx.xxxx表示某个xxx-mapper.xml 的 namespace和sqlId <br/></b>
	 * <b>如 user-mapper.xml中。 namespace="userMapper" ,<br/></b>
	 *    <b>其中的你查询sql是对应的  &lt;select id="findByIds"...>....</select> 其中 id = findByIds 这个就是sqlid <br/></b>
	 * <b>那么参数必须是  formMap.put("mapper_id","userMapper.findByIds");<br/></b>
	 * <b>author：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplanyuan</b><br/>
	 * <b>date：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2016-05-26</b><br/>
	 * <b>version：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp4.1v</b>
	 * 
	 * @return Integer
	 * @throws Exception
	 */
	public <T> List<T> findByIds(T formMap) throws Exception;

	/**
	 * 1：更新数据<br/>
	 * <b>2：如果自定义修改的Sql 必须传入 <br/></b>
	 *    <b>formMap.put("mapper_id","xxx.xxxx"); <br/></b>
	 *    <b>xxx.xxxx表示某个xxx-mapper.xml 的 namespace和sqlId <br/></b>
	 * <b>如 user-mapper.xml中。 namespace="userMapper" ,<br/></b>
	 *    <b>其中的你查询sql是对应的 <update id="editEntity"...>....</update> 其中 id = editEntity 这个就是sqlid <br/></b>
	 * <b>那么前端参数必须是 formMap.put("mapper_id","userMapper.editEntity") <br/>
	 * <b>author：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplanyuan</b><br/>
	 * <b>date：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2016-05-26</b><br/>
	 * <b>version：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp4.1v</b>
	 * 
	 * @return Integer
	 * @throws Exception
	 */
	public <T> void editEntity(T formMap) throws Exception;

	/**
	 * 1：保存数据,保存数据后返回子类对象的所有数据包括id<br/>
	 * 默认 formMap.put("mapper_id","baseMapper.addEntity");<br/>
	 * 
	 * <b>2：如果自定义插入的Sql 必须传入 <br/>
	 *    formMap.put("mapper_id","xxx.xxxx"); <br/>
	 *    xxx.xxxx表示某个xxx-mapper.xml 的 namespace和sqlId <br/>
	 * 如 user-mapper.xml中。 namespace="userMapper" ,
	 *    其中的你查询sql是对应的 <insert id="addEntity"...>....</insert> 其中 id = addEntity 这个就是sqlid <br/>
	 * 那么参数必须是  formMap.put("mapper_id","userMapper.addEntity");
	 * @param formMap 数据库表对应的实体类<br/></b>
	 * <b>author：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplanyuan</b><br/>
	 * <b>date：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2016-05-26</b><br/>
	 * <b>version：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp4.1v</b>
	 * @return formMap
	 * @throws Exception
	 */
	public <T> void addEntity(T formMap) throws Exception;
	
	
	/**
	 * 1：自定义where查询条件,返回是一个List<T<?, ?>>集合<br/>
	 * 2：返回查询条件数据,如不传入.则返回所有数据..如果附加条件.如下 <br/>
	 * 3：formMap.put('where","id=XX and name= XX order by XX") <br/>
	 * <b>author：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplanyuan</b><br/>
	 * <b>date：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2016-05-26</b><br/>
	 * <b>version：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp4.1v</b>
	 * 
	 * @return List<T>
	 */
	public <T> List<T> findByWhere(T formMap);
	
	/**
	 * 1：批量保存数据,如果是mysql,在驱动连接加上&allowMultiQueries=true这个参数 <br/>
	 * <b>author：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplanyuan</b><br/>
	 * <b>date：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2016-05-26</b><br/>
	 * <b>version：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp4.1v</b>
	 * 
	 * @throws Exception
	 */
	public <T> void batchSave(List<T> formMap) throws Exception;
	
	/**
	 * 1：批量更新数据,如果是mysql,在驱动连接加上&allowMultiQueries=true这个参数 <br/>
	 * <b>author：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplanyuan</b><br/>
	 * <b>date：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2016-05-26</b><br/>
	 * <b>version：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp4.1v</b>
	 * 
	 * @throws Exception
	 */
	//public <T> void batchUpdate(List<T> formMap) throws Exception;
	
	/**
	 * 2：如果是多个id值,用","组成字符串. <br/>
	 * 3：formMap.put("id","xxx") 或 formMap.put("id","xxx,xxx,xxx")<br/>
	 * 4：formMap.put("name","xxx") 或 formMap.put("name","xxx,xxx,xxx") <br/>
	 * <b>5 ：默认 formMap.put("mapper_id","baseMapper.deleteByNames")<br/></b>
	 * <b>6：如果自定义的Sql 必须传入 <br/></b>
	 *   <b>formMap.put("mapper_id","xxx.xxxx"); <br/></b>
	 *    <b>xxx.xxxx表示某个xxx-mapper.xml 的 namespace和sqlId <br/></b>
	 * <b>如 user-mapper.xml中。 namespace="userMapper" ,<br/></b>
	 *    <b>其中的你查询sql是对应的  &lt;delete id="deleteByNames"...>....</delete> 其中 id = deleteByNames 这个就是sqlid <br/></b>
	 * <b>那么参数必须是  formMap.put("mapper_id","userMapper.deleteByNames");<br/></b>
	 * <b>author：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplanyuan</b><br/>
	 * <b>date：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2016-05-26</b><br/>
	 * <b>version：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp4.1v</b>
	 * 
	 * @throws Exception
	 */
	public <T> void deleteByNames(T formMap) throws Exception;
	
	/**
	 * 2：如果是多个id值,用","组成字符串. <br/>
	 * 3：formMap.put("id","xxx") 或 formMap.put("id","xxx,xxx,xxx")<br/>
	 * 4：formMap.put("name","xxx") 或 formMap.put("name","xxx,xxx,xxx") <br/>
	 * <b>5 ：默认 formMap.put("mapper_id","baseMapper.findByNames")<br/></b>
	 * <b>6：如果自定义的Sql 必须传入 <br/></b>
	 *   <b>formMap.put("mapper_id","xxx.xxxx"); <br/></b>
	 *    <b>xxx.xxxx表示某个xxx-mapper.xml 的 namespace和sqlId <br/></b>
	 * <b>如 user-mapper.xml中。 namespace="userMapper" ,<br/></b>
	 *    <b>其中的你查询sql是对应的  &lt;select id="findByNames"...>....</select> 其中 id = findByNames 这个就是sqlid <br/></b>
	 * <b>那么参数必须是  formMap.put("mapper_id","userMapper.findByNames");<br/></b>
	 * <b>author：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplanyuan</b><br/>
	 * <b>date：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2016-05-26</b><br/>
	 * <b>version：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp4.1v</b>
	 * 
	 */
	public <T> List<T> findByNames(T formMap);
	
	/**
	 * 1：返回一条记录<br/>
	 * 2：如果是多个id值,用","组成字符串. <br/>
	 * 3：formMap.put("id","xxx") 或 formMap.put("id","xxx,xxx,xxx")<br/>
	 * 4：formMap.put("name","xxx") 或 formMap.put("name","xxx,xxx,xxx") <br/>
	 * <b>5 ：默认 formMap.put("mapper_id","baseMapper.findbyFrist")<br/></b>
	 * <b>6：如果自定义的Sql 必须传入 <br/></b>
	 *   <b>formMap.put("mapper_id","xxx.xxxx"); <br/></b>
	 *    <b>xxx.xxxx表示某个xxx-mapper.xml 的 namespace和sqlId <br/></b>
	 * <b>如 user-mapper.xml中。 namespace="userMapper" ,<br/></b>
	 *    <b>其中的你查询sql是对应的  &lt;select id="findbyFrist"...>....</select> 其中 id = findbyFrist 这个就是sqlid <br/></b>
	 * <b>那么参数必须是  formMap.put("mapper_id","userMapper.findbyFrist");<br/></b>
	 * <b>author：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplanyuan</b><br/>
	 * <b>date：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2016-05-26</b><br/>
	 * <b>version：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp4.1v</b>
	 * 
	 */
	public <T> T findbyFrist(T formMap) ;
	
	/**
	 * 1：根据某个字段查询数据，返回一个对象，如果返回多个值，则异常 <br/>
	 * Class<T> clazz 要查询的实体类。例如 clazz = UserFormMap.class
	 * <b>author：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplanyuan</b><br/>
	 * <b>date：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2016-05-26</b><br/>
	 * <b>version：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp4.1v</b>
	 */
	public <T> T findbyFrist(String key,String value,Class<T> clazz);
	
	/**
	 * 1：根据某个字段查询数据 <br/>
	 * Class<T> clazz 要查询的实体类。例如 clazz = UserFormMap.class
	 * <b>author：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplanyuan</b><br/>
	 * <b>date：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2016-05-26</b><br/>
	 * <b>version：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp4.1v</b>
	 * 
	 * @return <T> List<T>
	 */
	public <T> List<T> findByAttribute(String key, String value, Class<T> clazz);

	/**
	 * 1：根据某个字段删除数据 <br/>
	 * Class<T> clazz 要删除的实体类。例如 clazz = UserFormMap.class
	 * <b>author：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplanyuan</b><br/>
	 * <b>date：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2016-05-26</b><br/>
	 * <b>version：</b><br/>
	 * <b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp4.1v</b>
	 * 
	 * @throws Exception
	 */
	public void deleteByAttribute(String key, String value, Class<?> clazz) throws Exception;

	
	List<Map<String, Object>> initTableField(Map<String, Object> tm);
}
