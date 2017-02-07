package com.wide.baseproject.sys.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.aop.Enhancer;
import com.jfinal.core.Controller;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wide.base.BaseController;
import com.wide.base.MailKit;
import com.wide.baseproject.sys.service.DictService;
import com.wide.baseproject.sys.service.LogService;
import com.wide.baseproject.sys.service.OfficeService;
import com.wide.baseproject.sys.service.RoleService;
import com.wide.baseproject.sys.service.UserService;
import com.wide.common.model.Dict;
import com.wide.common.model.Office;
import com.wide.common.model.Role;
import com.wide.common.model.User;
import com.wide.common.model.query.QueryUser;
import com.wide.config.UserToken;
import com.wide.constant.EnumFuncType;
import com.wide.constant.EnumOptType;
import com.wide.util.ExportController;
import com.wide.util.PathUtil;
import com.wide.validator.UserValidator;
import com.wide.viewmodel.DataTablesModel;
import com.wide.viewmodel.ViewUser;
import org.apache.shiro.crypto.hash.Sha256Hash;

public class UserController extends BaseController {
	private static final UserService userService = Enhancer
			.enhance(UserService.class);
	private static final RoleService roleService = Enhancer
			.enhance(RoleService.class);
	private static final DictService dictService = Enhancer
			.enhance(DictService.class);
	private static final OfficeService officeService = Enhancer
			.enhance(OfficeService.class);
	private static final LogService logService = Enhancer
			.enhance(LogService.class);	

	
	/**
	 * 获取当前UserToken
	 * @return UserToken
	 */
	public UserToken getCurrentUserToken(){
		HttpSession session = getSession();          //获取当前用户
		UserToken ut = (UserToken) session.getAttribute("userToken");
		User user = userService.getUser(ut.getVuser().getUser());
		
		return ut;
		
	}	
    
	public void index() {
		// 分页
		setAttr("userPage", User.dao.paginate(getParaToInt(0, 1), 10));
		redirect("/user/mainindex");
	}
	/**
	 * @author cg 用户管理
	 */
	public void add() {
		List<Dict> listd = dictService.getDictByType("1003");
		setAttr("listdict", listd);
        renderCG("userList.jsp");
	}

	/**
	 * @author cg Datetables分页显示
	 */
	public void addUserList() {
		QueryUser queryUser = new QueryUser();
		String usertype = getPara("usertype");
		queryUser.setUsertype(usertype == null || usertype.equals("") ? 0
				: Integer.parseInt(usertype));
		queryUser.setEndtime(getPara("endtime"));
		queryUser.setStarttime(getPara("starttime"));
		queryUser.setUsername(getPara("username"));
		DataTablesModel userpage = userService.getPageUser(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), queryUser);
		this.renderJson(userpage);
	}

	/**
	 * @author cg 保存个人信息
	 */
	@Before(UserValidator.class)
	public void save() {
		getModel(User.class).save();
		redirect("/user");
	}

	/**
	 * @author cg 编辑个人信息
	 */
	public void edit() {
		setAttr("user", User.dao.findById(getParaToInt()));
	}

	/**
	 * @author cg 更新个人信息
	 */
	@Before(UserValidator.class)
	public void update() {
		getModel(User.class).update();
		redirect("/user");
	}

	/**
	 * @author cg 我的面板
	 */

	public void addInfo() {			
		UserToken ut = getCurrentUserToken();
		ut.getVuser().setUser(userService.getUser(ut.getVuser().getUser()));
		setAttr("userToken", ut);
		String mark = getPara("message");
		setAttr("message", mark);
        renderCG("addinfo.jsp");
	}
	/**
	 * @author ycl 默认首页
	 */

	public void mainindex() {			
		UserToken ut = getCurrentUserToken();
		ut.getVuser().setUser(userService.getUser(ut.getVuser().getUser()));
		setAttr("userToken", ut);
		String mark = getPara("message");
		
		
		setAttr("message", mark);
        renderCG("main.jsp");
	}

	/**
	 * @author cg 更新个人信息
	 */	
	public void saveInfo() {
		User user = getModel(User.class);
		if(StrKit.notNull(user)){
		    user.update();
        }

	}

	/**
	 * @author cg 更新密码 
	 */
	public void addpass() {		
		String mark = getPara("message");
		setAttr("message", mark);
        renderCG("myEditPass.jsp");
	}

	/**
	 * @author cg 更新密码
	 */
	public void updatepass() {
        User user = getModel(User.class);
        if(StrKit.notNull(user)){
            user.setPassword(new Sha256Hash(user.getPassword(), user.getLoginName(), 1024).toBase64());
            user.update();
        }
		logService.saveLog(EnumOptType.password.getEnumKey(), EnumFuncType.user.getEnumKey(), userService.getUser(getCurrentUserToken().getVuser().getUser())); //用户密码修改日志保存
		redirect("/user/addpass?message=success", true);
	}

	/**
	 * @author cg 验证密码
	 */
	public void checkpass() {
		HttpSession session = getSession();
		UserToken ut = (UserToken) session.getAttribute("userToken");
		User user = userService.getUser(ut.getVuser().getUser());
        String pass = new Sha256Hash(getPara("oldpassword"), user.getLoginName(), 1024).toBase64();
		renderJson(pass.equals(user.getPassword()) ? 1 : 2);// 1输入正确、2输入错误
	}

	/**
	 * @author cg 增加用户
	 */
	public void adduserinfo() {
		String id = getPara("id");
		User user = userService.getUserById(id);
		List<Dict> listd = dictService.getDictByType("1003");
		List<Role> rolelist = roleService.getRoleAll();
		List<Role> rulist = Role.dao.getRoleByuserID(id);
		List<Office> officelist = officeService.getOfficeListByuserID(id);
		String officenames = "";
		String officeids = "";
		String roleids = "";
		if (officelist.size() > 0) {
			for (Office o : officelist) {
				officenames = officenames + "|" + o.getName();
				officeids = officeids + o.getId() + "|";
			}
		}
		if (rulist.size() > 0) {
			for (Role r : rulist) {
				roleids = roleids + "|" + r.getId();
			}
		}
		String mark = getPara("message");
		setAttr("listdict", listd);
		setAttr("message", mark);
		setAttr("user", user);
		if(user!=null){
			setAttr("utype", user.getUserType());
		}else{
			setAttr("utype", "0");
		}
		
		setAttr("rolelist", rolelist);
		setAttr("offids", officeids);
		setAttr("roleids", roleids);
		setAttr("officenames", officenames);
		renderLG("userInfo.jsp");
	}

	/**
	 * @author cg 保存用户
	 */
	//@Before(UserValidator.class)
	public void saveuserinfo() {		
		ViewUser vu = new ViewUser();	
		String roleids = getPara("roleids");
		String offids = getPara("offids");
		String userType = getPara("usertype");
		User user = getModel(User.class);
		user.setUserType(userType);
		user.setUpdateBy(userService.getUser(getCurrentUserToken().getVuser().getUser()).getId());
		user.setUpdateDate(new Date());
		vu.setOfficeids(offids);
		vu.setRoleids(roleids);
		vu.setUser(user);
		if(vu.getUser().getId() != null && !vu.getUser().getId().equals("")){
			logService.saveLog(EnumOptType.edit.getEnumKey(), EnumFuncType.user.getEnumKey(), userService.getUser(getCurrentUserToken().getVuser().getUser())); //用户修改日志保存
		}else {
			logService.saveLog(EnumOptType.add.getEnumKey(), EnumFuncType.user.getEnumKey(), userService.getUser(getCurrentUserToken().getVuser().getUser())); //用户添加日志保存
		}
		userService.saveuserinfo(vu, userService.getUser(getCurrentUserToken().getVuser().getUser()));
		
		
		redirect("/user/adduserinfo?message=success", true);
	}

	/**
	 * @author cg
	 * 注册用户
	 * */
	@Clear
	public void registerUser(){
		User user = getModel(User.class);
		int successType = 0 ;
		try{
			if(StrKit.notNull(user)){
				String id = createUUid();
                String password = new Sha256Hash("111111", user.getLoginName(), 1024).toBase64();
				user.setId(id);
				user.setCreateBy(id);
				user.setCreateDate(new Date());
				user.setUpdateBy(id);
				user.setUpdateDate(new Date());
				user.setUserType("1");
				user.setDelFlag("0");
                user.setPassword(password);
				user.save();
				successType = 1;
			}
		}catch (Exception e){
			e.printStackTrace();
		}

		redirect("/index?successType="+successType,true);
	}

	/**
	 * @author cg 删除用户
	 * */
	@Before(Tx.class)
	public boolean deluserinfo() {	
		String id = getPara("id");
		id = id == null ? "" : id;
		try {
			userService.deluserinfo(id);
			logService.saveLog(EnumOptType.del.getEnumKey(), EnumFuncType.user.getEnumKey(), userService.getUser(getCurrentUserToken().getVuser().getUser())); //用户删除日志保存
			renderJson("2");
		} catch (Exception e) {
			renderJson("1");
			e.printStackTrace();
		}

		return true;
	}

	/**
	 * @author cg 导出用户
	 * */
	public void exportUser() {		
		QueryUser queryUser = new QueryUser();
		String usertype = getPara("usertype");
		queryUser.setUsertype(usertype == null || usertype.equals("") ? 0
				: Integer.parseInt(usertype));
		queryUser.setEndtime(getPara("endtime"));
		queryUser.setStarttime(getPara("starttime"));
		queryUser.setUsername(getPara("username"));
		DataTablesModel userpage = userService.getPageUser(
				getParaToInt("userpages").intValue(), getParaToInt("userrp")
						.intValue(), queryUser);
		String[] heades = { "用户姓名", "用户登录名称", "用户邮箱", "用户电话", "用户类型", "是否启用" };
		ExportController.exportXLSRecord(userpage.getRows(), "用户管理", heades,
				"1", this.getResponse());
		logService.saveLog(EnumOptType.export.getEnumKey(), EnumFuncType.user.getEnumKey(), userService.getUser(getCurrentUserToken().getVuser().getUser())); //用户导出日志保存
		renderJson("导出成功");
	}
	 /**
	  * @author phm 重置密码
	  */
	 public void resetpassword(){
		 String id = getPara("id");
		 id = id==null?"":id;
		 try {
		     User user = User.dao.findById(id);
		     String password = new Sha256Hash("111111", user.getLoginName(), 1024).toBase64();
             String sql = "update sys_user set password='"+password+"' where id='"+id+"'" ;
			 Db.update(sql);
			 String mark = getPara("message");
			 setAttr("message", mark);		
			 logService.saveLog(EnumOptType.reset.getEnumKey(), EnumFuncType.user.getEnumKey(), userService.getUser(getCurrentUserToken().getVuser().getUser())); //用户密码重置日志保存
			 renderJson("0");
		} catch (Exception e) {
			renderJson("1");
			e.printStackTrace();
		}
	 }
	 /**
	  * @author phm 验证用户名是否重复
	  */
	 @Clear
	 public void checkloginname(){
		 String loginName = getPara("loginName");
		 try {
			if(loginName!=null&&loginName.equals("")!=true){
				 String sql = "select * from sys_user where login_name = '"+loginName+"' and del_flag ='0' " ;
				 List<Record> userlist = new ArrayList<Record>();
				 userlist =  Db.find(sql);
				 if(userlist.size()>0){
					 renderJson("1");
				 }else {
					 renderJson("0");
				}
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
	 }
	 /**
	  * @author cg 登录名验证
	  *
	  * */
	 @Clear
	  public void getloginname(){
	  	String bron = "true";
	  	String loginname = getPara("loginname");
		List<User> listuser = new ArrayList<User>();
		listuser= User.dao.find("select * from sys_user where login_name = ? ",loginname);
		if(listuser.size()>0){
			bron = "false";
		}
		renderText(bron);
	  }
    /**
     * @author cg 验证邮箱
     *
     * */
    @Clear
    public void getemail(){
        String bron = "true";
        String email = getPara("useremail");
        List<User> listuser = new ArrayList<User>();
        listuser= User.dao.find("select * from sys_user where email = ? ",email);
        if(listuser.size()>0){
            bron = "false";
        }
        renderText(bron);
    }
	  /**
       * @author cg 验证邮箱
       *
       * */
	  @Clear
       public void checkemail(){
          String bron = "false";
	      String email = getPara("email");
          List<User> listuser = new ArrayList<User>();
          listuser= User.dao.find("select * from sys_user where email = ? ",email);
          if(listuser.size()>0){
              bron = "true";
          }
          renderText(bron);
      }
    /**
     * @author cg 发送找回密码邮件
     *
     */
    @Clear
    public void sendReciveEmail(){
        //调用初始化函数
        String toMail = getPara("email");
        String successType = "3";
        String subject = "JfinalYBaseV1.2-密码找回邮件";
        String contenthead ="尊敬的客户您好：<p>您的密码为</p>";
        List<User> listuser = new ArrayList<User>();
        listuser= User.dao.find("select * from sys_user where email = ? ",toMail);

        String content ="尊敬的客户您好：<p>您的密码为";
        if(listuser.size()>0){
            content = content+listuser.get(0).getPassword()+"</p>";
        }
        String contentfoot ="<p>结束！</p>";

        MailKit.config();
        boolean bl = false;
        try{
            bl = MailKit.sendAndCc(toMail,"",subject,contenthead+content+contentfoot);
            successType = "4";
        }catch (Exception e){
            e.printStackTrace();
        }
        if(bl){
            redirect("/index?successType="+successType,true);
        }else{
            redirect("/index?successType="+successType,true);
        }
    }

}
