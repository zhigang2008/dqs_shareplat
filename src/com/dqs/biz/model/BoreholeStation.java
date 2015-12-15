package com.dqs.biz.model;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.steven.framework.base.BaseEntity;

/**
 * @author steven
 * @version 1.0
 * @since 1.0
 */


public class BoreholeStation extends BaseEntity implements java.io.Serializable{

	
	/**
     * 
     */
    private static final long serialVersionUID = -1738463234787740151L;
	//表别名
	public static final String TABLE_ALIAS = "钻孔应变台站信息";
	//字段名称
	public static final String ALIAS_PROVINCE_CODE = "省份代码";
	public static final String ALIAS_PROVINCE_CNAME = "省份";
	public static final String ALIAS_STATION_CODE = "台站代码";
	public static final String ALIAS_STATION_CNAME = "台站名称";
	public static final String ALIAS_ITEM_CODE = "观测项代码";
	public static final String ALIAS_ITEM_CNAME = "观测项";
	public static final String ALIAS_ID = "序号";
	
	//date formats
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
       /**
        * 省份代码       db_column: PROVINCE_CODE 
        */	
	//@NotBlank @Length(max=20)
	private java.lang.String provinceCode;
       /**
        * 省份       db_column: PROVINCE_CNAME 
        */	
	//@Length(max=20)
	private java.lang.String provinceCname;
       /**
        * 台站代码       db_column: STATION_CODE 
        */	
	//@NotBlank @Length(max=20)
	private java.lang.String stationCode;
       /**
        * 台站名称       db_column: STATION_CNAME 
        */	
	//@Length(max=20)
	private java.lang.String stationCname;
       /**
        * 观测项代码       db_column: ITEM_CODE 
        */	
	//@NotBlank @Length(max=20)
	private java.lang.String itemCode;
       /**
        * 观测项       db_column: ITEM_CNAME 
        */	
	//@Length(max=20)
	private java.lang.String itemCname;
       /**
        * 序号       db_column: ID 
        */	
	//
	private java.lang.Long id;
	//columns END

	public BoreholeStation(){
	}

	public BoreholeStation(
		java.lang.Long id
	){
		this.id = id;
	}

	public void setProvinceCode(java.lang.String value) {
		this.provinceCode = value;
	}
	
	public java.lang.String getProvinceCode() {
	    if(this.provinceCode!=null){
		return this.provinceCode.toUpperCase();
	    }else{
		return this.provinceCode;
	    }
		
	}
	public void setProvinceCname(java.lang.String value) {
		this.provinceCname = value;
	}
	
	public java.lang.String getProvinceCname() {
		return this.provinceCname;
	}
	public void setStationCode(java.lang.String value) {
		this.stationCode = value;
	}
	
	public java.lang.String getStationCode() {
	        if(this.stationCode!=null){
	            return this.stationCode.toUpperCase();
	        }else{
	            return this.stationCode;
	        }
		
	}
	public void setStationCname(java.lang.String value) {
		this.stationCname = value;
	}
	
	public java.lang.String getStationCname() {
		return this.stationCname;
	}
	public void setItemCode(java.lang.String value) {
		this.itemCode = value;
	}
	
	public java.lang.String getItemCode() {
	        if(itemCode!=null){
		 return this.itemCode.toUpperCase();
	        }else{
	            return this.itemCode;
	        }
	}
	public void setItemCname(java.lang.String value) {
		this.itemCname = value;
	}
	
	public java.lang.String getItemCname() {
		return this.itemCname;
	}
	public void setId(java.lang.Long value) {
		this.id = value;
	}
	
	public java.lang.Long getId() {
		return this.id;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("ProvinceCode",getProvinceCode())
			.append("ProvinceCname",getProvinceCname())
			.append("StationCode",getStationCode())
			.append("StationCname",getStationCname())
			.append("ItemCode",getItemCode())
			.append("ItemCname",getItemCname())
			.append("Id",getId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof BoreholeStation == false) return false;
		if(this == obj) return true;
		BoreholeStation other = (BoreholeStation)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

