/**
 * 
 */
package com.dqs.biz.action;

import java.io.UnsupportedEncodingException;

import com.dqs.biz.service.DownloadRecordManager;
import com.steven.util.fileupload.action.DownloadAction;

/**
 * @author steven
 *
 */
public class DownloadPlusAction extends DownloadAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1425686004122099958L;
	/**服务管理*/
	private DownloadRecordManager downloadRecordManager;
	private String fileCatalog;
	private String downLoadFileName;
	
	@Override
	public String execute() {
		//记录下载历史
		this.downloadRecordManager.downloadRecord(this.getFileCatalog(), this.getFileName(), this.getRequest());
		
		return super.execute();
	}
	
	
	public DownloadRecordManager getDownloadRecordManager() {
		return downloadRecordManager;
	}
	public void setDownloadRecordManager(DownloadRecordManager downloadRecordManager) {
		this.downloadRecordManager = downloadRecordManager;
	}


	public String getFileCatalog() {
		return fileCatalog;
	}


	public void setFileCatalog(String fileCatalog) {
		this.fileCatalog = fileCatalog;
	}
	
	/**下载文件名编码转换
	 * @return
	 */
	public String getDownLoadFileName() {
		String agent = super.getRequest().getHeader("USER-AGENT").toLowerCase();
		
		String extend = getFilePath().substring(getFilePath().lastIndexOf("."));
		downLoadFileName = getFileName().replaceAll(" ", "_");
		downLoadFileName = downLoadFileName + extend;
		try {
			if(agent.indexOf("firefox") >= 0){
				downLoadFileName = new String(downLoadFileName.getBytes(), "ISO8859-1");
			}else{
				downLoadFileName = new String(downLoadFileName.getBytes(), "ISO8859-1");
			}
		} catch (UnsupportedEncodingException e) {
			log.warn("文件名编码转换失败");

		}
		return downLoadFileName;
	}

}
