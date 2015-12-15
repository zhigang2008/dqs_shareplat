package com.dqs.biz.action;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import com.dqs.biz.model.BoreholeStation;
import com.dqs.biz.model.BoreholeStationItem;
import com.dqs.biz.service.BoreholeStationItemManager;
import com.dqs.biz.service.BoreholeStationManager;
import com.dqs.biz.service.DownloadRecordManager;
import com.dqs.biz.vo.query.BoreholeStationQuery;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.steven.core.model.Region;
import com.steven.core.service.RegionManager;
import com.steven.framework.base.BaseStruts2Action;
import com.steven.framework.common.web.util.HttpUtils;
import com.steven.framework.core.page.Page;

/**
 * @author steven
 * @version 1.0
 * @since 1.0
 */


public class BoreholeStationAction extends BaseStruts2Action implements Preparable,ModelDriven{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	/**服务管理*/
	private BoreholeStationManager boreholeStationManager;
	private RegionManager regionManager;
	private BoreholeStationItemManager boreholeStationItemManager;
	/**Model对象*/
	private BoreholeStation boreholeStation;
    
	private String[] stationItems;	
	private List<BoreholeStation> existItems=new ArrayList();
	private List<BoreholeStationItem> notExistItems=new ArrayList();
	List<Region>  standarProvinces= null;
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
			boreholeStation = new BoreholeStation();
		} else {
			boreholeStation = (BoreholeStation)boreholeStationManager.getById(id);
		}
		fetchBaseCode("boreholeStationItem");
	}
	
	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
	public void setBoreholeStationManager(BoreholeStationManager manager) {
		this.boreholeStationManager = manager;
	}	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ModelDriven#getModel()
	 */
	public Object getModel() {
		return boreholeStation;
	}
	
	public void setId(java.lang.Long val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		BoreholeStationQuery query = newQuery(BoreholeStationQuery.class,DEFAULT_SORT_COLUMNS);
		Page page = boreholeStationManager.findPage(query);
		savePage(page,query);
		return LIST_JSP;
	}
	
	/** 查看对象*/
	public String show() {
	        this.boreholeStation=boreholeStationManager.getStationInfoByCode(boreholeStation.getStationCode());
	        this.existItems=boreholeStationManager.getItemInfo(boreholeStation.getStationCode());
		return SHOW_JSP;
	}
	
	/** 进入新增页面*/
	public String create() {
		return CREATE_JSP;
	}
	
	/** 保存新增对象 */
	public String save() {
		boreholeStationManager.createStation(this.boreholeStation,this.stationItems);
		return LIST_ACTION;
	}
	
	/**进入更新页面*/
	public String edit() {
	        this.boreholeStation=boreholeStationManager.getStationInfoByCode(boreholeStation.getStationCode());
	        this.existItems=boreholeStationManager.getItemInfo(boreholeStation.getStationCode());
	        this.notExistItems=this.boreholeStationItemManager.getNotExistItems(boreholeStation.getStationCode());
	        this.standarProvinces=regionManager.getBaseCode();
		return EDIT_JSP;
	}
	
	/**保存更新对象*/
	public String update() {
	        this.existItems=boreholeStationManager.getItemInfo(boreholeStation.getStationCode());
	        List<String> newItems=new ArrayList<String>();
	        for(String item:this.stationItems){
	            newItems.add(item);
	        }
	        for(BoreholeStation s:this.existItems){
	        	newItems.remove(s.getItemCode());
	        }
	        //更新操作
		boreholeStationManager.updateStation(this.boreholeStation,newItems);
		return LIST_ACTION;
	}
	
	/**删除对象*/
	public String delete() {
		for(int i = 0; i < items.length; i++) {
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			java.lang.Long id = new java.lang.Long((String)params.get("id"));
			boreholeStationManager.removeById(id);
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
		getReport().setTemplate("BoreholeStationAction.jasper");
		getReport().setShowWatermark(false);
		
		/*报表生成文档名称,默认使用getClass().getSimpleName()*/
		getReport().setReportName("BoreholeStation");
		
		
		// 2. 查询列表结果,存入报表对象
		BoreholeStationQuery query = newQuery(BoreholeStationQuery.class,DEFAULT_SORT_COLUMNS);
		//为了保证查询到所有报表数据
		query.setPageSize(10000);
		//获取查询结果
		Page page = boreholeStationManager.findPage(query);
		//设置报表内容
		saveReport(page,query);
				
		
		
		//3.报表模板中额外使用的参数,对应JasperReport模板中的Parameters.视模板而定.
		
		//模板中的外部样式表(默认使用baseDir目录下的style.jrtx)
		//getReport().getParams().put("styleLocation", ServletActionContext.getServletContext().getRealPath("WEB-INF/classes/template/report/style.jrtx"));
		getReport().getParams().put("reportTitle", "钻孔应变台站信息清单");
		
		//下载记录
		downloadRecordManager.downloadRecord("钻孔应变","钻孔应变台站信息",this.getRequest());
		
		return REPORT;
	}
	
	/* ------------JSON 方法------------- */
	/** ajax方式  分页返回结果 */
	public String jsonPageList() {
	    BoreholeStationQuery query = newQuery(BoreholeStationQuery.class,DEFAULT_SORT_COLUMNS);
		Page page = boreholeStationManager.findPage(query);
		saveJsonResult(page,query);
		return JSONPAGELIST;
	}
	
	/** ajax方式 返回所有结果,不带分页信息*/
	public String jsonList() {
	    List<BoreholeStation>  list= boreholeStationManager.findAll();
		saveJsonResult(list);
		return JSONLIST;
	}
	
	/** ajax保存新增对象 */
	public String jsonSave() {
	        try{
	            boreholeStationManager.save(boreholeStation);
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
		    boreholeStationManager.update(this.boreholeStation);
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
		boreholeStationManager.removeById(this.id);
	         getJsonResult().setSuccess(true);
		 getJsonResult().setMessage("成功删除");
	        }catch(Exception e){
	            getJsonResult().setSuccess(false);
		    getJsonResult().setMessage(e.getMessage());
	        }
		return JSONRESULT;
	}
	
	/** ajax方式 返回所省份信息,不带分页信息*/
	public String getAllProvince() {
	    List<BoreholeStation>  list= boreholeStationManager.getAllProvince();
		saveJsonResult(list);
		return JSONLIST;
	}
	/** ajax方式 返回所台站信息,不带分页信息*/
	public String getStationInfo() {
	    List<BoreholeStation>  list= boreholeStationManager.getStationInfo(boreholeStation.getProvinceCode());
		saveJsonResult(list);
		return JSONLIST;
	}
	/** ajax方式 返回所观测项信息,不带分页信息*/
	public String getItemInfo() {
	    List<BoreholeStation>  list= boreholeStationManager.getItemInfo(boreholeStation.getStationCode());
		saveJsonResult(list);
		return JSONLIST;
	}
	
	/**获取标准可用的省份信息
	 * @return
	 */
	public String getStandardProvinces(){
		List<Region>  list= regionManager.getBaseCode();
		saveJsonResult(list);
		return JSONLIST;
	}
	
	/**检查是否存在台站
	 * @return
	 */
	public String checkExistStation(){
	    boolean exist=this.boreholeStationManager.checkExistStation(boreholeStation.getStationCode());
		super.checkResult(exist==true?false:true);
		return CHECKRESULT;
	}
	/**获取标准的测量项信息
	 * @return
	 */
	public String getStandardItems(){
		List<BoreholeStationItem>  list= boreholeStationItemManager.getBaseCode();
		saveJsonResult(list);
		return JSONLIST;
	}

	/**
	 * @param regionManager the regionManager to set
	 */
	public void setRegionManager(RegionManager regionManager) {
		this.regionManager = regionManager;
	}

	/**
	 * @param boreholeStationItemManager the boreholeStationItemManager to set
	 */
	public void setBoreholeStationItemManager(
			BoreholeStationItemManager boreholeStationItemManager) {
		this.boreholeStationItemManager = boreholeStationItemManager;
	}

	/**
	 * @param stationItems the stationItems to set
	 */
	public void setStationItems(String[] stationItems) {
		this.stationItems = stationItems;
	}

	/**
	 * @return the existItems
	 */
	public List<BoreholeStation> getExistItems() {
	    return existItems;
	}

	/**
	 * @return the notExistItems
	 */
	public List<BoreholeStationItem> getNotExistItems() {
	    return notExistItems;
	}

	/**
	 * @return the standarProvinces
	 */
	public List<Region> getStandarProvinces() {
	    return standarProvinces;
	}

}
