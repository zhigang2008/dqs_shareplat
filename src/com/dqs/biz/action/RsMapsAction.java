package com.dqs.biz.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.steven.core.vo.query.ModuleQuery;
import com.steven.framework.common.beanutils.BeanUtils;
import com.steven.framework.core.page.Page;

import com.opensymphony.xwork2.Preparable;
import com.opensymphony.xwork2.ModelDriven;

import java.util.*;

import com.steven.framework.base.*;
import com.steven.framework.util.*;

import com.steven.framework.util.*;
import com.steven.framework.common.web.util.*;
import com.steven.framework.core.page.*;

import com.dqs.biz.model.*;
import com.dqs.biz.dao.*;
import com.dqs.biz.service.*;
import com.dqs.biz.vo.query.*;

/**
 * @author steven
 * @version 1.0
 * @since 1.0
 */


public class RsMapsAction extends BaseStruts2Action implements Preparable,ModelDriven{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	/**服务管理*/
	private RsMapsManager rsMapsManager;
	/**Model对象*/
	private RsMaps rsMaps;
	
	/**对象ID*/
	java.lang.String id = null;
	/**批量操作对象ID*/
	private String[] items;

	private String libId=null;
	private RsMapLib rsMapLib=null;
	/**服务管理*/
	private RsMapLibManager rsMapLibManager;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.Preparable#prepare()
	 */
	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			rsMaps = new RsMaps();
		} else {
			rsMaps = (RsMaps)rsMapsManager.getById(id);
		}
	}
	
	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
	public void setRsMapsManager(RsMapsManager manager) {
		this.rsMapsManager = manager;
	}	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ModelDriven#getModel()
	 */
	public Object getModel() {
		return rsMaps;
	}
	
	public void setSeqno(java.lang.String val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		RsMapsQuery query = newQuery(RsMapsQuery.class, DEFAULT_SORT_COLUMNS);
		// 限制每次查询都是在特定的map lib中
		if (super.isNullOrEmptyString(query.getLibId())) {
			query.setLibId(this.libId);
		}

		Page page = rsMapsManager.findPage(query);
		savePage(page, query);
		//提供maplib名称
		if (!super.isNullOrEmptyString(query.getLibId())) {
           this.rsMapLib=this.rsMapLibManager.getById(query.getLibId());  
		}
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
		rsMaps.setSeqno(UUIDGenerator.getID());
		rsMaps.setUploadTime(new Date());
		rsMapsManager.save(rsMaps);
		return LIST_ACTION;
	}
	
	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}
	
	/**保存更新对象*/
	public String update() {
		//this.rsMaps.setUploadTime(new Date());
		rsMapsManager.update(this.rsMaps);
		return LIST_ACTION;
	}
	
	/**删除对象*/
	public String delete() {
		for(int i = 0; i < items.length; i++) {
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			java.lang.String id = new java.lang.String((String)params.get("seqno"));
			rsMapsManager.removeById(id);
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
		getReport().setTemplate("RsMapsAction.jasper");
		getReport().setShowWatermark(false);
		
		/*报表生成文档名称,默认使用getClass().getSimpleName()*/
		getReport().setReportName("RsMaps");
		
		
		// 2. 查询列表结果,存入报表对象
		RsMapsQuery query = newQuery(RsMapsQuery.class,DEFAULT_SORT_COLUMNS);
		//为了保证查询到所有报表数据
		query.setPageSize(10000);
		//获取查询结果
		Page page = rsMapsManager.findPage(query);
		//设置报表内容
		saveReport(page,query);
				
		
		
		//3.报表模板中额外使用的参数,对应JasperReport模板中的Parameters.视模板而定.
		
		//模板中的外部样式表(默认使用baseDir目录下的style.jrtx)
		//getReport().getParams().put("styleLocation", ServletActionContext.getServletContext().getRealPath("WEB-INF/classes/template/report/style.jrtx"));
		getReport().getParams().put("reportTitle", "遥感图件信息清单");
		
		
		
		return REPORT;
	}
	
	/* ------------JSON 方法------------- */
	/** ajax方式  分页返回结果 */
	public String jsonPageList() {
	    RsMapsQuery query = newQuery(RsMapsQuery.class,DEFAULT_SORT_COLUMNS);
		Page page = rsMapsManager.findPage(query);
		saveJsonResult(page,query);
		return JSONPAGELIST;
	}
	
	/** ajax方式 返回所有结果,不带分页信息*/
	public String jsonList() {
	    List<RsMaps>  list= rsMapsManager.findAll();
		saveJsonResult(list);
		return JSONLIST;
	}
	
	/** ajax保存新增对象 */
	public String jsonSave() {
	        try{
	            rsMapsManager.save(rsMaps);
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
		    rsMapsManager.update(this.rsMaps);
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
		rsMapsManager.removeById(this.id);
	         getJsonResult().setSuccess(true);
		 getJsonResult().setMessage("成功删除");
	        }catch(Exception e){
	            getJsonResult().setSuccess(false);
		    getJsonResult().setMessage(e.getMessage());
	        }
		return JSONRESULT;
	}

	public String getLibId() {
		return libId;
	}

	public void setLibId(String libId) {
		this.libId = libId;
	}

	public RsMapLibManager getRsMapLibManager() {
		return rsMapLibManager;
	}

	public void setRsMapLibManager(RsMapLibManager rsMapLibManager) {
		this.rsMapLibManager = rsMapLibManager;
	}

	public RsMapLib getRsMapLib() {
		return rsMapLib;
	}

	public void setRsMapLib(RsMapLib rsMapLib) {
		this.rsMapLib = rsMapLib;
	}
	

}
