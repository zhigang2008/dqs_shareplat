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


public class WellType extends BaseEntity implements java.io.Serializable{
        //序列化,请重新生成
	private static final long serialVersionUID = 0L;
	
	//表别名
	public static final String TABLE_ALIAS = "钻孔类型";
	//字段名称
	public static final String ALIAS_CODE = "编号";
	public static final String ALIAS_NAME = "类型名称";
	
	//date formats
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
       /**
        * 编号       db_column: CODE 
        */	
	//
	private java.lang.Integer code;
       /**
        * 类型名称       db_column: NAME 
        */	
	//@NotBlank @Length(max=50)
	private java.lang.String name;
	//columns END

	public WellType(){
	}

	public WellType(
		java.lang.Integer code
	){
		this.code = code;
	}

	public void setCode(java.lang.Integer value) {
		this.code = value;
	}
	
	public java.lang.Integer getCode() {
		return this.code;
	}
	public void setName(java.lang.String value) {
		this.name = value;
	}
	
	public java.lang.String getName() {
		return this.name;
	}
	
//	private Set stations = new HashSet(0);
//	public void setStations(Set<Station> station){
//		this.stations = station;
//	}
//	
//	public Set<Station> getStations() {
//		return stations;
//	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Code",getCode())
			.append("Name",getName())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getCode())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof WellType == false) return false;
		if(this == obj) return true;
		WellType other = (WellType)obj;
		return new EqualsBuilder()
			.append(getCode(),other.getCode())
			.isEquals();
	}
}

