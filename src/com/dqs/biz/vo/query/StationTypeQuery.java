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


public class StationTypeQuery extends BaseQuery implements Serializable {
    //序列化,请自动生成
    private static final long serialVersionUID = 0L;
    

	/** 编号 */
	private java.lang.Integer code;
	/** 类型名称 */
	private java.lang.String name;

	public java.lang.Integer getCode() {
		return this.code;
	}
	
	public void setCode(java.lang.Integer value) {
		this.code = value;
	}
	
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

