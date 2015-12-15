package com.dqs.biz.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.dqs.biz.model.BoreholeStrain;
import com.dqs.biz.service.BoreholeStrainManager;
import com.dqs.biz.vo.query.BoreholeStrainQuery;
import com.steven.framework.base.BaseStruts2Action;
import com.steven.framework.core.page.Page;
import com.steven.framework.util.StringTokenizerUtils;

/**
 * @author steven
 * @version 1.0
 * @since 1.0
 */


public class BoreholeStrainUploadAction extends BaseStruts2Action {
	
	/**服务管理*/
	private BoreholeStrainManager boreholeStrainManager;

	private String provinceCode;
	private String tableName;
	private String columnName;
	private int dataYear;
	private int dataMonth;
	private String filepath;
	private List<BoreholeStrain> dataList=new ArrayList<BoreholeStrain>();
	//private Long stationId;
	private String provinceCname;
	private String stationCname;
	private String itemCname;
	private boolean dataExist;
	private boolean dataOk=true;
	
		
	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
	public void setBoreholeStrainManager(BoreholeStrainManager manager) {
		this.boreholeStrainManager = manager;
	}

	public String upload(){
	    return SUCCESS;
	}
	/**预览数据
	 * @return
	 */
	public String preview(){
//	    BoreholeStation station=boreholeStationManager.getByCode(this.provinceCode,this.tableName);
//	    this.stationId=station.getId();
	    //检查是否存在该时段的数据
	    setDataExist(this.checkExistDataInner());
	    
	    //将文件读取到数组对象中
	    String realPath=ServletActionContext.getServletContext().getRealPath(filepath);
	    this.readerData(realPath);
	    
	    //检查数据是否与时段匹配
	    dataOk=checkData();
	    return SUCCESS;
	}
	
	/**检查数据是否匹配
	 * @return
	 */
	private boolean checkData() {
	    Calendar c = Calendar.getInstance();
	    c.clear();
	    c.set(this.dataYear, this.dataMonth-1, 1, 0, 0, 0);
	    Date beginTime=c.getTime();
	    c.set(this.dataYear, this.dataMonth, 1, 0, 0, 0);
	    Date endTime=c.getTime();
	    
	    //时段长,包含的整点数
	    long timenum=(endTime.getTime()-beginTime.getTime())/(1000*60*60);
	    if(this.dataList.size()!=(int)timenum){
		
		return false;
	    }
	    return true;
	}

	/**检查是否存在数据
	 * @return
	 */
	private boolean checkExistDataInner(){
	    //数据时间
	    Calendar c = Calendar.getInstance();
	    c.clear();
	    c.set(this.dataYear, this.dataMonth-1, 1, 0, 0, 0);
	    Date beginTime=c.getTime();
	    c.set(this.dataYear, this.dataMonth, 1, 0, 0, 0);
	    Date endTime=c.getTime();
		
	    //查询数据
	    BoreholeStrainQuery query=new BoreholeStrainQuery();
	    query.setTableName(this.tableName);
	    query.setColumnName(this.columnName);
	    query.setPageSize(1000);
	    query.setObserveTimeBegin(beginTime);
	    query.setObserveTimeEnd(endTime);
	    
	    Page page=boreholeStrainManager.findPage(query);
	    List<BoreholeStrain> list=page.getResult();
	    if(list!=null&&list.size()>0){
		for(BoreholeStrain b:list){
		    if(b.getObserveValue()!=null){
		      return true;
		    }
		}
		return false;
	    }else{
		return false;
	    }

	}
	
	/**检查存在的数据
	 * @return
	 */
	public String checkExistData(){
	    //数据时间
	    Calendar c = Calendar.getInstance();
	    c.clear();
	    c.set(this.dataYear, this.dataMonth-1, 1, 0, 0, 0);
	    Date beginTime=c.getTime();
	    c.set(this.dataYear, this.dataMonth, 1, 0, 0, 0);
	    Date endTime=c.getTime();
		
	    //查询数据
	    BoreholeStrainQuery query=new BoreholeStrainQuery();
	    query.setTableName(this.tableName);
	    query.setColumnName(this.columnName);
	    query.setPageSize(5);
	    query.setObserveTimeBegin(beginTime);
	    query.setObserveTimeEnd(endTime);
	    
	    Page page=boreholeStrainManager.findPage(query);
	    List<BoreholeStrain> list=page.getResult();
	    if(list!=null&&list.size()>0){
		for(BoreholeStrain b:list){
		    if(b.getObserveValue()!=null){
		      super.checkResult(false);
		      return CHECKRESULT;
		    }
		}
		super.checkResult(true);
	    }else{
		super.checkResult(true);
	    }
	    return CHECKRESULT;
	}
	
	/**导入数据
	 * @return
	 */
	public String importData(){
	    this.clearErrorsAndMessages();
	    
	    try{
		boreholeStrainManager.importData(dataList);
	        //删除上传文件
		deleteFile(this.filepath);
		this.setFilepath(null);
		this.dataList.clear();
	    }catch(Exception e){
		log.warn("导入数据时失败["+this.provinceCname+"-"+this.stationCname+"-"+this.itemCname+" "+this.dataYear+"-"+this.dataMonth+"]",e);
		addActionMessage("数据导入失败:"+e.getMessage());
	    }
	    return SUCCESS;
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
	public List<BoreholeStrain> getDataList() {
	    return dataList;
	}


	/**
	 * @param dataList the dataList to set
	 */
	public void setDataList(List<BoreholeStrain> dataList) {
	    this.dataList = dataList;
	}	

	
    /**将文件数据读取到对象中
     * @param dataFile
     */
    private void readerData(String dataFile) {
	dataList.clear();
	
	//赋一个站点值
	Long stationId=new Long(9999);
	
	StringBuffer dataStr = new StringBuffer();
	Calendar c = Calendar.getInstance();
	c.set(this.dataYear, this.dataMonth-1, 1, 0, 0, 0);
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	
	File file = new File(dataFile);
	try {
	    FileReader reader = new FileReader(file);
	    int ch = 0;
	    while ((ch = reader.read()) != -1) {
		dataStr.append((char) ch);
	    }
	    String[] strs = StringTokenizerUtils.split(dataStr.toString(), " ");
	    
	    for (String item : strs) {
		if (item.trim().length() > 0) {
                    BoreholeStrain data=new BoreholeStrain();
                    data.setTableName(this.tableName);
                    //为了兼容当前数据库结构,需要赋一个非空的站点编号.(目前此站点号无意义)
                    data.setStationId(stationId);
                    data.setColumnName(this.columnName);
                    data.setColYear(String.valueOf(this.dataYear));
                    data.setObserveTime(c.getTime());
                    data.setObserveValue(new Float(item));
                    this.dataList.add(data);

		    c.add(Calendar.HOUR_OF_DAY, 1);
		}
	    }

	} catch (FileNotFoundException e) {
	    log.error("上传文件未找到:["+dataFile+"]",e);
	} catch (IOException e) {
	    log.error("文件读取异常"+e.getMessage(),e);
	}
    }

    /**
     * @return the dataYear
     */
    public int getDataYear() {
        return dataYear;
    }

    /**
     * @param dataYear the dataYear to set
     */
    public void setDataYear(int dataYear) {
        this.dataYear = dataYear;
    }

    /**
     * @return the dataMonth
     */
    public int getDataMonth() {
        return dataMonth;
    }

    /**
     * @param dataMonth the dataMonth to set
     */
    public void setDataMonth(int dataMonth) {
        this.dataMonth = dataMonth;
    }

    /**
     * @return the provinceCode
     */
    public String getProvinceCode() {
        return provinceCode;
    }

    /**
     * @param provinceCode the provinceCode to set
     */
    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }

    /**
     * @return the stationCname
     */
    public String getStationCname() {
        return stationCname;
    }

    /**
     * @param stationCname the stationCname to set
     */
    public void setStationCname(String stationCname) {
        this.stationCname = stationCname;
    }

    /**
     * @return the provinceCname
     */
    public String getProvinceCname() {
        return provinceCname;
    }

    /**
     * @param provinceCname the provinceCname to set
     */
    public void setProvinceCname(String provinceCname) {
        this.provinceCname = provinceCname;
    }

    /**
     * @return the itemCname
     */
    public String getItemCname() {
        return itemCname;
    }

    /**
     * @param itemCname the itemCname to set
     */
    public void setItemCname(String itemCname) {
        this.itemCname = itemCname;
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
	
	//针对新格式进行上传
	public String upload2(){
	    return SUCCESS;
	}

	
  
	/**新版格式,分别导入(效率不高)	
	 * @return
	 */
	public String importData2() {
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
				dataList = readLineData(str);
				boreholeStrainManager.importData(dataList);
				str = br.readLine();
			}
			// 删除上传文件
			deleteFile(this.filepath);
			this.setFilepath(null);
			this.dataList.clear();
		}catch(ParseException ex){
			log.warn("导入数据时失败-日期解析失败[" + this.provinceCname + "-" + this.stationCname
					+ "-" + this.itemCname + "]", ex);
			addActionMessage("新版数据导入失败-日期解析失败:" + ex.getMessage());
		}
		catch (Exception e) {
			log.warn("导入数据时失败[" + this.provinceCname + "-" + this.stationCname
					+ "-" + this.itemCname + "]", e);
			addActionMessage("新版数据导入失败:" + e.getMessage());
		}
		return SUCCESS;
	}
	/**新版格式,导入数据.批量导入
	 * @return
	 */
	public String importDataBatch() {
		this.clearErrorsAndMessages();
		this.dataList.clear();
		long b=System.currentTimeMillis();
		
		try {
			// 读文件
			String realPath = ServletActionContext.getServletContext().getRealPath(filepath);
			File file = new File(realPath);
			FileReader fr = new FileReader(file);
			BufferedReader br = new BufferedReader(fr);
			String str = br.readLine();
			while (StringUtils.isNotBlank(str)) {
				dataList.addAll(readLineData(str));
				str = br.readLine();
			}
			boreholeStrainManager.importDataNoCheck(dataList);
			// 删除上传文件
			deleteFile(this.filepath);
			this.setFilepath(null);
			this.dataList.clear();
		}catch(ParseException ex){
			log.warn("导入数据时失败-日期解析失败[" + this.provinceCname + "-" + this.stationCname
					+ "-" + this.itemCname + "]", ex);
			addActionMessage("新版数据导入失败-日期解析失败:" + ex.getMessage());
		}
		catch (Exception e) {
			log.warn("导入数据时失败[" + this.provinceCname + "-" + this.stationCname
					+ "-" + this.itemCname + "]", e);
			addActionMessage("新版数据导入失败:" + e.getMessage());
		}
		long e=System.currentTimeMillis();
		System.out.println("=======cost time ========="+(e-b));
		return SUCCESS;
	}
	
	//新版数据日期格式
	private SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
	//赋一个站点值
	private Long stationId=new Long(9999);
	private Calendar calendar = Calendar.getInstance();
	
	/**按行读取新格式的数据
	 * @param str
	 * @return
	 * @throws ParseException 
	 */

	private List<BoreholeStrain> readLineData(String dataStr) throws ParseException {
		List<BoreholeStrain> newDataList=new ArrayList<BoreholeStrain>();
		
		String[] strs = StringTokenizerUtils.split(dataStr, " ");
		//第一个字段是日期字段
		String timeStr=strs[0];
		Date date=df.parse(timeStr);
		calendar.setTime(date);
		int colYear=calendar.get(Calendar.YEAR);
		 
		//读取数据字段
		String item=null;
		for(int i=1;i<strs.length;i++) {
			item=strs[i];
			if (item.trim().length() > 0) {
	                    BoreholeStrain data=new BoreholeStrain();
	                    data.setTableName(this.tableName);
	                    //为了兼容当前数据库结构,需要赋一个非空的站点编号.(目前此站点号无意义)
	                    data.setStationId(stationId);
	                    data.setColumnName(this.columnName);
	                    data.setColYear(String.valueOf(colYear));
	                    data.setObserveTime(calendar.getTime());
	                    data.setObserveValue(new Float(item));
	                    
	                    newDataList.add(data);
	                    calendar.add(Calendar.HOUR_OF_DAY, 1);
			}
		 }
		return newDataList;
	}
}
