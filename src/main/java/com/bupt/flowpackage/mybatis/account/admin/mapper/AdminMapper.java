package com.bupt.flowpackage.mybatis.account.admin.mapper;

import java.util.List;

import com.bupt.flowpackage.common.annotation.MyBatisRepository;
import com.bupt.flowpackage.mybatis.account.admin.model.Admin;
import com.bupt.flowpackage.mybatis.account.adminrole.model.AdminRole;
@MyBatisRepository
public interface AdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    AdminRole selectByPrimaryKey(Integer id);
    
    Admin selectBySelective(Admin admin);
    /**
     * <p>获取管理员角色信息</p>   
     * @param @param admin
     * @param @return      
     * @return AdminRole
     */
    AdminRole selectAdminRoleInfo(AdminRole adminRole);
    /**
     * <p>获取管理员列表</p>   
     * @param @param adminRole
     * @param @return      
     * @return List<AdminRole>
     */
    List<AdminRole> selectAdminRoleInfoPage(AdminRole adminRole);
    
    int selectCountBySelective(Admin admin);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
}