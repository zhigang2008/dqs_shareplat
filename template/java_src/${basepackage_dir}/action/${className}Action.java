<#include "/custom.include">
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
<#assign actionExtension = "do">
package ${basepackage}.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.steven.core.vo.query.ModuleQuery;
import com.steven.framework.common.beanutils.BeanUtils;
import com.steven.framework.core.page.Page;

import com.opensymphony.xwork2.Preparable;
import com.opensymphony.xwork2.ModelDriven;

<#include "/java_imports.include">

public class ${className}Action extends BaseStruts2Action implements Preparable,ModelDriven{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	/**服务管理*/
	private ${className}Manager ${classNameLower}Manager;
	/**Model对象*/
	private ${className} ${classNameLower};
	
	<#list table.compositeIdColumns as column>
	/**对象ID*/
	${column.javaType} id = null;
	</#list>
	/**批量操作对象ID*/
	private String[] items;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.Preparable#prepare()
	 */
	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			${classNameLower} = new ${className}();
		} else {
			${classNameLower} = (${className})${classNameLower}Manager.getById(id);
		}
	}
	
	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
	public void set${className}Manager(${className}Manager manager) {
		this.${classNameLower}Manager = manager;
	}	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ModelDriven#getModel()
	 */
	public Object getModel() {
		return ${classNameLower};
	}
	
	<#list table.compositeIdColumns as column>
	public void set${column.columnName}(${column.javaType} val) {
		this.id = val;
	}
	</#list>	

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		${className}Query query = newQuery(${className}Query.class,DEFAULT_SORT_COLUMNS);
		Page page = ${classNameLower}Manager.findPage(query);
		savePage(page,query);
		return LIST_JSP;
	}
	
	/** 查看对象*/
	public String show() {
		return SHOW_JSP;
	}
	
	/** 进入新增页面*/
	public String create() {
		return CREATE_JSP;
	}
	
	/** 保存新增对象 */
	public String save() {
		${classNameLower}Manager.save(${classNameLower});
		return LIST_ACTION;
	}
	
	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}
	
	/**保存更新对象*/
	public String update() {
		${classNameLower}Manager.update(this.${classNameLower});
		return LIST_ACTION;
	}
	
	/**删除对象*/
	public String delete() {
		for(int i = 0; i < items.length; i++) {
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			<#if table.compositeId>
			${className}Id id = (${className}Id)copyProperties(${className}Id.class,params);
			<#else>
				<#list table.compositeIdColumns as column>
			${column.javaType} id = new ${column.javaType}((String)params.get("${column.columnNameLower}"));
				</#list>
			</#if>
			${classNameLower}Manager.removeById(id);
		}

		return LIST_ACTION;
	}
	
	/**报表导出
	 * @return
	 */
	public String report() {
	    
	        // 1. 预先初始化报表数据,包括参数绑定等.
	         initReport();
	    
	        // 1.5 ------------以下内容可选,可调整相关参数信息-------------
		
	         /*报表模板名称,默认使用getClass().getSimpleName()*/
		getReport().setTemplate("${className}Action.jasper");
		getReport().setShowWatermark(false);
		
		/*报表生成文档名称,默认使用getClass().getSimpleName()*/
		getReport().setReportName("${className}");
		
		
		// 2. 查询列表结果,存入报表对象
		${className}Query query = newQuery(${className}Query.class,DEFAULT_SORT_COLUMNS);
		//为了保证查询到所有报表数据
		query.setPageSize(10000);
		//获取查询结果
		Page page = ${classNameLower}Manager.findPage(query);
		//设置报表内容
		saveReport(page,query);
				
		
		
		//3.报表模板中额外使用的参数,对应JasperReport模板中的Parameters.视模板而定.
		
		//模板中的外部样式表(默认使用baseDir目录下的style.jrtx)
		//getReport().getParams().put("styleLocation", ServletActionContext.getServletContext().getRealPath("WEB-INF/classes/template/report/style.jrtx"));
		getReport().getParams().put("reportTitle", "${table.tableAlias}清单");
		
		
		
		return REPORT;
	}
	
	/* ------------JSON 方法------------- */
	/** ajax方式  分页返回结果 */
	public String jsonPageList() {
	    ${className}Query query = newQuery(${className}Query.class,DEFAULT_SORT_COLUMNS);
		Page page = ${classNameLower}Manager.findPage(query);
		saveJsonResult(page,query);
		return JSONPAGELIST;
	}
	
	/** ajax方式 返回所有结果,不带分页信息*/
	public String jsonList() {
	    List<${className}>  list= ${classNameLower}Manager.findAll();
		saveJsonResult(list);
		return JSONLIST;
	}
	
	/** ajax保存新增对象 */
	public String jsonSave() {
	        try{
	            ${classNameLower}Manager.save(${classNameLower});
		    getJsonResult().setSuccess(true);
		    getJsonResult().setMessage("成功添加");
	        }catch(Exception e){
	            getJsonResult().setSuccess(false);
		    getJsonResult().setMessage(e.getMessage());
	        }
		return JSONRESULT;
	}
	
	/**保存更新对象*/
	public String jsonUpdate() {
	    try{
		    ${classNameLower}Manager.update(this.${classNameLower});
		    getJsonResult().setSuccess(true);
		    getJsonResult().setMessage("成功更新");
	        }catch(Exception e){
	            getJsonResult().setSuccess(false);
		    getJsonResult().setMessage(e.getMessage());
	        }
		return JSONRESULT;
	}
	
	/**删除对象*/
	public String jsonDelete() {
	    try{
		${classNameLower}Manager.removeById(this.id);
	         getJsonResult().setSuccess(true);
		 getJsonResult().setMessage("成功删除");
	        }catch(Exception e){
	            getJsonResult().setSuccess(false);
		    getJsonResult().setMessage(e.getMessage());
	        }
		return JSONRESULT;
	}
	

}
