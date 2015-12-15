/**
 * Classname:com.dqs.util.DataImport
 * Version info:V1.0
 * Date:2012-7-30 
 * Copyright notice: minshengLife
 */
package com.dqs.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.steven.framework.util.StringTokenizerUtils;

/**
 * @author Steven
 * @version 1.0
 * @since 1.0
 */
public class DataImport {

    /**
     * @param args
     */
    public static void main(String[] args) {
	// TODO Auto-generated method stub
        StringBuffer  dataStr=new StringBuffer();
        Calendar c = Calendar.getInstance();
        c.set(2008, 0, 1, 0, 0,0);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
	File file=new File("E:\\workspace\\dqs-shareplatform\\src\\com\\dqs\\util\\pd5E0801.TXT");
	try {
	    FileReader reader=new FileReader(file);
	    int ch = 0;
	    while((ch = reader.read())!=-1 )
	    {
		dataStr.append((char)ch);
	    }
	    String[] strs=StringTokenizerUtils.split(dataStr.toString(), " ");
	    for(String item:strs){
		if(item.trim().length()>0){
		    
		    System.out.println(df.format(c.getTime())+" -- " +item);
		    c.add(Calendar.HOUR_OF_DAY, 1);
		}
	    }
	    
	} catch (FileNotFoundException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }

}
