package com.bupt.flowpackage.common.domain;

/**
* @Description: 全局session对象
* @author wangdaojian
* @company 摩尔科技有限公司版权所有
* @date 2017年6月19日 上午10:57:12
 */
public class SessionVo extends BaseBean {

	private static final long serialVersionUID = 1L;
	/**管理员id*/
	private Integer adminId;
	/**登录用户名*/
	private String loginName;
	/**用户所属角色id*/
	private Integer roleId;
	/**用户所属角色名*/
	private String roleName;
	/**是否为超级管理员*/
	private boolean isSuper;
	/**当前模块code*/
	private Short applicationCode = 1001;
	
	public Short getApplicationCode() {
		return applicationCode;
	}
	public void setApplicationCode(Short applicationCode) {
		this.applicationCode = applicationCode;
	}
	public boolean isSuper() {
		return isSuper;
	}
	public void setSuper(boolean isSuper) {
		this.isSuper = isSuper;
	}
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
}
