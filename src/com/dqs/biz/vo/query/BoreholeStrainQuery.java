package com.dqs.biz.vo.query;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.steven.framework.base.BaseQuery;

/**
 * @author steven
 * @version 1.0
 * @since 1.0
 */


public class BoreholeStrainQuery extends BaseQuery implements Serializable {

       /**
     * 
     */
    private static final long serialVersionUID = 7324941379945523432L;
    public static final int DEFAULT_PAGE_SIZE = 20;
    private java.util.Date observeTime;
	/** 台站编号 */
	private java.lang.Long stationId;
	/** 观测时间 */
	private java.util.Date observeTimeBegin;
	private java.util.Date observeTimeEnd;
	/** 观测值 */
	private java.lang.Float observeValue;
	/** 年度 */
	private java.lang.String colYear;
	/** 数据表名 */
	private java.lang.String tableName;
	/** 数据字段名 */
	private java.lang.String columnName;
	
	private String provinceCode;
	private String provinceCname;
	private String stationCname;
	private String itemCname;
	//是否始终显示曲线图
	private Boolean chartKeepShow=false;

	public java.lang.Long getStationId() {
		return this.stationId;
	}
	
	public void setStationId(java.lang.Long value) {
		this.stationId = value;
	}
	
	public java.util.Date getObserveTimeBegin() {
		return this.observeTimeBegin;
	}
	
	public void setObserveTimeBegin(java.util.Date value) {
		this.observeTimeBegin = value;
	}	
	
	public java.util.Date getObserveTimeEnd() {
		return this.observeTimeEnd;
	}
	
	public void setObserveTimeEnd(java.util.Date value) {
		this.observeTimeEnd = value;
	}
	
	public java.lang.Float getObserveValue() {
		return this.observeValue;
	}
	
	public void setObserveValue(java.lang.Float value) {
		this.observeValue = value;
	}
	
	public java.lang.String getColYear() {
		return this.colYear;
	}
	
	public void setColYear(java.lang.String value) {
		this.colYear = value;
	}
	
	public java.lang.String getTableName() {
		return this.tableName;
	}
	
	public void setTableName(java.lang.String value) {
		this.tableName = value;
	}
	
	public java.lang.String getColumnName() {
		return this.columnName;
	}
	
	public void setColumnName(java.lang.String value) {
		this.columnName = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}

	/**
	 * @return the observeTime
	 */
	public java.util.Date getObserveTime() {
	    return observeTime;
	}

	/**
	 * @param observeTime the observeTime to set
	 */
	public void setObserveTime(java.util.Date observeTime) {
	    this.observeTime = observeTime;
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
	 * @return the chartShow
	 */
	public Boolean getChartKeepShow() {
	    return chartKeepShow;
	}

	/**
	 * @param chartShow the chartShow to set
	 */
	public void setChartKeepShow(Boolean chartShow) {
	    this.chartKeepShow = chartShow;
	}
	
}

