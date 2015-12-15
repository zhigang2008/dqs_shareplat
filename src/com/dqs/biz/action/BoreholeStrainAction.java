package com.dqs.biz.action;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;

import com.dqs.biz.model.BoreholeStrain;
import com.dqs.biz.service.BoreholeStrainManager;
import com.dqs.biz.service.DownloadRecordManager;
import com.dqs.biz.vo.query.BoreholeStrainQuery;
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


public class BoreholeStrainAction extends BaseStruts2Action implements Preparable,ModelDriven{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = "DATE_OBSV"; 
	
	/**服务管理*/
	private BoreholeStrainManager boreholeStrainManager;
	/**Model对象*/
	private BoreholeStrain boreholeStrain;
	
	/**对象ID*/
	String id = null;
	/**批量操作对象ID*/
	private String[] items;
	private String tableName;
	private String columnName;
	
	DecimalFormat df=new DecimalFormat("################0.0000");
	private DownloadRecordManager downloadRecordManager;

	public void setDownloadRecordManager(DownloadRecordManager downloadRecordManager) {
		this.downloadRecordManager = downloadRecordManager;
	}
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.Preparable#prepare()
	 */
	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			boreholeStrain = new BoreholeStrain();
		} else {
			BoreholeStrain queryId=new BoreholeStrain();
			queryId.setObserveTimeString(id);
			queryId.setTableName(tableName);
			queryId.setColumnName(columnName);
			
			boreholeStrain= (BoreholeStrain)boreholeStrainManager.getById(queryId);
		}
	}
	
	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
	public void setBoreholeStrainManager(BoreholeStrainManager manager) {
		this.boreholeStrainManager = manager;
	}	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ModelDriven#getModel()
	 */
	public Object getModel() {
		return boreholeStrain;
	}
	
	public void setObserveTimeString(String val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {   
		BoreholeStrainQuery query = newQuery(BoreholeStrainQuery.class,DEFAULT_SORT_COLUMNS,20);
		Page page = boreholeStrainManager.findPage(query);
		savePage(page,query);
		HashMap calcValueMap=boreholeStrainManager.getCalcValue(query);
		calcValueMap.put("formatMinValue", df.format(calcValueMap.get("MINVALUE")));
		calcValueMap.put("formatMaxValue", df.format(calcValueMap.get("MAXVALUE")));
		calcValueMap.put("formatAvgValue", df.format(calcValueMap.get("AVGVALUE")));
		calcValueMap.put("formatStdValue", df.format(calcValueMap.get("STDVALUE")));
		calcValueMap.put("formatVeriValue", df.format(calcValueMap.get("VARIVALUE")));
		getRequest().setAttribute("calcValue",calcValueMap);
		
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
		boreholeStrainManager.save(boreholeStrain);
		return LIST_JSP;
	}
	
	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}
	
	/**保存更新对象*/
	public String update() {
		boreholeStrainManager.update(this.boreholeStrain);
		return LIST_JSP;
	}
	
	/**删除对象*/
	public String delete() {
	       BoreholeStrain deleteObj=new BoreholeStrain();
	       deleteObj.setTableName(tableName);
		for(int i = 0; i < items.length; i++) {
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			java.util.Date id = new java.util.Date((String)params.get("observeTime"));
			deleteObj.setObserveTime(id);

			boreholeStrainManager.removeById(deleteObj);
		}

		return LIST_JSP;
	}
	
	/**报表导出
	 * @return
	 */
	public String report() {
	    
	        // 1. 预先初始化报表数据,包括参数绑定等.
	         initReport();
	    
	        // 1.5 ------------以下内容可选,可调整相关参数信息-------------
		
	         /*报表模板名称,默认使用getClass().getSimpleName()*/
		getReport().setTemplate("BoreholeStrainAction.jasper");
		getReport().setShowWatermark(false);
		
		/*报表生成文档名称,默认使用getClass().getSimpleName()*/
		getReport().setReportName("BoreholeStrain");
		
		
		// 2. 查询列表结果,存入报表对象
		BoreholeStrainQuery query = newQuery(BoreholeStrainQuery.class,DEFAULT_SORT_COLUMNS);
		//为了保证查询到所有报表数据
		query.setPageSize(100000);
		//获取查询结果
		Page page = boreholeStrainManager.findPage(query);
		//设置报表内容
		saveReport(page,query);
				
		
		
		//3.报表模板中额外使用的参数,对应JasperReport模板中的Parameters.视模板而定.
		
		//模板中的外部样式表(默认使用baseDir目录下的style.jrtx)
		//getReport().getParams().put("styleLocation", ServletActionContext.getServletContext().getRealPath("WEB-INF/classes/template/report/style.jrtx"));
		getReport().getParams().put("reportTitle", "钻孔应变数据清单");
		getReport().getParams().put("provinceCname", query.getProvinceCname());
		getReport().getParams().put("stationCname", query.getStationCname());
		getReport().getParams().put("itemCname", query.getItemCname());
		
		//下载记录
				downloadRecordManager.downloadRecord("钻孔应变","钻孔应变数据清单",this.getRequest());
				
		return REPORT;
	}
	
	/* ------------JSON 方法------------- */
	/** ajax方式  分页返回结果 */
	public String jsonPageList() {
	    BoreholeStrainQuery query = newQuery(BoreholeStrainQuery.class,DEFAULT_SORT_COLUMNS);
		Page page = boreholeStrainManager.findPage(query);
		saveJsonResult(page,query);
		return JSONPAGELIST;
	}
	
	/** ajax方式 返回所有结果,不带分页信息*/
	public String jsonList() {
	    List<BoreholeStrain>  list= boreholeStrainManager.findAll();
		saveJsonResult(list);
		return JSONLIST;
	}
	
	/** ajax保存新增对象 */
	public String jsonSave() {
	        try{
	            boreholeStrainManager.save(boreholeStrain);
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
		    boreholeStrainManager.update(this.boreholeStrain);
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
		boreholeStrainManager.removeById(this.boreholeStrain);
	         getJsonResult().setSuccess(true);
		 getJsonResult().setMessage("成功删除");
	        }catch(Exception e){
	            getJsonResult().setSuccess(false);
		    getJsonResult().setMessage(e.getMessage());
	        }
		return JSONRESULT;
	}

	/**
	 * @return the columnName
	 */
	public String getColumnName() {
	    return columnName;
	}

	/**
	 * @param columnName the columnName to set
	 */
	public void setColumnName(String columnName) {
	    this.columnName = columnName;
	}

	/**
	 * @return the tableName
	 */
	public String getTableName() {
	    return tableName;
	}

	/**
	 * @param tableName the tableName to set
	 */
	public void setTableName(String tableName) {
	    this.tableName = tableName;
	}
	

}
