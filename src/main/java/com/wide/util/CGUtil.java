package com.wide.util;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class CGUtil {
	
	/**
	 * @author cg
	 * 
	 * */
	public static String createUUid(){
		UUID uuid = UUID.randomUUID();
		return uuid+"";
	}
	/**
	 * @author cg
	 * @param lastnum 上级num
	 * @param maxnum 本级别最大num
	 * @return sst当前最大的sort
	 * */
	public static Double createSort(Double lastnum ,Double maxnum ){
		String sst ="";
		String maxstr = maxnum+"";
		if(maxnum<1){
			if(lastnum>0){
				sst=lastnum+"1";
			}else{				
				sst="1";
			}
		}else{
			String[] maxs = maxstr.split("[.]");
			if(Integer.parseInt(maxs[1])>0){
				Double dwg=Math.pow(10,Double.parseDouble(maxs[1].length()+"")) * maxnum + 1;//现在最大的排序数
				dwg = dwg/Math.pow(10,Double.parseDouble(maxs[1].length()+""));
				sst = String.format("%.2f", dwg)+"";
			}else{
				sst = (maxnum+1)+"";
			}
		}
 		return Double.parseDouble(sst);
	}
	
	/**
	 * @author cg
	 * @param lastnum 上级num
	 * @return 当前级别数
	 **/
	public static int createLevelNum(Double lastnum){
		String zstr = (lastnum+"").split("[.]")[0];
		String xstr = (lastnum+"").split("[.]")[1];
		xstr = xstr.replace("0", "");
		if(xstr.length()==0){
			int levelnum = zstr.length()+1;
			return levelnum;
		}else {
			int levelnum = zstr.length()+1+xstr.length();
			return levelnum;
		}
			
		
	} 
	/**
	 * @author cg
	 * @param str 需要截取的字符串
	 * @param sprit 标识符
	 * @return List<String>
	 * */
	public static List<String> cutOffString(String str,String sprit){
		String[] strs = str.split("["+sprit+"]");
		List<String> list = new ArrayList<String>();
		for(int i = 0;i<strs.length;i++){
			if(strs[i]!=null&&!strs[i].equals("")){
				list.add(strs[i]);
			}
		}
		return list;
	}
	
}
