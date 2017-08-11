DROP TABLE IF EXISTS cf_admin;

/*==============================================================*/
/* Table: cf_admin                                              */
/*==============================================================*/
CREATE TABLE cf_admin
(
  id               INT         NOT NULL AUTO_INCREMENT
  COMMENT '主键',
  login_name       VARCHAR(32) NOT NULL
  COMMENT '账号',
  password         VARCHAR(48) NOT NULL
  COMMENT '密码',
  real_name        VARCHAR(32) COMMENT '真实姓名',
  sex              CHAR(1)              DEFAULT '1'
  COMMENT '性别 1男　2女',
  mobile           VARCHAR(16) COMMENT '手机号',
  email            VARCHAR(32) COMMENT '邮件',
  create_user_name VARCHAR(32) COMMENT '创建人',
  create_time      DATETIME COMMENT '创建时间',
  modify_name      VARCHAR(32) COMMENT '修改人名字',
  update_time      DATETIME COMMENT '更改时间',
  first_login_time DATETIME COMMENT '第一次登录时间',
  last_login_time  DATETIME COMMENT '最后一次登录时间',
  available_flag   BOOLEAN              DEFAULT TRUE
  COMMENT '是否可用',
  is_super         BOOLEAN              DEFAULT FALSE
  COMMENT '是否为超级管理员',
  admin_desc       TINYTEXT COMMENT '描述',
  PRIMARY KEY (id)
);

ALTER TABLE cf_admin
  COMMENT '管理员表';

DROP TABLE IF EXISTS cf_role;

/*==============================================================*/
/* Table: cf_role                                               */
/*==============================================================*/
CREATE TABLE cf_role
(
  id          INT NOT NULL AUTO_INCREMENT,
  role_name   VARCHAR(32) COMMENT '角色名称',
  role_desc   VARCHAR(256) COMMENT '角色描述',
  create_name VARCHAR(32) COMMENT '创建人',
  create_time DATETIME COMMENT '创建时间',
  role_level  TINYINT      DEFAULT 3
  COMMENT '角色等级 1 超级  2 高级  3 普通',
  modify_name VARCHAR(32) COMMENT '修改人',
  modify_time DATETIME COMMENT '修改时间',
  PRIMARY KEY (id)
);

ALTER TABLE cf_role
  COMMENT '角色表';

DROP TABLE IF EXISTS cf_adminRole;

/*==============================================================*/
/* Table: cf_adminRole                                          */
/*==============================================================*/
CREATE TABLE cf_adminRole
(
  id       INT NOT NULL AUTO_INCREMENT
  COMMENT '主键',
  admin_id INT COMMENT '管理员id',
  role_id  INT COMMENT '角色id',
  PRIMARY KEY (id)
);

ALTER TABLE cf_adminRole
  COMMENT '管理员角色关联表';

ALTER TABLE cf_adminRole
  ADD CONSTRAINT FK_Reference_1 FOREIGN KEY (role_id)
REFERENCES cf_role (id)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE cf_adminRole
  ADD CONSTRAINT FK_Reference_2 FOREIGN KEY (admin_id)
REFERENCES cf_admin (id)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;


DROP TABLE IF EXISTS cf_privilege;

/*==============================================================*/
/* Table: cf_privilege                                          */
/*==============================================================*/
CREATE TABLE cf_privilege
(
  id             INT NOT NULL AUTO_INCREMENT
  COMMENT '主键',
  master_type    TINYINT COMMENT '权限主体  1 角色 2 用户  ',
  master_id      INT COMMENT '权限主体id',
  access_type    TINYINT COMMENT '权限访问类型  1 菜单 2 按钮 3 模块',
  access_no      SMALLINT COMMENT '权限访问no  menuNo或者buttonNo或者applicationCode',
  is_operatation BOOLEAN COMMENT '禁止使用   默认false',
  PRIMARY KEY (id)
);

ALTER TABLE cf_privilege
  COMMENT '管理员权限表';

DROP TABLE IF EXISTS sys_application;

/*==============================================================*/
/* Table: sys_application                                       */
/*==============================================================*/
CREATE TABLE sys_application
(
  id               INT NOT NULL AUTO_INCREMENT
  COMMENT '主键',
  application_code SMALLINT COMMENT '模块code',
  application_url  VARCHAR(256) DEFAULT 'index.html'
  COMMENT '模块url',
  application_icon VARCHAR(256) DEFAULT 'Hui-iconfont-goods'
  COMMENT '模块icon',
  application_name VARCHAR(32) COMMENT '模块名称',
  application_desc VARCHAR(256) COMMENT '模块描述',
  PRIMARY KEY (id)
);
ALTER TABLE sys_application
  ADD UNIQUE (application_code);
ALTER TABLE sys_application
  COMMENT '系统模块';


DROP TABLE IF EXISTS sys_menu;

/*==============================================================*/
/* Table: sys_menu                                              */
/*==============================================================*/
CREATE TABLE sys_menu
(
  id               INT NOT NULL
  COMMENT '主键',
  menu_no          SMALLINT COMMENT '菜单编码',
  application_code SMALLINT COMMENT '模块code',
  menu_parent_no   SMALLINT COMMENT '父菜单编码',
  menu_order       SMALLINT COMMENT '菜单顺序',
  menu_name        VARCHAR(32) COMMENT '菜单名称',
  menu_url         VARCHAR(256) COMMENT '菜单url',
  menu_type        SMALLINT DEFAULT 1
  COMMENT '类型   1菜单  2 按钮或链接',
  menu_icon        VARCHAR(256) COMMENT '菜单icon',
  is_visible       BOOLEAN COMMENT '是否可用 1可用 0不可用',
  is_leaf          BOOLEAN,
  PRIMARY KEY (id)
);
ALTER TABLE sys_menu
  ADD UNIQUE (menu_no);
ALTER TABLE sys_menu
  COMMENT '系统菜单表';

DROP TABLE IF EXISTS sys_button;

/*==============================================================*/
/* Table: sys_button                                            */
/*==============================================================*/
CREATE TABLE sys_button
(
  id          INT NOT NULL AUTO_INCREMENT
  COMMENT '主键',
  btn_no      SMALLINT COMMENT '按钮编码',
  btn_name    VARCHAR(32) COMMENT '按钮名称',
  btn_class   VARCHAR(32) COMMENT '按钮类型',
  btn_icon    VARCHAR(32) COMMENT '按钮icon',
  menu_no     INT COMMENT '所属菜单id',
  init_status BOOLEAN COMMENT '初始化状态  1 可用 0 不可用',
  PRIMARY KEY (id)
);

ALTER TABLE sys_button
  COMMENT '系统按钮表';

CREATE TABLE sys_provinces
(
  id            INT         NOT NULL AUTO_INCREMENT
  COMMENT '主键',
  province_code VARCHAR(8)  NOT NULL
  COMMENT '省code',
  province_name VARCHAR(32) NOT NULL
  COMMENT '省名称',
  PRIMARY KEY (id)
);
ALTER TABLE sys_provinces
  COMMENT '省份表';

CREATE TABLE sys_cities
(
  id            INT         NOT NULL AUTO_INCREMENT
  COMMENT '主键',
  city_code     VARCHAR(8)  NOT NULL
  COMMENT '城市code',
  city_name     VARCHAR(32) NOT NULL
  COMMENT '城市名称',
  province_code VARCHAR(8)  NOT NULL
  COMMENT '省code',
  status        BOOLEAN              DEFAULT TRUE
  COMMENT '状态 1可用 0不可用',
  PRIMARY KEY (id)
);
ALTER TABLE sys_cities
  COMMENT '城市表';

CREATE TABLE sys_areas
(
  id        INT         NOT NULL AUTO_INCREMENT
  COMMENT '主键',
  area_code VARCHAR(8)  NOT NULL
  COMMENT '区域code',
  area_name VARCHAR(32) NOT NULL
  COMMENT '区域名称',
  city_code VARCHAR(8)  NOT NULL
  COMMENT '城市code',
  status    BOOLEAN              DEFAULT TRUE
  COMMENT '状态 1可用 0不可用',
  PRIMARY KEY (id)
);
ALTER TABLE sys_areas
  COMMENT '行政区域县区信息表';


