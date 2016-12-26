package com.wide.base;


import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import com.jfinal.render.Render;
import com.wide.common.model.Menu;
import com.wide.common.model.User;
import com.wide.config.UserToken;
import com.jfinal.core.Controller;

public class BaseController extends Controller{
	public RenturnInfo returninfo;

	/**
	 * 获取usertoken
	 * */
	public UserToken getToken(){
		HttpSession session=getSession();
		UserToken ut=(UserToken) session.getAttribute("userToken");
		return ut;
	}

	/**
	 * 获取user
	 * */
	public User getUser(){
		UserToken ut = getToken();
		User user = null;
		if(ut!=null&&!ut.equals("")){
			user =ut.getVuser().getUser();
		}else{
			user = new User();
		}
		return user;
	}
	/**
	 * @author cg
	 * 生成uuid
	 * */
	public static String createUUid(){
		UUID uuid = UUID.randomUUID();
		return uuid+"";
	}

	public RenturnInfo getReturninfo() {
		return returninfo;
	}

	public void setReturninfo(RenturnInfo returninfo) {
		this.returninfo = returninfo;
	};


	/**
	 * @author cg
     * 重写render
	 * */

	public void renderCG(String view){
        List<Menu> menulist = new ArrayList<Menu>();
        menulist = Menu.dao.find("select * from sys_menu where href = ? ",this.getRequest().getServletPath());
        Menu menu = new Menu();
        if(menulist.size()>0){
            menu = menulist.get(0);
        }
        setAttr("menuparentidcg",menu.getParentId());//写入menu上层的id作为左边栏展开条件
	    setAttr("menuidcg",menu.getId());//写入menu的本层id作为左边栏展开条件
	    this.render(view);
    }




}
