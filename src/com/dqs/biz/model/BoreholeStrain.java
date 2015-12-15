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


public class BoreholeStrain extends BaseEntity implements java.io.Serializable{

	
	/**
     * 
     */
    private static final long serialVersionUID = -384668485213833803L;
	//表别名
	public static final String TABLE_ALIAS = "钻孔应变数据";
	//字段名称
	public static final String ALIAS_STATION_ID = "台站编号";
	public static final String ALIAS_OBSERVE_TIME = "观测时间";
	public static final String ALIAS_OBSERVE_VALUE = "观测值";
	public static final String ALIAS_COL_YEAR = "年度";
	public static final String ALIAS_TABLE_NAME = "数据表名";
	public static final String ALIAS_COLUMN_NAME = "数据字段名";
	
	//date formats
	public static final String FORMAT_OBSERVE_TIME = "yyyy-MM-dd:HH";
	//格式化方式
	//static DecimalFormat df=new DecimalFormat("###,###,###.00000");
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
       /**
        * 台站编号       db_column: STATION_ID 
        */	
	//@NotNull 
	private java.lang.Long stationId;
       /**
        * 观测时间       db_column: OBSERVE_TIME 
        */	
	//
	private java.util.Date observeTime;
       /**
        * 观测值       db_column: OBSERVE_VALUE 
        */	
	//
	private java.lang.Float observeValue;
       /**
        * 年度       db_column: COL_YEAR 
        */	
	//@Length(max=10)
	private java.lang.String colYear;
       /**
        * 数据表名       db_column: TABLE_NAME 
        */	
	//@Length(max=50)
	private java.lang.String tableName;
       /**
        * 数据字段名       db_column: COLUMN_NAME 
        */	
	//@Length(max=50)
	private java.lang.String columnName;
	//columns END

	public BoreholeStrain(){
	}

	public BoreholeStrain(
		java.util.Date observeTime
	){
		this.observeTime = observeTime;
	}

	public void setStationId(java.lang.Long value) {
		this.stationId = value;
	}
	
	public java.lang.Long getStationId() {
		return this.stationId;
	}
	public String getObserveTimeString() {
		return DateConvertUtils.format(getObserveTime(), FORMAT_OBSERVE_TIME);
	}
	public void setObserveTimeString(String value) {
		setObserveTime(DateConvertUtils.parse(value, FORMAT_OBSERVE_TIME,java.util.Date.class));
	}
	
	public void setObserveTime(java.util.Date value) {
		this.observeTime = value;
	}
	
	public java.util.Date getObserveTime() {
		return this.observeTime;
	}
	public void setObserveValue(java.lang.Float value) {
		this.observeValue = value;
	}
	
	public java.lang.Float getObserveValue() {
		return this.observeValue;
	}
	
//	public String getFormatObserveValue(){
//		if(this.observeValue!=null){
//		return df.format(this.observeValue);
//		}
//		else{
//			return null;
//		}
//	}
	
	public void setColYear(java.lang.String value) {
		this.colYear = value;
	}
	
	public java.lang.String getColYear() {
		return this.colYear;
	}
	public void setTableName(java.lang.String value) {
		this.tableName = value;
	}
	
	public java.lang.String getTableName() {
		return this.tableName;
	}
	public void setColumnName(java.lang.String value) {
		this.columnName = value;
	}
	
	public java.lang.String getColumnName() {
		return this.columnName;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("StationId",getStationId())
			.append("ObserveTime",getObserveTime())
			.append("ObserveValue",getObserveValue())
			.append("ColYear",getColYear())
			.append("TableName",getTableName())
			.append("ColumnName",getColumnName())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getObserveTime())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof BoreholeStrain == false) return false;
		if(this == obj) return true;
		BoreholeStrain other = (BoreholeStrain)obj;
		return new EqualsBuilder()
			.append(getObserveTime(),other.getObserveTime())
			.isEquals();
	}
}

