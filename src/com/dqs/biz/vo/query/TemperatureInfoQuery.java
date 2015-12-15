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


public class TemperatureInfoQuery extends BaseQuery implements Serializable {
    

	/**
	 * 
	 */
	private static final long serialVersionUID = 5487928547102354725L;
	public static final int DEFAULT_PAGE_SIZE = 20;
	/** 序号 */
	private java.lang.Long id;
	/** 台站编号 */
	private java.lang.Long stationId;
	/** 观测时间 */
	private java.util.Date timeBegin;
	private java.util.Date timeEnd;
	/** 温度 */
	private java.lang.Float temperature;
	/** 年度 */
	private java.lang.String dataYear;
	/** 地区简写代码 */
	private java.lang.String zmCode;
	/**台站编码**/
	private String stationCode;
	/**地区名称*/
	private String regionName;
	/**台站名称*/
	private String stationName;
	//是否始终显示曲线图
	private Boolean chartKeepShow=false;
	
	public java.lang.Long getId() {
		return this.id;
	}
	
	public void setId(java.lang.Long value) {
		this.id = value;
	}
	
	public java.lang.Long getStationId() {
		return this.stationId;
	}
	
	public void setStationId(java.lang.Long value) {
		this.stationId = value;
	}
	
	public java.util.Date getTimeBegin() {
		return this.timeBegin;
	}
	
	public void setTimeBegin(java.util.Date value) {
		this.timeBegin = value;
	}	
	
	public java.util.Date getTimeEnd() {
		return this.timeEnd;
	}
	
	public void setTimeEnd(java.util.Date value) {
		this.timeEnd = value;
	}
	
	public java.lang.Float getTemperature() {
		return this.temperature;
	}
	
	public void setTemperature(java.lang.Float value) {
		this.temperature = value;
	}
	
	public java.lang.String getDataYear() {
		return this.dataYear;
	}
	
	public void setDataYear(java.lang.String value) {
		this.dataYear = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}

	/**
	 * @return the zmCode
	 */
	public java.lang.String getZmCode() {
		return zmCode;
	}

	/**
	 * @return the stationCode
	 */
	public String getStationCode() {
		return stationCode;
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
	 * @param zmCode the zmCode to set
	 */
	public void setZmCode(java.lang.String zmCode) {
		this.zmCode = zmCode;
	}

	/**
	 * @param stationCode the stationCode to set
	 */
	public void setStationCode(String stationCode) {
		this.stationCode = stationCode;
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
	 * @return the chartKeepShow
	 */
	public Boolean getChartKeepShow() {
		return chartKeepShow;
	}

	/**
	 * @param chartKeepShow the chartKeepShow to set
	 */
	public void setChartKeepShow(Boolean chartKeepShow) {
		this.chartKeepShow = chartKeepShow;
	}
	
}

