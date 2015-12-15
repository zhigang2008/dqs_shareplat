package com.dqs.biz.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.dqs.biz.model.TemperatureInfo;
import com.dqs.biz.service.TemperatureInfoManager;
import com.steven.framework.base.BaseStruts2Action;
import com.steven.framework.util.StringTokenizerUtils;

/**
 * @author steven
 * @version 1.0
 * @since 1.0
 */


public class TemperatureUploadAction extends BaseStruts2Action {
	
	/**服务管理*/
	private TemperatureInfoManager temperatureInfoManager;

	private String zmCode;
//	private int dataYear;
//	private int dataMonth;
	private String filepath;
	private List<TemperatureInfo> dataList=new ArrayList<TemperatureInfo>();
	//private Long stationId;
	private String regionName;
	private String stationName;
	private String stationCode;
	private boolean dataExist;
	private boolean dataOk=true;
	
		

	public String upload(){
	    return SUCCESS;
	}
	
	
//	/**检查是否存在数据
//	 * @return
//	 */
//	private boolean checkExistDataInner(){
//	    //数据时间
//	    Calendar c = Calendar.getInstance();
//	    c.clear();
//	    c.set(this.dataYear, this.dataMonth-1, 1, 0, 0, 0);
//	    Date beginTime=c.getTime();
//	    c.set(this.dataYear, this.dataMonth, 1, 0, 0, 0);
//	    Date endTime=c.getTime();
//		
//	    //查询数据
//	    BoreholeStrainQuery query=new BoreholeStrainQuery();
//	    query.setTableName(this.tableName);
//	    query.setColumnName(this.columnName);
//	    query.setPageSize(1000);
//	    query.setObserveTimeBegin(beginTime);
//	    query.setObserveTimeEnd(endTime);
//	    
//	    Page page=boreholeStrainManager.findPage(query);
//	    List<BoreholeStrain> list=page.getResult();
//	    if(list!=null&&list.size()>0){
//		for(BoreholeStrain b:list){
//		    if(b.getObserveValue()!=null){
//		      return true;
//		    }
//		}
//		return false;
//	    }else{
//		return false;
//	    }
//
//	}
//	
//	/**检查存在的数据
//	 * @return
//	 */
//	public String checkExistData(){
//	    //数据时间
//	    Calendar c = Calendar.getInstance();
//	    c.clear();
//	    c.set(this.dataYear, this.dataMonth-1, 1, 0, 0, 0);
//	    Date beginTime=c.getTime();
//	    c.set(this.dataYear, this.dataMonth, 1, 0, 0, 0);
//	    Date endTime=c.getTime();
//		
//	    //查询数据
//	    BoreholeStrainQuery query=new BoreholeStrainQuery();
//	    query.setTableName(this.tableName);
//	    query.setColumnName(this.columnName);
//	    query.setPageSize(5);
//	    query.setObserveTimeBegin(beginTime);
//	    query.setObserveTimeEnd(endTime);
//	    
//	    Page page=boreholeStrainManager.findPage(query);
//	    List<BoreholeStrain> list=page.getResult();
//	    if(list!=null&&list.size()>0){
//		for(BoreholeStrain b:list){
//		    if(b.getObserveValue()!=null){
//		      super.checkResult(false);
//		      return CHECKRESULT;
//		    }
//		}
//		super.checkResult(true);
//	    }else{
//		super.checkResult(true);
//	    }
//	    return CHECKRESULT;
//	}
//	
	
	
	/**
	 * @return the filepath
	 */
	public String getFilepath() {
	    return filepath;
	}


	/**
	 * @param filepath the filepath to set
	 */
	public void setFilepath(String filepath) {
	    this.filepath = filepath;
	}


	/**
	 * @return the dataList
	 */
	public List<TemperatureInfo> getDataList() {
	    return dataList;
	}


	/**
	 * @param dataList the dataList to set
	 */
	public void setDataList(List<TemperatureInfo> dataList) {
	    this.dataList = dataList;
	}	

	
   
    public void setDataExist(boolean dataExist) {
	this.dataExist = dataExist;
    }

    public boolean isDataExist() {
	return dataExist;
    }

    /**
     * @return the dataOk
     */
    public boolean isDataOk() {
        return dataOk;
    }

    /**
     * @param dataOk the dataOk to set
     */
    public void setDataOk(boolean dataOk) {
        this.dataOk = dataOk;
    }

    /**删除废弃的文件
	 * @param filePath
	 */
	private void deleteFile(String filePath){
		try{
		    String destPath = ServletActionContext.getServletContext().getRealPath(filePath);
		File deleteFile=new File(destPath);
		deleteFile.delete();
		deleteFile=null;
		}catch(Exception e){
		    log.warn("文件删除失败["+filePath+"]");
		    //null
		}
	}
	

	
	/**新版格式导入
	 * @return
	 */
	public String importData() {
		this.clearErrorsAndMessages();
        this.dataList.clear();
		try {
			// 读文件
			String realPath = ServletActionContext.getServletContext().getRealPath(filepath);
			File file = new File(realPath);
			FileReader fr = new FileReader(file);
			BufferedReader br = new BufferedReader(fr);
			String str = br.readLine();
			while (StringUtils.isNotBlank(str)) {
				dataList.add(readLineData(str));
				str = br.readLine();
			}
			temperatureInfoManager.importData(dataList);
			// 删除上传文件
			deleteFile(this.filepath);
			this.setFilepath(null);
			this.dataList.clear();
			
		}catch(ParseException ex){
			log.warn("导入数据时失败-日期解析失败[" + this.regionName + "-" + this.stationName
					+ "]", ex);
			addActionMessage("新版数据导入失败-日期解析失败:" + ex.getMessage());
		}
		catch (Exception e) {
			log.warn("导入数据时失败[" + this.regionName + "-" + this.stationName
					+  "]", e);
			addActionMessage("新版数据导入失败:" + e.getMessage());
		}
		return SUCCESS;
	}
	
	/**导入数据,批量模式
	 * @return
	 */
	public String importDataBatch() {
		this.clearErrorsAndMessages();
        this.dataList.clear();
		try {
			// 读文件
			String realPath = ServletActionContext.getServletContext().getRealPath(filepath);
			File file = new File(realPath);
			FileReader fr = new FileReader(file);
			BufferedReader br = new BufferedReader(fr);
			String str = br.readLine();
			while (StringUtils.isNotBlank(str)) {
				dataList.add(readLineData(str));
				str = br.readLine();
			}
			temperatureInfoManager.importDataBatch(dataList);
			// 删除上传文件
			deleteFile(this.filepath);
			this.setFilepath(null);
			this.dataList.clear();
			
		}catch(ParseException ex){
			log.warn("导入数据时失败-日期解析失败[" + this.regionName + "-" + this.stationName
					+ "]", ex);
			addActionMessage("新版数据导入失败-日期解析失败:" + ex.getMessage());
		}
		catch (Exception e) {
			log.warn("导入数据时失败[" + this.regionName + "-" + this.stationName
					+  "]", e);
			addActionMessage("新版数据导入失败:" + e.getMessage());
		}
		return SUCCESS;
	}
	//新版数据日期格式
	private SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHH");
	//赋一个站点值
	private Long stationId=new Long(9999);
	private Calendar calendar = Calendar.getInstance();
	
	/**按行读取新格式的数据
	 * @param str
	 * @return
	 * @throws ParseException 
	 */

	private TemperatureInfo readLineData(String dataStr) throws ParseException {
		String[] strs = StringTokenizerUtils.split(dataStr, " ");
		//第一个字段是日期字段
		String timeStr=strs[0];
		Date date=df.parse(timeStr);
		log.debug("=============="+date);
		calendar.setTime(date);
		int colYear=calendar.get(Calendar.YEAR);
		 
		//读取数据字段
		String item=strs[1];
        TemperatureInfo data=new TemperatureInfo();
        //为了兼容当前数据库结构,需要赋一个非空的站点编号.(目前此站点号无意义)
	                    data.setStationCode(this.getStationCode());
	                    data.setZmCode(this.getZmCode());
	                    data.setStationId(stationId);
	                    data.setDataYear(String.valueOf(colYear));
	                    data.setTime(date);
	                    data.setTemperature(new Float(item));

		return data;
	}


	public TemperatureInfoManager getTemperatureInfoManager() {
		return temperatureInfoManager;
	}


	public void setTemperatureInfoManager(TemperatureInfoManager temperatureInfoManager) {
		this.temperatureInfoManager = temperatureInfoManager;
	}


	/**
	 * @return the zmCode
	 */
	public String getZmCode() {
		return zmCode;
	}


	/**
	 * @return the regionName
	 */
	public String getRegionName() {
		return regionName;
	}


	/**
	 * @return the stationName
	 */
	public String getStationName() {
		return stationName;
	}


	/**
	 * @return the stationId
	 */
	public Long getStationId() {
		return stationId;
	}


	/**
	 * @param zmCode the zmCode to set
	 */
	public void setZmCode(String zmCode) {
		this.zmCode = zmCode;
	}


	/**
	 * @param regionName the regionName to set
	 */
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}


	/**
	 * @param stationName the stationName to set
	 */
	public void setStationName(String stationName) {
		this.stationName = stationName;
	}


	/**
	 * @param stationId the stationId to set
	 */
	public void setStationId(Long stationId) {
		this.stationId = stationId;
	}


	/**
	 * @return the stationCode
	 */
	public String getStationCode() {
		return stationCode;
	}


	/**
	 * @param stationCode the stationCode to set
	 */
	public void setStationCode(String stationCode) {
		this.stationCode = stationCode;
	}
}
