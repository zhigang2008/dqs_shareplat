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


public class BoreholeStationQuery extends BaseQuery implements Serializable {
    //序列化,请自动生成
    private static final long serialVersionUID = 0L;
    

	/** 省份代码 */
	private java.lang.String provinceCode;
	/** 省份 */
	private java.lang.String provinceCname;
	/** 台站代码 */
	private java.lang.String stationCode;
	/** 台站名称 */
	private java.lang.String stationCname;
	/** 观测项代码 */
	private java.lang.String itemCode;
	/** 观测项 */
	private java.lang.String itemCname;
	/** 序号 */
	private java.lang.Long id;

	public java.lang.String getProvinceCode() {
		return this.provinceCode;
	}
	
	public void setProvinceCode(java.lang.String value) {
		this.provinceCode = value;
	}
	
	public java.lang.String getProvinceCname() {
		return this.provinceCname;
	}
	
	public void setProvinceCname(java.lang.String value) {
		this.provinceCname = value;
	}
	
	public java.lang.String getStationCode() {
		return this.stationCode;
	}
	
	public void setStationCode(java.lang.String value) {
		this.stationCode = value;
	}
	
	public java.lang.String getStationCname() {
		return this.stationCname;
	}
	
	public void setStationCname(java.lang.String value) {
		this.stationCname = value;
	}
	
	public java.lang.String getItemCode() {
		return this.itemCode;
	}
	
	public void setItemCode(java.lang.String value) {
		this.itemCode = value;
	}
	
	public java.lang.String getItemCname() {
		return this.itemCname;
	}
	
	public void setItemCname(java.lang.String value) {
		this.itemCname = value;
	}
	
	public java.lang.Long getId() {
		return this.id;
	}
	
	public void setId(java.lang.Long value) {
		this.id = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

