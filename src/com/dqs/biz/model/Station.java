package com.dqs.biz.model;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.steven.core.model.Region;
import com.steven.framework.base.BaseEntity;

/**
 * @author steven
 * @version 1.0
 * @since 1.0
 */


public class Station extends BaseEntity implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6596296735769414192L;
	//表别名
	public static final String TABLE_ALIAS = "台站";
	//字段名称
	public static final String ALIAS_ID = "序号";
	public static final String ALIAS_REGION_CODE = "地区";
	public static final String ALIAS_CODE = "编号";
	public static final String ALIAS_NAME = "名称";
	public static final String ALIAS_LONGITUDE = "经度";
	public static final String ALIAS_LATITUDE = "纬度";
	public static final String ALIAS_HIGHT = "海拔";
	public static final String ALIAS_UNIT = "位置";
	public static final String ALIAS_WELL_TYPE_CODE = "钻孔类型";
	public static final String ALIAS_WELL_DEPTH = "钻孔深度";
	public static final String ALIAS_OBSERVATE_DEPTH = "观测深度";
	public static final String ALIAS_LITHOLOGY = "岩性";
	public static final String ALIAS_TEMPERATURE = "温度";
	public static final String ALIAS_OBSERVATE_TIME = "观测时间";
	public static final String ALIAS_STATION_TYPE_CODE = "台站类型";
	public static final String ALIAS_ZM_CODE = "地区简写代码";
	
	//date formats
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
       /**
        * 序号       db_column: ID 
        */	
	//
	private java.lang.Long id;
       /**
        * 地区       db_column: REGION_CODE 
        */	
	//@NotBlank @Length(max=30)
	private java.lang.String regionCode;
       /**
        * 编号       db_column: CODE 
        */	
	//@NotBlank @Length(max=10)
	private java.lang.String code;
       /**
        * 名称       db_column: NAME 
        */	
	//@NotBlank @Length(max=100)
	private java.lang.String name;
       /**
        * 经度       db_column: LONGITUDE 
        */	
	//@Length(max=50)
	private java.lang.String longitude;
       /**
        * 纬度       db_column: LATITUDE 
        */	
	//@Length(max=50)
	private java.lang.String latitude;
       /**
        * 海拔       db_column: HIGHT 
        */	
	//
	private java.lang.Long hight;
       /**
        * 位置       db_column: UNIT 
        */	
	//@Length(max=50)
	private java.lang.String unit;
       /**
        * 钻孔类型       db_column: WELL_TYPE_CODE 
        */	
	//
	private java.lang.Integer wellTypeCode;
       /**
        * 钻孔深度       db_column: WELL_DEPTH 
        */	
	//
	private java.lang.Long wellDepth;
       /**
        * 观测深度       db_column: OBSERVATE_DEPTH 
        */	
	//
	private java.lang.Long observateDepth;
       /**
        * 岩性       db_column: LITHOLOGY 
        */	
	//@Length(max=50)
	private java.lang.String lithology;
       /**
        * 温度       db_column: TEMPERATURE 
        */	
	//
	private java.lang.Long temperature;
       /**
        * 观测时间       db_column: OBSERVATE_TIME 
        */	
	//@Length(max=20)
	private java.lang.String observateTime;
       /**
        * 台站类型       db_column: STATION_TYPE_CODE 
        */	
	//
	private java.lang.Integer stationTypeCode;
       /**
        * 地区简写代码       db_column: ZM_CODE 
        */	
	//@Length(max=10)
	private java.lang.String zmCode;
	
	private WellType wellType;
	private StationType stationType;
	private Region region;
	//columns END

	public Station(){
	}

	public Station(
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
	public void setRegionCode(java.lang.String value) {
		this.regionCode = value;
	}
	
	public java.lang.String getRegionCode() {
		return this.regionCode;
	}
	public void setCode(java.lang.String value) {
		this.code = value;
	}
	
	public java.lang.String getCode() {
		return this.code;
	}
	public void setName(java.lang.String value) {
		this.name = value;
	}
	
	public java.lang.String getName() {
		return this.name;
	}
	public void setLongitude(java.lang.String value) {
		this.longitude = value;
	}
	
	public java.lang.String getLongitude() {
		return this.longitude;
	}
	public void setLatitude(java.lang.String value) {
		this.latitude = value;
	}
	
	public java.lang.String getLatitude() {
		return this.latitude;
	}
	public void setHight(java.lang.Long value) {
		this.hight = value;
	}
	
	public java.lang.Long getHight() {
		return this.hight;
	}
	public void setUnit(java.lang.String value) {
		this.unit = value;
	}
	
	public java.lang.String getUnit() {
		return this.unit;
	}
	public void setWellTypeCode(java.lang.Integer value) {
		this.wellTypeCode = value;
	}

	
	public java.lang.Integer getWellTypeCode() {
		return this.wellTypeCode;
	}
	public void setWellDepth(java.lang.Long value) {
		this.wellDepth = value;
	}
	
	public java.lang.Long getWellDepth() {
		return this.wellDepth;
	}
	public void setObservateDepth(java.lang.Long value) {
		this.observateDepth = value;
	}
	
	public java.lang.Long getObservateDepth() {
		return this.observateDepth;
	}
	public void setLithology(java.lang.String value) {
		this.lithology = value;
	}
	
	public java.lang.String getLithology() {
		return this.lithology;
	}
	public void setTemperature(java.lang.Long value) {
		this.temperature = value;
	}
	
	public java.lang.Long getTemperature() {
		return this.temperature;
	}
	public void setObservateTime(java.lang.String value) {
		this.observateTime = value;
	}
	
	public java.lang.String getObservateTime() {
		return this.observateTime;
	}
	public void setStationTypeCode(java.lang.Integer value) {
		this.stationTypeCode = value;
	}
	
	public java.lang.Integer getStationTypeCode() {
		return this.stationTypeCode;
	}
	public void setZmCode(java.lang.String value) {
		this.zmCode = value;
	}
	
	public java.lang.String getZmCode() {
		return this.zmCode;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("RegionCode",getRegionCode())
			.append("Code",getCode())
			.append("Name",getName())
			.append("Longitude",getLongitude())
			.append("Latitude",getLatitude())
			.append("Hight",getHight())
			.append("Unit",getUnit())
			.append("WellTypeCode",getWellTypeCode())
			.append("WellDepth",getWellDepth())
			.append("ObservateDepth",getObservateDepth())
			.append("Lithology",getLithology())
			.append("Temperature",getTemperature())
			.append("ObservateTime",getObservateTime())
			.append("StationTypeCode",getStationTypeCode())
			.append("ZmCode",getZmCode())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof Station == false) return false;
		if(this == obj) return true;
		Station other = (Station)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}

	/**
	 * @return the wellType
	 */
	public WellType getWellType() {
		return wellType;
	}

	/**
	 * @param wellType the wellType to set
	 */
	public void setWellType(WellType wellType) {
		this.wellType = wellType;
	}

	/**
	 * @return the stationType
	 */
	public StationType getStationType() {
		return stationType;
	}

	/**
	 * @param stationType the stationType to set
	 */
	public void setStationType(StationType stationType) {
		this.stationType = stationType;
	}

	/**
	 * @return the region
	 */
	public Region getRegion() {
		return region;
	}

	/**
	 * @param region the region to set
	 */
	public void setRegion(Region region) {
		this.region = region;
	}
}

