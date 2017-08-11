# --添加模块
INSERT INTO sys_application (id, application_code, application_name, application_desc)
VALUES (1, 1001, '流量充值平台', '流量充值后台管理模块');

# --添加菜单
INSERT INTO sys_menu (id, menu_no, application_code, menu_parent_no, menu_order, menu_name, menu_url, menu_icon, is_visible, is_leaf)
VALUES (1, 1, 1001, NULL, 1, '管理员管理', NULL, 'Hui-iconfont-root', TRUE, FALSE);
INSERT INTO sys_menu (id, menu_no, application_code, menu_parent_no, menu_order, menu_name, menu_url, menu_icon, is_visible, is_leaf)
VALUES (2, 101, 1001, 1, 1, '管理员列表', 'admin-list.html', NULL, TRUE, TRUE);
INSERT INTO sys_menu (id, menu_no, application_code, menu_parent_no, menu_order, menu_name, menu_url, menu_icon, is_visible, is_leaf)
VALUES (3, 102, 1001, 1, 2, '权限管理', 'admin-permission.html', NULL, TRUE, TRUE);
INSERT INTO sys_menu (id, menu_no, application_code, menu_parent_no, menu_order, menu_name, menu_url, menu_type, menu_icon, is_visible, is_leaf)
VALUES (9, 103, 1001, 101, 3, '管理员添加', 'admin-add.html', 2, NULL, TRUE, TRUE);
INSERT INTO sys_menu (id, menu_no, application_code, menu_parent_no, menu_order, menu_name, menu_url, menu_type, menu_icon, is_visible, is_leaf)
VALUES (10, 104, 1001, 101, 4, '管理员修改', 'admin-edit.html', 2, NULL, TRUE, TRUE);
INSERT INTO sys_menu (id, menu_no, application_code, menu_parent_no, menu_order, menu_name, menu_url, menu_type, menu_icon, is_visible, is_leaf)
VALUES (11, 105, 1001, 101, 5, '管理员删除', 'admin-delete.html', 2, NULL, TRUE, TRUE);
INSERT INTO sys_menu (id, menu_no, application_code, menu_parent_no, menu_order, menu_name, menu_url, menu_type, menu_icon, is_visible, is_leaf)
VALUES (12, 106, 1001, 101, 6, '修改密码', 'admin-pass.html', 2, NULL, TRUE, TRUE);
INSERT INTO sys_menu (id, menu_no, application_code, menu_parent_no, menu_order, menu_name, menu_url, menu_type, menu_icon, is_visible, is_leaf)
VALUES (13, 107, 1001, 101, 7, '禁用', 'admin-forbid.html', 2, NULL, TRUE, TRUE);
INSERT INTO sys_menu (id, menu_no, application_code, menu_parent_no, menu_order, menu_name, menu_url, menu_type, menu_icon, is_visible, is_leaf)
VALUES (14, 108, 1001, 101, 8, '启用', 'admin-resume.html', 2, NULL, TRUE, TRUE);


INSERT INTO sys_menu (id, menu_no, application_code, menu_parent_no, menu_order, menu_name, menu_url, menu_icon, is_visible, is_leaf)
VALUES (4, 2, 1001, NULL, 99, '系统管理', NULL, 'Hui-iconfont-system', TRUE, FALSE);
INSERT INTO sys_menu (id, menu_no, application_code, menu_parent_no, menu_order, menu_name, menu_url, menu_icon, is_visible, is_leaf)
VALUES (5, 201, 1001, 2, 1, '系统日志', 'system-log.html', NULL, TRUE, TRUE);

INSERT INTO sys_menu (id, menu_no, application_code, menu_parent_no, menu_order, menu_name, menu_url, menu_icon, is_visible, is_leaf)
VALUES (6, 3, 1001, NULL, 2, '商家管理', NULL, 'Hui-iconfont-huangguan', TRUE, FALSE);
INSERT INTO sys_menu (id, menu_no, application_code, menu_parent_no, menu_order, menu_name, menu_url, menu_icon, is_visible, is_leaf)
VALUES (7, 301, 1001, 3, 1, '商家列表', 'merchant-list.html', NULL, TRUE, TRUE);
INSERT INTO sys_menu (id, menu_no, application_code, menu_parent_no, menu_order, menu_name, menu_url, menu_icon, is_visible, is_leaf)
VALUES (8, 302, 1001, 3, 2, '订单列表', 'order-list.html', NULL, TRUE, TRUE);

# --添加角色
INSERT INTO cf_role (id, role_name, role_desc, create_name, create_time)
VALUES (1, '超级管理员', '超级管理员权限组', 'admin', now());
INSERT INTO cf_role (id, role_name, role_desc, create_name, create_time)
VALUES (2, '普通管理员', '普通管理员权限组，只能查看订单', 'admin', now());
INSERT INTO cf_role (id, role_name, role_desc, create_name, create_time)
VALUES (3, '运营人员', '运营人员权限组，只能查看权限，不能修改权限', 'admin', now());

# --添加管理员
INSERT INTO cf_admin (id, login_name, PASSWORD, real_name, mobile, email,
                      create_user_name, create_time, modify_name, update_time, available_flag, is_super)
VALUES (1, 'admin', '5dfa01d892c3cc6efece0a37c471ff9a', '超级管理员', '13439911995', '429110293@qq.com',
           'admin', now(), 'admin', NOW(), 1, 1);
INSERT INTO cf_admin (id, login_name, password, real_name, mobile, email,
                      create_user_name, create_time, modify_name, update_time, available_flag, is_super)
VALUES (2, 'wangdaojian', '123456', '王道健', '13439911995', '429110293@qq.com',
           'admin', now(), 'admin', NOW(), 1, 0);

# --添加管理员角色关联
INSERT INTO cf_adminRole (id, admin_id, role_id) VALUES (1, 1, 1);
INSERT INTO cf_adminRole (id, admin_id, role_id) VALUES (2, 2, 2);

# --添加角色权限关联--
# --普通管理员
INSERT INTO cf_privilege (id, master_type, master_id, access_type, access_no, is_operatation)
VALUES (1, 1, 3, 3, 1001, FALSE);
INSERT INTO cf_privilege (id, master_type, master_id, access_type, access_no, is_operatation)
VALUES (2, 1, 3, 1, 2, FALSE);
INSERT INTO cf_privilege (id, master_type, master_id, access_type, access_no, is_operatation)
VALUES (3, 1, 3, 1, 201, FALSE);
INSERT INTO cf_privilege (id, master_type, master_id, access_type, access_no, is_operatation)
VALUES (4, 1, 3, 1, 3, FALSE);
INSERT INTO cf_privilege (id, master_type, master_id, access_type, access_no, is_operatation)
VALUES (5, 1, 3, 1, 301, FALSE);
INSERT INTO cf_privilege (id, master_type, master_id, access_type, access_no, is_operatation)
VALUES (6, 1, 3, 1, 302, FALSE);
# --运营人员
INSERT INTO cf_privilege (id, master_type, master_id, access_type, access_no, is_operatation)
VALUES (7, 1, 2, 3, 1001, FALSE);
INSERT INTO cf_privilege (id, master_type, master_id, access_type, access_no, is_operatation)
VALUES (8, 1, 2, 1, 1, FALSE);
INSERT INTO cf_privilege (id, master_type, master_id, access_type, access_no, is_operatation)
VALUES (9, 1, 2, 1, 101, FALSE);
INSERT INTO cf_privilege (id, master_type, master_id, access_type, access_no, is_operatation)
VALUES (10, 1, 2, 1, 102, FALSE);
INSERT INTO cf_privilege (id, master_type, master_id, access_type, access_no, is_operatation)
VALUES (11, 1, 2, 1, 2, FALSE);
INSERT INTO cf_privilege (id, master_type, master_id, access_type, access_no, is_operatation)
VALUES (12, 1, 2, 1, 201, FALSE);
INSERT INTO cf_privilege (id, master_type, master_id, access_type, access_no, is_operatation)
VALUES (13, 1, 2, 1, 3, FALSE);
INSERT INTO cf_privilege (id, master_type, master_id, access_type, access_no, is_operatation)
VALUES (14, 1, 2, 1, 301, FALSE);
INSERT INTO cf_privilege (id, master_type, master_id, access_type, access_no, is_operatation)
VALUES (15, 1, 2, 1, 302, FALSE);

