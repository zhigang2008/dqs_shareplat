package com.dqs.biz.model;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import java.util.*;

import com.steven.framework.base.*;
import com.steven.framework.util.*;

import com.steven.framework.util.*;
import com.steven.framework.common.web.util.*;
import com.steven.framework.core.page.*;

import com.dqs.biz.model.*;
import com.dqs.biz.dao.*;
import com.dqs.biz.service.*;
import com.dqs.biz.vo.query.*;

/**
 * @author steven
 * @version 1.0
 * @since 1.0
 */


public class BoreholeStationItem extends BaseEntity implements java.io.Serializable{
        //序列化,请重新生成
	private static final long serialVersionUID = 0L;
	
	//表别名
	public static final String TABLE_ALIAS = "地壳应力测量项";
	//字段名称
	public static final String ALIAS_ID = "序号";
	public static final String ALIAS_CODE = "代码";
	public static final String ALIAS_NAME = "测量项";
	public static final String ALIAS_NOTE = "备注";
	public static final String ALIAS_SORTNO = "排序";
	
	//date formats
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
       /**
        * 序号       db_column: ID 
        */	
	//
	private java.lang.Long id;
       /**
        * 代码       db_column: CODE 
        */	
	//@NotBlank @Length(max=30)
	private java.lang.String code;
       /**
        * 测量项       db_column: NAME 
        */	
	//@NotBlank @Length(max=60)
	private java.lang.String name;
       /**
        * 备注       db_column: NOTE 
        */	
	//@Length(max=100)
	private java.lang.String note;
       /**
        * 排序       db_column: SORTNO 
        */	
	//@NotNull 
	private java.lang.Long sortno;
	//columns END

	public BoreholeStationItem(){
	}

	public BoreholeStationItem(
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
	public void setNote(java.lang.String value) {
		this.note = value;
	}
	
	public java.lang.String getNote() {
		return this.note;
	}
	public void setSortno(java.lang.Long value) {
		this.sortno = value;
	}
	
	public java.lang.Long getSortno() {
		return this.sortno;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Code",getCode())
			.append("Name",getName())
			.append("Note",getNote())
			.append("Sortno",getSortno())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof BoreholeStationItem == false) return false;
		if(this == obj) return true;
		BoreholeStationItem other = (BoreholeStationItem)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

