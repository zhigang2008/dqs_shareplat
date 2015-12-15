package com.dqs.biz.action;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dqs.biz.model.DownloadRecord;
import com.dqs.biz.service.DownloadRecordManager;
import com.steven.Constants;
import com.steven.core.model.User;
import com.steven.framework.base.BaseStruts2Action;

/**
 * @author steven
 * @version 1.0
 * @since 1.0
 */


public class EarthStressAction extends BaseStruts2Action {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4736590820250553765L;
	/**服务管理*/
	private DownloadRecordManager downloadRecordManager;
	private final static String fileDir="/u/file/earth_stress/datafiles/";
	private String downLoadFileName;
	private String fileCatalog;
	private String fileName;



	
	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
	public void setDownloadRecordManager(DownloadRecordManager manager) {
		this.downloadRecordManager = manager;
	}	
	
	/** 下载文件 */
	public String execute() {
		this.log.debug("download action");
		//下载记录
		downloadRecordManager.downloadRecord(this.fileCatalog,this.fileName,this.getRequest());
		
		//文件下载
		String filePath=this.fileDir+this.fileName;
        //System.out.println("==============="+filePath);
		inputStream=ServletActionContext.getServletContext().getResourceAsStream(filePath);
		if (inputStream == null) {  
			return "fileNotExist"; 
        }  
		
		return super.SUCCESS;
	}

	public String getFileCatalog() {
		return fileCatalog;
	}

	public void setFileCatalog(String fileCatalog) {
		this.fileCatalog = fileCatalog;
	}

	public void setDownLoadFileName(String downLoadFileName) {
		this.downLoadFileName = downLoadFileName;
	}
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	/**下载文件名编码转换
	 * @return
	 */
	public String getDownLoadFileName() {
		log.warn(this.fileName);
	
		this.downLoadFileName=this.fileName.replaceAll(" ", "_");
			try {
				this.downLoadFileName=new String(this.downLoadFileName.getBytes(),"ISO8859-1");
			} catch (UnsupportedEncodingException e) {
				this.log.warn("文件名编码转换失败");
			}
		log.warn(this.downLoadFileName);
		return downLoadFileName;
	}
	
}
