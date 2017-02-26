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


public class StationQuery extends BaseQuery implements Serializable {
    

	/**
	 * 
	 */
	private static final long serialVersionUID = -3627576518847429650L;
	/** 序号 */
	private java.lang.Long id;
	/** 地区 */
	private java.lang.String regionCode;
	/** 编号 */
	private java.lang.String code;
	/** 名称 */
	private java.lang.String name;
	/** 经度 */
	private java.lang.String longitude;
	/** 纬度 */
	private java.lang.String latitude;
	/** 海拔 */
	private java.lang.Long hight;
	/** 位置 */
	private java.lang.String unit;
	/** 钻孔类型 */
	private java.lang.Integer wellTypeCode;
	/** 钻孔深度 */
	private java.lang.Long wellDepth;
	/** 观测深度 */
	private java.lang.Long observateDepth;
	/** 岩性 */
	private java.lang.String lithology;
	/** 温度 */
	private java.lang.Long temperature;
	/** 观测时间 */
	private java.lang.String observateTime;
	/** 台站类型 */
	private java.lang.Integer stationTypeCode;
	/** 地区简写代码 */
	private java.lang.String zmCode;

	public java.lang.Long getId() {
		return this.id;
	}
	
	public void setId(java.lang.Long value) {
		this.id = value;
	}
	
	public java.lang.String getRegionCode() {
		return this.regionCode;
	}
	
	public void setRegionCode(java.lang.String value) {
		this.regionCode = value;
	}
	
	public java.lang.String getCode() {
		return this.code;
	}
	
	public void setCode(java.lang.String value) {
		this.code = value;
	}
	
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	
	public java.lang.String getLongitude() {
		return this.longitude;
	}
	
	public void setLongitude(java.lang.String value) {
		this.longitude = value;
	}
	
	public java.lang.String getLatitude() {
		return this.latitude;
	}
	
	public void setLatitude(java.lang.String value) {
		this.latitude = value;
	}
	
	public java.lang.Long getHight() {
		return this.hight;
	}
	
	public void setHight(java.lang.Long value) {
		this.hight = value;
	}
	
	public java.lang.String getUnit() {
		return this.unit;
	}
	
	public void setUnit(java.lang.String value) {
		this.unit = value;
	}
	
	public java.lang.Integer getWellTypeCode() {
		return this.wellTypeCode;
	}
	
	public void setWellTypeCode(java.lang.Integer value) {
		this.wellTypeCode = value;
	}
	
	public java.lang.Long getWellDepth() {
		return this.wellDepth;
	}
	
	public void setWellDepth(java.lang.Long value) {
		this.wellDepth = value;
	}
	
	public java.lang.Long getObservateDepth() {
		return this.observateDepth;
	}
	
	public void setObservateDepth(java.lang.Long value) {
		this.observateDepth = value;
	}
	
	public java.lang.String getLithology() {
		return this.lithology;
	}
	
	public void setLithology(java.lang.String value) {
		this.lithology = value;
	}
	
	public java.lang.Long getTemperature() {
		return this.temperature;
	}
	
	public void setTemperature(java.lang.Long value) {
		this.temperature = value;
	}
	
	public java.lang.String getObservateTime() {
		return this.observateTime;
	}
	
	public void setObservateTime(java.lang.String value) {
		this.observateTime = value;
	}
	
	public java.lang.Integer getStationTypeCode() {
		return this.stationTypeCode;
	}
	
	public void setStationTypeCode(java.lang.Integer value) {
		this.stationTypeCode = value;
	}
	
	public java.lang.String getZmCode() {
		return this.zmCode;
	}
	
	public void setZmCode(java.lang.String value) {
		this.zmCode = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

