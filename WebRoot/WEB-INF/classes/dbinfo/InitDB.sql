CREATE DATABASE `party` CHARACTER SET UTF8;
USE `party`;
CREATE TABLE `userinfo` (
       `id` INT NOT NULL auto_increment COMMENT '系统隐式ID',
       `studentid` VARCHAR(20) NOT NULL COMMENT '学号',
       `name` VARCHAR(20) NOT NULL COMMENT '姓名',
       `partybranchid` INT NOT NULL COMMENT '党支部编号',
       `birthday` DATE NOT NULL COMMENT '出生日期',
       `dormitory` VARCHAR(50) NOT NULL COMMENT '宿舍',
       `passwd` VARCHAR(50) NOT NULL COMMENT '密码',
       `telephone` VARCHAR(20) NOT NULL COMMENT '电话',
       `uclass` VARCHAR(20) NOT NULL COMMENT '班级',
       `gender` enum('m','f') NOT NULL COMMENT '性别',
       `nation` VARCHAR(10) NOT NULL COMMENT '民族',
       `applydate` DATE NOT NULL COMMENT '提交入党申请书时间',
       `job` VARCHAR(100) NOT NULL COMMENT '社会工作',
       `origo` VARCHAR(50) NOT NULL COMMENT '籍贯',
       `permission` INT NOT NULL COMMENT '权限：0.root 1.管理员，2.普通',
       `status` INT NOT NULL COMMENT '状态: 0.申请入党 1.入党积极分子 2.发展对象 3.预备党员 4.正式党员 5.关系转出',
       `next_status` INT NOT NULL COMMENT '可转状态: 0.不可转 1.入党积极分子 2.发展对象 3.预备党员 4.正式党员',
       `is_complete` INT NOT NULL COMMENT '提交材料完整性，该字段由外围程序维护......想维护的看python脚本去吧=_=',
       `be_passpartyclass_date` DATE NOT NULL COMMENT '党课通过时间',
       `be_activist_date` DATE NOT NULL COMMENT '确定为积极分子时间',
       `be_target_date` DATE NOT NULL COMMENT '确定为发展对象的时间',
       `be_probationary_date` DATE NOT NULL COMMENT '确定为预备党员的时间',
       `be_fullmember_date` DATE NOT NULL COMMENT '确定为正式党员的时间',
       UNIQUE (`studentid`),
       PRIMARY KEY(`id`)
) DEFAULT CHARSET=UTF8;

CREATE TABLE `intro`(
       `memid` INT NOT NULL COMMENT '积极分子ID',
       `introid` INT NOT NULL COMMENT '培养人ID',
       PRIMARY KEY (`memid`,`introid`)
) DEFAULT CHARSET=UTF8;

CREATE TABLE `PartyBranch`(
       `partybranchid` INT NOT NULL auto_increment COMMENT '党支部编号',
       `partybranchname` VARCHAR(50) NOT NULL COMMENT '党支部名称',
       `adminid` INT COMMENT '支部书记/管理员ID',
	PRIMARY KEY (`partybranchid`)
)DEFAULT CHARSET=UTF8;

CREATE TABLE `tmp_userinfo` (
       `id` INT NOT NULL COMMENT '系统隐式ID',
       `studentid` VARCHAR(20) NOT NULL COMMENT '学号',
       `name` VARCHAR(20) NOT NULL COMMENT '姓名',
       `partybranchid` INT NOT NULL COMMENT '党支部编号',
       `birthday` DATE NOT NULL COMMENT '出生日期',
       `dormitory` VARCHAR(50) NOT NULL COMMENT '宿舍',
       `passwd` VARCHAR(50) NOT NULL COMMENT '密码',
       `telephone` VARCHAR(20) NOT NULL COMMENT '电话',
       `uclass` VARCHAR(20) NOT NULL COMMENT '班级',
       `gender` enum('m','f') NOT NULL COMMENT '性别',
       `nation` VARCHAR(10) NOT NULL COMMENT '民族',
       `applydate` DATE NOT NULL COMMENT '提交入党申请书时间',
       `job` VARCHAR(100) NOT NULL COMMENT '社会工作',
       `origo` VARCHAR(50) NOT NULL COMMENT '籍贯',
       `permission` INT NOT NULL COMMENT '权限：0.root 1.管理员，2.普通',
       `status` INT NOT NULL COMMENT '状态: 0.申请入党 1.入党积极分子 2.发展对象 3.预备党员 4.正式党员 5.关系转出',
       `next_status` INT NOT NULL COMMENT '可转状态: 0.不可转 1.入党积极分子 2.发展对象 3.预备党员 4.正式党员',
       `is_complete` INT NOT NULL COMMENT '提交材料完整性，该字段由外围程序维护......想维护的看python脚本去吧=_=',
       `be_passpartyclass_date` DATE NOT NULL COMMENT '党课通过时间',
       `be_activist_date` DATE NOT NULL COMMENT '确定为积极分子时间',
       `be_target_date` DATE NOT NULL COMMENT '确定为发展对象的时间',
       `be_probationary_date` DATE NOT NULL COMMENT '确定为预备党员的时间',
       `be_fullmember_date` DATE NOT NULL COMMENT '确定为正式党员的时间',
       UNIQUE (`studentid`),
       PRIMARY KEY(`id`)
) DEFAULT CHARSET=UTF8;

CREATE TABLE `commit`(
	`uid` INT NOT NULL COMMENT '系统隐式ID',
	`rudangshenqingshu` INT NOT NULL COMMENT '入党申请书',
	`jijifenzikaochabiao` INT NOT NULL COMMENT '入党积极分子培养考察登记表',
	`zizhuan` INT NOT NULL COMMENT '自传',
	`sixianghuibao` INT NOT NULL COMMENT '阶段性思想汇报',
	`zhengshencailiao` INT NOT NULL COMMENT '政审材料',
	`zhengshenbaogao` INT NOT NULL COMMENT '政审报告',
	`qunzhongyijian` INT NOT NULL COMMENT '征求党内外群众书面意见',
	`dangxiaojieyezheng` INT NOT NULL COMMENT '党校培训结业证复印件',
	`tuiyourudang` INT NOT NULL COMMENT '推优入党材料',
	`zhibudahuijilu` INT NOT NULL COMMENT '发展为预备党员的支部大会记录（决议）',
	`fazhandangyuangongshi` INT NOT NULL COMMENT '发展党员公示材料',
	`rudangzhiyuanshu` INT NOT NULL COMMENT '入党志愿书',
	`banqizongjie` INT NOT NULL COMMENT '半期总结',
	`quannianzongjie` INT NOT NULL COMMENT '全年总结',
	`zhuanzhengshenqing` INT NOT NULL COMMENT '转正申请',
	`yubeidangyuankaochabiao` INT NOT NULL COMMENT '预备党员考察表',
	`zhuanzhenggongshi` INT NOT NULL COMMENT '转正公示材料',
	PRIMARY KEY(`uid`)
)DEFAULT CHARSET=UTF8;
