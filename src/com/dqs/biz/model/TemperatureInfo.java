package com.dqs.biz.model;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.steven.framework.base.BaseEntity;
import com.steven.framework.util.DateConvertUtils;

/**
 * @author steven
 * @version 1.0
 * @since 1.0
 */


public class TemperatureInfo extends BaseEntity implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7382193257654140188L;
	//表别名
	public static final String TABLE_ALIAS = "钻孔地温";
	//字段名称
	public static final String ALIAS_ID = "序号";
	public static final String ALIAS_STATION_ID = "台站编号";
	public static final String ALIAS_TIME = "观测时间";
	public static final String ALIAS_TEMPERATURE = "温度";
	public static final String ALIAS_DATA_YEAR = "年度";
	
	//date formats
	public static final String FORMAT_TIME = "yyyy-MM-dd:HH";
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
       /**
        * 序号       db_column: ID 
        */	
	//
	private java.lang.Long id;
       /**
        * 台站编号       db_column: STATION_ID 
        */	
	//
	private java.lang.Long stationId;
       /**
        * 观测时间       db_column: TIME 
        */	
	//@NotNull 
	private java.util.Date time;
       /**
        * 温度       db_column: TEMPERATURE 
        */	
	//@NotNull 
	private java.lang.Float temperature;
       /**
        * 年度       db_column: DATA_YEAR 
        */	
	//@Length(max=10)
	private java.lang.String dataYear;
	/** 地区简写代码 */
	private java.lang.String zmCode;
	/**台站编码**/
	private String stationCode;
	//columns END

	public TemperatureInfo(){
	}

	public TemperatureInfo(
		java.lang.Long id
	){
		this.id = id;
	}

	public void setId(java.lang.Long value) {
		this.id = value;
	}
	
	public java.lang.Long getId() {
		return this.id;
	}
	public void setStationId(java.lang.Long value) {
		this.stationId = value;
	}
	
	public java.lang.Long getStationId() {
		return this.stationId;
	}
	public String getTimeString() {
		return DateConvertUtils.format(getTime(), FORMAT_TIME);
	}
	public void setTimeString(String value) {
		setTime(DateConvertUtils.parse(value, FORMAT_TIME,java.util.Date.class));
	}
	
	public void setTime(java.util.Date value) {
		this.time = value;
	}
	
	public java.util.Date getTime() {
		return this.time;
	}
	public void setTemperature(java.lang.Float value) {
		this.temperature = value;
	}
	
	public java.lang.Float getTemperature() {
		return this.temperature;
	}
	public void setDataYear(java.lang.String value) {
		this.dataYear = value;
	}
	
	public java.lang.String getDataYear() {
		return this.dataYear;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("StationId",getStationId())
			.append("Time",getTime())
			.append("Temperature",getTemperature())
			.append("DataYear",getDataYear())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof TemperatureInfo == false) return false;
		if(this == obj) return true;
		TemperatureInfo other = (TemperatureInfo)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
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
}

