package com.dqs.biz.action;

import java.util.Hashtable;
import java.util.List;

import com.dqs.biz.model.BoreholeStationItem;
import com.dqs.biz.service.BoreholeStationItemManager;
import com.dqs.biz.service.DownloadRecordManager;
import com.dqs.biz.vo.query.BoreholeStationItemQuery;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.steven.framework.base.BaseStruts2Action;
import com.steven.framework.common.web.util.HttpUtils;
import com.steven.framework.core.page.Page;

/**
 * @author steven
 * @version 1.0
 * @since 1.0
 */


public class BoreholeStationItemAction extends BaseStruts2Action implements Preparable,ModelDriven{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	/**服务管理*/
	private BoreholeStationItemManager boreholeStationItemManager;
	/**Model对象*/
	private BoreholeStationItem boreholeStationItem;
	
	/**对象ID*/
	java.lang.Long id = null;
	/**批量操作对象ID*/
	private String[] items;

	private DownloadRecordManager downloadRecordManager;

	public void setDownloadRecordManager(DownloadRecordManager downloadRecordManager) {
		this.downloadRecordManager = downloadRecordManager;
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.Preparable#prepare()
	 */
	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			boreholeStationItem = new BoreholeStationItem();
		} else {
			boreholeStationItem = (BoreholeStationItem)boreholeStationItemManager.getById(id);
		}
	}
	
	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
	public void setBoreholeStationItemManager(BoreholeStationItemManager manager) {
		this.boreholeStationItemManager = manager;
	}	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ModelDriven#getModel()
	 */
	public Object getModel() {
		return boreholeStationItem;
	}
	
	public void setId(java.lang.Long val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		BoreholeStationItemQuery query = newQuery(BoreholeStationItemQuery.class,DEFAULT_SORT_COLUMNS);
		Page page = boreholeStationItemManager.findPage(query);
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
		boreholeStationItemManager.save(boreholeStationItem);
		return LIST_ACTION;
	}
	
	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}
	
	/**保存更新对象*/
	public String update() {
		boreholeStationItemManager.update(this.boreholeStationItem);
		return LIST_ACTION;
	}
	
	/**删除对象*/
	public String delete() {
		for(int i = 0; i < items.length; i++) {
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			java.lang.Long id = new java.lang.Long((String)params.get("id"));
			boreholeStationItemManager.removeById(id);
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
		getReport().setTemplate("BoreholeStationItemAction.jasper");
		getReport().setShowWatermark(false);
		
		/*报表生成文档名称,默认使用getClass().getSimpleName()*/
		getReport().setReportName("BoreholeStationItem");
		
		
		// 2. 查询列表结果,存入报表对象
		BoreholeStationItemQuery query = newQuery(BoreholeStationItemQuery.class,DEFAULT_SORT_COLUMNS);
		//为了保证查询到所有报表数据
		query.setPageSize(10000);
		//获取查询结果
		Page page = boreholeStationItemManager.findPage(query);
		//设置报表内容
		saveReport(page,query);
				
		
		
		//3.报表模板中额外使用的参数,对应JasperReport模板中的Parameters.视模板而定.
		
		//模板中的外部样式表(默认使用baseDir目录下的style.jrtx)
		//getReport().getParams().put("styleLocation", ServletActionContext.getServletContext().getRealPath("WEB-INF/classes/template/report/style.jrtx"));
		getReport().getParams().put("reportTitle", "地壳应力测量项清单");
		
		//下载记录
		downloadRecordManager.downloadRecord("钻孔应变","地壳应力测量项",this.getRequest());
		
		return REPORT;
	}
	
	/* ------------JSON 方法------------- */
	/** ajax方式  分页返回结果 */
	public String jsonPageList() {
	    BoreholeStationItemQuery query = newQuery(BoreholeStationItemQuery.class,DEFAULT_SORT_COLUMNS);
		Page page = boreholeStationItemManager.findPage(query);
		saveJsonResult(page,query);
		return JSONPAGELIST;
	}
	
	/** ajax方式 返回所有结果,不带分页信息*/
	public String jsonList() {
	    List<BoreholeStationItem>  list= boreholeStationItemManager.findAll();
		saveJsonResult(list);
		return JSONLIST;
	}
	
	/** ajax保存新增对象 */
	public String jsonSave() {
	        try{
	            boreholeStationItemManager.save(boreholeStationItem);
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
		    boreholeStationItemManager.update(this.boreholeStationItem);
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
		boreholeStationItemManager.removeById(this.id);
	         getJsonResult().setSuccess(true);
		 getJsonResult().setMessage("成功删除");
	        }catch(Exception e){
	            getJsonResult().setSuccess(false);
		    getJsonResult().setMessage(e.getMessage());
	        }
		return JSONRESULT;
	}
	

}
