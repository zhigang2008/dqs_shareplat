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


public class DownloadData extends BaseEntity implements java.io.Serializable{
        //序列化,请重新生成
	private static final long serialVersionUID = 0L;
	
	//表别名
	public static final String TABLE_ALIAS = "文件下载数据分析";
	//字段名称
	public static final String ALIAS_FILE_CATALOG = "文件目录";
	public static final String ALIAS_FILE_NAME = "文件名称";
	public static final String ALIAS_DOWNLOAD_COUNT = "下载数量";
	public static final String ALIAS_UPDATE_TIME = "最近更新时间";
	
	//date formats
	public static final String FORMAT_UPDATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
       /**
        * 文件目录       db_column: FILE_CATALOG 
        */	
	//@Length(max=100)
	private java.lang.String fileCatalog;
       /**
        * 文件名称       db_column: FILE_NAME 
        */	
	//@Length(max=100)
	private java.lang.String fileName;
       /**
        * 下载数量       db_column: DOWNLOAD_COUNT 
        */	
	//@NotNull 
	private java.lang.Long downloadCount;
       /**
        * 最近更新时间       db_column: UPDATE_TIME 
        */	
	//
	private java.util.Date updateTime;
	//columns END

	public DownloadData(){
	}

	public DownloadData(
		java.lang.String fileCatalog,
		java.lang.String fileName
	){
		this.fileCatalog = fileCatalog;
		this.fileName = fileName;
	}

	public void setFileCatalog(java.lang.String value) {
		this.fileCatalog = value;
	}
	
	public java.lang.String getFileCatalog() {
		return this.fileCatalog;
	}
	public void setFileName(java.lang.String value) {
		this.fileName = value;
	}
	
	public java.lang.String getFileName() {
		return this.fileName;
	}
	public void setDownloadCount(java.lang.Long value) {
		this.downloadCount = value;
	}
	
	public java.lang.Long getDownloadCount() {
		return this.downloadCount;
	}
	public String getUpdateTimeString() {
		return DateConvertUtils.format(getUpdateTime(), FORMAT_UPDATE_TIME);
	}
	public void setUpdateTimeString(String value) {
		setUpdateTime(DateConvertUtils.parse(value, FORMAT_UPDATE_TIME,java.util.Date.class));
	}
	
	public void setUpdateTime(java.util.Date value) {
		this.updateTime = value;
	}
	
	public java.util.Date getUpdateTime() {
		return this.updateTime;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("FileCatalog",getFileCatalog())
			.append("FileName",getFileName())
			.append("DownloadCount",getDownloadCount())
			.append("UpdateTime",getUpdateTime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getFileCatalog())
			.append(getFileName())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof DownloadData == false) return false;
		if(this == obj) return true;
		DownloadData other = (DownloadData)obj;
		return new EqualsBuilder()
			.append(getFileCatalog(),other.getFileCatalog())
			.append(getFileName(),other.getFileName())
			.isEquals();
	}
}

